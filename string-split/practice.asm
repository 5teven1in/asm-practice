global _start

section .data
msg times 10 db 0
len equ $ - msg
newline db 0xa

section .text
_start:
  mov rax, 0        ; read syscall number
  mov rdi, 0        ; 0 for stdin
  mov rsi, msg
  mov rdx, len
  syscall

  ; do something

Lexit:
  mov rax, 60
  mov rdi, 0
  syscall
