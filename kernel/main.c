void kernel_main(void) {
    volatile char* vram = (volatile char*)0xb8000;

    vram[0] = 'H';
    vram[1] = 0x0f;

    while (1) {
        __asm__("hlt");
    }
}
