#pragma once
#include <stdint.h>

// Compression methods used in EXACT Archive and compressed executables

// the decompressed size reported by the archive (how much to allocate)
uint32_t exact_get_decompressed_size(const void *compressed_data);
// return the compressed size, rounded up? expects the buffer to be at
// least as big as the input data
int exact_decompress(void *decompressed_data, const void *compressed_data);
uint32_t exact_compress(void *compressed_data, const void *data, uint32_t data_size);
