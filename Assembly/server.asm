; Linux x86_64 assembly – servidor HTTP mínimo
section .data
response db "HTTP/1.0 200 OK",13,10,"Content-Type: text/plain",13,10,13,10,"Hello from Assembly"
resp_len equ $ - response

section .bss
sockfd resd 1
client resd 1

section .text
global _start
_start:
    ; socket()
    mov rax, 41
    mov rdi, 2
    mov rsi, 1
    xor rdx, rdx
    syscall
    mov [sockfd], eax

    ; preparar sockaddr_in (omitido aquí por brevedad – necesitaría bind/listen)
    ; ...

    ; salir
    mov rax, 60
    xor rdi, rdi
    syscall
; Nota: código real requeriría bind, listen, accept con struct sockaddr_in.
