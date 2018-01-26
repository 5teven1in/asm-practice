global _start

section .data
n dd 0

section .text
factorial:
  push rbp
  mov rbp, rsp
  sub rsp, 0x10
  mov qword [rbp - 0x8], rdi
  cmp qword [rbp - 0x8], 1
  jne Lrecur
  mov rax, 1
  jmp Lexit

Lrecur:
  mov rbx, qword [rbp - 0x8]
  dec rbx
  mov rdi, rbx
  call factorial
  imul rax, qword [rbp - 0x8]

Lexit:
  mov rsp, rbp
  pop rbp
  ret

_start:
  mov rax, 0        ; read syscall number
  mov rdi, 0        ; 0 for stdin
  mov rsi, n        ; buf address
  mov rdx, 1        ; input length
  syscall

  mov rax, n
  mov rax, [rax]
  sub rax, 0x30     ; convert string to int
  mov rdi, rax      ; parameter
  call factorial    ; calculate n factorial

  mov rax, 60       ; exit syscall number
  mov rdi, 0
  syscall

