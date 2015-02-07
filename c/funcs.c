#include <stdlib.h>
#include <stdio.h>

void *my_malloc() {
    return malloc(3000);
}

void my_putc(char c) {
    putchar(c);
}

unsigned char my_getchar(void) {
    char c = getchar();
    return c;
}

void set_index(char *ptr, char value) {
    ptr[0] = value;
}

int six() {
    return 6;
}

int avg(int x, int y, int z) {
    int sum = x + y + z;
    int res = sum / 3;
    return res;
}
