#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    // TODO: height and row size etc from command line
    int height = 8;
    bool bitmap_row[16][height][8];

    printf("P1\n%d %d\n", 16*8, 8*8);

    while (1) {
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < height; j++) {
                int row = getchar();
                if (row == EOF)
                    exit(0);
                for (int k = 7; k >= 0; k--) {
                    bitmap_row[i][j][k] = row & (1 << k);
                }
            }
        }

        for (int j = 0; j < height; j++) {
            for (int i = 0; i < 16; i++) {
                for (int k = 7; k >= 0; k--) {
                    putchar(bitmap_row[i][j][k] ? '1' : '0');
                    putchar(' ');
                }
            }
            putchar('\n');
        }
    }
}