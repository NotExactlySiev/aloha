#pragma once
#include <stdint.h>

// Compression methods used in Exact archives and compressed executables.

// The decompressed size reported by the archive. Allocate this much for the
// output buffer of decompression.
uint32_t exact_get_decompressed_size(const void *compressed_data);
int exact_decompress(void *decompressed_data, const void *compressed_data);

// Returns the compressed size, rounded up? Expects the output buffer to be at
// least as big as the input data.
uint32_t exact_compress(void *compressed_data, const void *data, uint32_t size);
