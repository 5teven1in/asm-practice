global _start

section .data
msg db "Hello, world!", 0xa
len equ $ - msg

section .text
_start:
  ; do something

  mov rax, 60       ; exit syscall number
  mov rdi, 0
  syscall
