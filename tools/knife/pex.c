#include "press.h"
#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int output_file_open(char *path);
void *output_file_map(int fd, size_t size);

#define HEADER_SIZE 0x800

typedef struct [[gnu::packed]] {
    uint8_t header[HEADER_SIZE];
    uint8_t data[];
} ExeLayout;

int pex_compress(const void *data, size_t size, char *output_path)
{
    // const void *header = data;
    // const void *compressed_data = data + HEADER_SIZE;
    const ExeLayout *input_pex = data;

    // Round up to block.
    size_t srcsize = (((size - sizeof(ExeLayout)) + 7) >> 3) << 3;

    // Add some room to be safe. Shouldn't be needed.
    size_t dstsize = srcsize * 1.1;

    size_t output_size = sizeof(ExeLayout) + dstsize;
    int output_fd = output_file_open(output_path);
    ExeLayout *output_pex = output_file_map(output_fd, output_size);

    memcpy(output_pex->header, input_pex->header, HEADER_SIZE);
    exact_compress(output_pex->data, input_pex->data, srcsize);
    //dstsize = comp(srcsize, compressed_data, pex->data);
    int rc = ftruncate(output_fd, sizeof(ExeLayout) + dstsize);
    if (rc == -1) {
        printf("ftruncate error: %s %d\n", strerror(errno), errno);
        exit(1);
    }
    close(output_fd);

    printf("Compressed %lu bytes to %lu bytes\n", srcsize, dstsize);
    return 0;
}

int pex_decompress(const void *data, size_t size, char *output_path)
{
    const ExeLayout *input_pex = data;

    // uint32_t expected_size = be32toh(pex->size);
    uint32_t expected_size = exact_get_decompressed_size(input_pex->data);
    //uint32_t expected_size = be32toh(pex->size);
    if (size > expected_size) {
        // Warn but continue.
        printf("The compressed size is larger than decompressed size.\n");
    }

    printf("  Compressed Size: %ld\n", size);
    printf("Uncompressed Size: %d (0x%x)\n", expected_size, expected_size);

    int output_fd = output_file_open(output_path);
    ExeLayout *output_pex = output_file_map(output_fd, HEADER_SIZE + expected_size);

    // void *output_header = output_buffer;
    // void *output_data = output_buffer + HEADER_SIZE;

    memcpy(output_pex->header, input_pex->header, HEADER_SIZE);
    //decomp(pex->data, output_data);
    exact_decompress(output_pex->data, input_pex->data);
    close(output_fd);
    return 0;
}
