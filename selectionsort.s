#Jessica Tan

.section .data

message:
    .ascii "iakeifjgneil\n"
length:
   .long 12
.section .text

.globl _start

_start:
   movl length, %eax          #creating the length of the list
   decl %eax
   jmp fillslot



fillslot:
   movl $1, %esi              #starting our range function with value 1
   movl $0, %ecx
   cmpl $0, %eax
   jg location
   jmp done

location:
  movl %eax, %edi
  incl %edi
  cmpl %esi, %edi
  jg comparison
  jmp temp

comparison:
  movb message(,%ecx,1), %bl
  cmpb message( ,%esi,1), %bl
  jl swap
  jmp incLocation

swap:
   movl %esi,%ecx
   jmp incLocation

incLocation:
   incl %esi
   jmp location

temp:
   movb message(,%eax,1),%dl
   movb message(,%ecx,1),%dh
   movb %dh, message(, %eax, 1)
   movb %dl, message(, %ecx, 1)
   jmp decrement

decrement:
  decl %eax
  jmp fillslot

done:
  movl $4, %eax
  movl $1, %ebx
  movl $message, %ecx
  movl length, %edx
  int $0x080

  movl $1, %eax
  movl $0, %ebx
  int $0x080

