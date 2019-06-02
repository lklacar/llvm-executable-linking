// #include <stdio.h>

#define SYSCALL_EXIT 60
#define SYSCALL_WRITE 1

void sys_exit(int error_code)
{
    asm volatile
    (
        "syscall"
        : 
        : "a"(SYSCALL_EXIT), "D"(error_code)
        : "rcx", "r11", "memory"
    );
}

int sys_write(unsigned fd, const char *buf, unsigned count)
{
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


int _start() {
    const char hwText[] = "Hello world!\n";

    sys_write(1, hwText, sizeof(hwText));
    sys_exit(12);

    return 0;
}