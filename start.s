.text
.globl _start

_start:

    mov %rsp, %rbp    # setup a new stack frame
    mov 0(%rbp), %rdi # get argc from the stack
    lea 8(%rbp), %rsi # get argv from the stack
    call main         # %rdi, %rsi are the first two args to main

    mov %rax, %rdi    # mov the return of main to the first argument
    movl $1, %eax     # System call number 1: exit()
    movl $0, %ebx     # Exits with exit status 0
    int $0x80         # Passes control to interrupt vector
                      # invokes system call—in this case system call
                      # number 1 with argument 0