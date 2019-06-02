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

char* itoa(int num, char* str, int base) 
{ 
    int i = 0; 
    int isNegative = 0; 
  
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0) 
    { 
        str[i++] = '0'; 
        str[i] = '\0'; 
        return str; 
    } 
  
    // In standard itoa(), negative numbers are handled only with  
    // base 10. Otherwise numbers are considered unsigned. 
    if (num < 0 && base == 10) 
    { 
        isNegative = 1; 
        num = -num; 
    } 
  
    // Process individual digits 
    while (num != 0) 
    { 
        int rem = num % base; 
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0'; 
        num = num/base; 
    } 
  
    // If number is negative, append '-' 
    if (isNegative) 
        str[i++] = '-'; 
  
    str[i] = '\0'; // Append string terminator 
  
    // Reverse the string 
    // reverse(str, i); 
  
    return str; 
} 


int main() {
    int i, n, t1 = 0, t2 = 1, nextTerm;
    n = 2000000000;

    for (i = 1; i <= n; ++i)
    {
        nextTerm = t1 + t2;
        t1 = t2;
        t2 = nextTerm;
    }
 
    char str[100]; 
    itoa(t2, str, 10);
    sys_write(1, str, sizeof(str));

    return t2;
}