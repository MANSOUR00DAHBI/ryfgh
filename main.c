#include<stdio.h>
// kernel.c
void kmain(void) {
    const char* str = "Hello from Mini Linux!";

    // Use BIOS interrupt to print string
    char* vidmem = (char*)0xB8000;  // Video memory address for color text mode
    int i;
    for (i = 0; str[i] != '\0'; i++) {
        vidmem[i * 2] = str[i];
        vidmem[i * 2 + 1] = 0x0F;  // Attribute byte for white text on black background
    }

    while (1); // Infinite loop to keep kernel running
}