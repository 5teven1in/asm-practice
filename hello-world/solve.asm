global _start

section .data
msg db "Hello, world!", 0xa
len equ $ - msg

section .text
_start:
  mov rax, 1        ; write syscall number
  mov rdi, 1        ; 1 for stdout
  mov rsi, msg      ; buf address
  mov rdx, len      ; output length
  syscall

  mov rax, 60       ; exit syscall number
  mov rdi, 0
  syscall
