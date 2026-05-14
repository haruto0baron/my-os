void kernel_main(void)
{
    volatile char* vga = (volatile char*)0xB8000;

    const char* msg = "Hello MyOS!";

    for (int i = 0; msg[i] != '\0'; i++) {
        vga[i * 2] = msg[i];
        vga[i * 2 + 1] = 0x0F;
    }

    while (1) {
        __asm__("hlt");
    }
}
