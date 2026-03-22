#include "utility.h"
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

int output_file_openat(int dirfd, char *path)
{
    int rc = openat(dirfd, path, O_RDWR | O_CREAT, 0644);
    if (rc == -1) {
        printf("openat error: %s %d\n", strerror(errno), errno);
        exit(1);
    }
    return rc;
}

void output_file_close(int fd)
{
    int rc = close(fd);
    if (rc == -1) {
        printf("close error: %s %d\n", strerror(errno), errno);
        exit(1);
    }
}

void *output_file_map(int fd, size_t size)
{
    int rc = ftruncate(fd, size);
    if (rc == -1) {
        printf("ftruncate error: %s %d\n", strerror(errno), errno);
        exit(1);
    }

    void *ret = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (ret == MAP_FAILED) {
        printf("mmap error: %s %d\n", strerror(errno), errno);
        exit(1);
    }
    return ret;
}

void output_file_truncate(int fd, size_t size)
{
    int rc = ftruncate(fd, size);
    if (rc == -1) {
        printf("ftruncate error: %s %d\n", strerror(errno), errno);
        exit(1);
    }
}

void *map_file_for_read(char *path, size_t *out_size)
{
    int fd = open(path, O_RDONLY);
    if (fd == -1) {
        printf("open error: %s %d\n", strerror(errno), errno);
        exit(1);
    }

    struct stat st;
    int rc = fstat(fd, &st);
    if (rc == -1) {
        printf("fstat error: %s %d\n", strerror(errno), errno);
        exit(1);
    }

    size_t size = st.st_size;
    void *p = mmap(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (p == MAP_FAILED) {
        printf("mmap error: %s %d\n", strerror(errno), errno);
        exit(1);
    }

    *out_size = size;
    return p;
}
