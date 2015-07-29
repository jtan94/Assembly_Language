.section .data

n:
.long 5

.section .text
.globl _start
_start:
movl $1, %eax  #i
movl $0, %ebx 


comparison:
cmpl n,%eax
jle summation
jg exit

summation:
addl %eax, %ebx
addl $1, %eax
jmp comparison

exit:
movl $1,%eax
int $0x80


