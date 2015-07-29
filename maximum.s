
#implement a list of numbers as an array
#search for the largest
#do not use sentinel
#use first value of array as the length

.section .data
items:
    .long 5,2,7,4,9,4

.section .text

.globl _start
_start:
    movl $1, %esi
    movl items, %ecx      #items[0] is my length
    movl items(,%esi,4), %ebx      #items[1] is max

For:
   cmpl %esi, %ecx
   jge compareItems
   jmp Done
compareItems:
   cmpl items(,%esi,4),%ebx
   jl Update
   jmp Increment
Update:
   movl items(,%esi,4),%ebx
   jmp Increment
Increment:
   incl %esi
   jmp For
Done:
   movl $1, %eax
   int $0x080
