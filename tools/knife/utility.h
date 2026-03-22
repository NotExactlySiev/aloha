#pragma once
#include <stddef.h>

int output_file_openat(int dirfd, char *path);
void *output_file_map(int fd, size_t size);
void output_file_truncate(int fd, size_t size);
void output_file_close(int fd);
void *map_file_for_read(char *path, size_t *out_size);
