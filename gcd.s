#greatest common denominator 
#Using Java 32 bit assembly language
.section .data

m:
   .long 120
n:
   .long 10
answer:
   .long 0
.section .text
.globl _start
_start:
   pushl m #12(%ebp)
   pushl n  #8(%ebp)
   call gcd
   addl $8, %esp
   movl %eax, answer
   movl answer, %ebx
   movl $1, %eax
   int $0x080

gcd:
   pushl %ebp
   movl %esp, %ebp
   cmpl $0, 8(%ebp)
   jne recurse
   movl 12(%ebp),%eax
   movl %ebp, %esp
   popl %ebp
   ret

recurse:
   movl 12(%ebp), %eax
   movl 8(%ebp), %ebx
   movl $0, %edx
   cdq 
   idivl %ebx
   pushl %ebx #n value 12(%ebp)
   pushl %edx # m%n value 8(%ebp)
   call gcd
   addl $8, %esp
   movl %ebp, %esp
   popl %ebp
   ret

