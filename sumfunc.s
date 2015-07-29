#Jessica Tan


#def sum(n):
#   theSum = 0
#   for i in n:
#       theSum= theSum + i
#   return theSum
#a=5
#result=sum(a)
#print(result)

.section .data

n:
   .long 5  

result:
   .long 0

.section .text

.globl _start
_start:
   pushl n
   call sum

   addl $4, %esp
   movl %eax, result

   movl result, %ebx
   movl $1, %eax
   int $0x080

sum:
   pushl %ebp
   movl %esp, %ebp
   subl $4, %esp  #room for theSum -4(%ebp)
   subl $4, %esp #room for i -8(%ebp)
   movl $0, -4(%esp)
   movl $1, -8(%esp)
   movl -4(%ebp), %ebx
   movl 8(%ebp), %eax   #N!
   movl -8(%ebp), %ecx  #i

   jmp while
while:
   cmpl %ecx, %eax
   jge add
   jmp done
add:
   addl %ecx,%ebx
   incl %ecx 
   jmp while
done:
   movl %ebx, %eax
   movl %ebp, %esp
   popl %ebp
   ret

