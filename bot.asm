section .data
msg db "Hello from bot!",0

section .text
global _start

_start:
    mov edx,len
    mov ecx,msg
    mov ebx,1
    mov eax,4
    int 0x80

    mov eax,1
    int 0x80

section .data
len equ $-msg
