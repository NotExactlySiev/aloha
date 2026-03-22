#include "types.h"
#include "utility.h"
#include "press.h"
#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

#define EAR_MAX_NODES 256
#define EAR_MAX_CHILDREN 16
#define EAR_HEADER_TERMINATOR -1
#define EAR_HEADER_SEPARATOR 0

static int make_dir(int dirfd, char *name)
{
    int rc = mkdirat(dirfd, name, 0755);
    if (rc == -1) {
        printf("mkdirat error: %s %d\n", strerror(errno), errno);
        exit(1);
    }

    int subdirfd = openat(dirfd, name, O_DIRECTORY);
    if (subdirfd == -1) {
        printf("openat dir error: %s %d\n", strerror(errno), errno);
        exit(1);
    }

    return subdirfd;
}

static bool is_directory(const void *data)
{
    const u32 *p = data;
    u32 first = 0;
    u32 prev = first;
    for (int i = 0; i < EAR_MAX_CHILDREN; i++) {
        u32 offset = be32toh(p[i]);
        if (first == 0)
            first = offset;
        if (offset == EAR_HEADER_TERMINATOR && (i + 1) * 4 == first)
            return true;
        if (offset != 0 && offset <= prev)
            break;
    }
    return false;
}

static void extract_directory(int dirfd, const void *data)
{
    // Read the header. Increment the index. For files, extract them. For dirs,
    // make a directory and call this recursively.

    const u32 *offsets = data;
    for (int i = 0; be32toh(offsets[i]) != EAR_HEADER_TERMINATOR; i++) {
        u32 offset = be32toh(offsets[i]);
        if (offset == EAR_HEADER_SEPARATOR) {
            continue;
        }

        const void *section = data + offset;

        char name[32] = { 0 };
        snprintf(name, sizeof(name), "%d", i);

        if (is_directory(section)) {
            int subdirfd = make_dir(dirfd, name);
            extract_directory(subdirfd, section);
        } else {
            int filefd = output_file_openat(dirfd, name);
            u32 expected_size = exact_get_decompressed_size(section);
            void *output_buffer = output_file_map(filefd, expected_size);
            exact_decompress(output_buffer, section);
            output_file_close(filefd);
        }
    }
}

int ear_extract(const void *data, size_t size, char *output_path)
{
    int dirfd = make_dir(AT_FDCWD, output_path);
    extract_directory(dirfd, data);
    return 0;
}
