#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define USAGE   \
    "jfcomp <command> <input file> <output file>\n"\
    "\n"    \
    "Commands are:\n"   \
    "\tcomp, decomp\n"  

#define HEADER_SIZE     0x800
#define READ_SAFE(d,s,n,fd)   \
    if ((n) != fread(d, s, n, fd)) \
    printf("%d byte read err\n", __LINE__);

#define COM_DECOMPRESS  0
#define COM_COMPRESS    1

uint8_t* decomp(const uint8_t*, uint8_t*);
size_t comp(size_t, const uint8_t*, uint8_t*);

int decompress_file(FILE*, FILE*);
int compress_file(FILE*, FILE*);

int decompress_file(FILE* infile, FILE* outfile)
{
    uint8_t header[HEADER_SIZE];
    uint8_t* src;
    uint8_t* dst;
    union { uint8_t bytes[4]; uint32_t val; } size;
    uint32_t srcsize;
    uint8_t* endp;

    // get file size and set buffer
    fseek(infile, 0, SEEK_END);
    srcsize = ftell(infile) - HEADER_SIZE - 4;
    src = malloc(srcsize);
    fseek(infile, 0, SEEK_SET);

    READ_SAFE(header, HEADER_SIZE, 1, infile);
    // read big endian word
    READ_SAFE(&size.bytes[3], 1, 1, infile);
    READ_SAFE(&size.bytes[2], 1, 1, infile);
    READ_SAFE(&size.bytes[1], 1, 1, infile);
    READ_SAFE(&size.bytes[0], 1, 1, infile);

    READ_SAFE(src, 1, srcsize, infile);

    printf("  Compressed Size: %d\n", 
            srcsize);
    printf("Uncompressed Size: %d (0x%x)\n", 
            size.val, size.val);

    dst = malloc(size.val);
    memset(dst, 0, size.val);
    endp = decomp(src, dst);

    fwrite(header, HEADER_SIZE, 1, outfile);
    fwrite(dst, 1, size.val, outfile);

    free(src);
    free(dst);
}

int compress_file(FILE* infile, FILE* outfile)
{
    uint8_t header[HEADER_SIZE];
    uint8_t* src;
    uint8_t* dst;
    size_t srcsize, dstsize;
    size_t rc;

    fseek(infile, 0, SEEK_END);
    srcsize = ftell(infile) - HEADER_SIZE;
    srcsize = ((srcsize + 7) >> 3) << 3; // round up to block
    src = malloc(srcsize);
    dst = malloc(srcsize + srcsize/8);
    printf("allocated %lu\n", srcsize + srcsize/8);

    fseek(infile, 0, SEEK_SET);
    READ_SAFE(header, HEADER_SIZE, 1, infile);
    READ_SAFE(src, 1, srcsize, infile);

    dstsize = comp(srcsize, src, dst);
    printf("comped is %lu\n", dstsize);

    rc = srcsize; 
    printf("rc is %lu\n", rc);
    
    fwrite(header, HEADER_SIZE, 1, outfile);
    // write big endian word
    fputc(rc >> 24, outfile);
    fputc(0xff & (rc >> 16), outfile);
    fputc(0xff & (rc >> 8), outfile);
    fputc(0xff & rc, outfile);
    fwrite(dst, 1, dstsize, outfile);
    
    free(src);
    free(dst);
}   

int main(int argc, char **argv)
{
    FILE* infile;
    FILE* outfile;

    int command;

    if (argc != 4) {
        printf(USAGE);
        return -1;
    }

    argv++;
    
    if (strcmp(*argv, "decomp") == 0)
        command = COM_DECOMPRESS;
    else if (strcmp(*argv, "comp") == 0)
        command = COM_COMPRESS;
    else {
        printf(USAGE);
        return -1;
    }

    argv++;

    infile = fopen(*argv++, "r");
    if (!infile) {
        printf("FUCK\n");
        return -1;
    }

    outfile = fopen(*argv++, "w");    
    if (!outfile) {
        printf("FUCK\n");
        return -1;
    }

    switch (command) {
    case COM_DECOMPRESS:
        decompress_file(infile, outfile);
        break;
    case COM_COMPRESS:
        compress_file(infile, outfile);
        break;
    }

    fclose(infile);
    fclose(outfile);

    return 0;
}
