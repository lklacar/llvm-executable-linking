#define SYSCALL_WRITE 1

int sys_write(unsigned fd, const char *buf, unsigned count) {
    unsigned ret;

    asm volatile
    (
        "syscall"
        : "=a"(ret)
        : "a"(SYSCALL_WRITE), "D"(fd), "S"(buf), "d"(count)
        : "rcx", "r11", "memory"
    );

    return ret;
}

int main() {
    const char text[] = "Hello world!\n";

    sys_write(1, text, sizeof(text));

    return 1;
}