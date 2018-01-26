global _start

section .data
n dd 0

section .text

_start:
  mov rax, 0        ; read syscall number
  mov rdi, 0        ; 0 for stdin
  mov rsi, n        ; buf address
  mov rdx, 1        ; input length
  syscall

  ; do something

  mov rax, 60       ; exit syscall number
  mov rdi, 0
  syscall

