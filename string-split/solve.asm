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

  mov rbx, rax      ; use rbx as loop counter because rcx will be filled with next instruction after syscall
  mov rsi, msg
lLoop:
  cmp rbx, 0
  jbe Lexit

  mov rax, 1        ; write syscall number
  mov rdi, 1        ; 1 for stdout
  mov rdx, 1
  syscall
  inc rsi           ; increase buf address

  push rsi          ; save rsi value
                    ; write a newline
  mov rax, 1
  mov rsi, newline  ; it will change rsi value
  syscall

  pop rsi           ; restore rsi value

  dec rbx
  jmp lLoop

Lexit:
  mov rax, 60
  mov rdi, 0
  syscall
