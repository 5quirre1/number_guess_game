section .data
    prompt_msg db 'type "a" greg', 0xA
    prompt_len equ $ - prompt_msg

    win_msg db 'wow...', 0xA
    win_len equ $ - win_msg

    lose_msg db 'are you dumb', 0xA
    lose_len equ $ - lose_msg

section .bss
    input resb 1

section .text
    global _start

_start:
    ; print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_msg
    mov edx, prompt_len
    int 0x80

    ; read 1 byte for input greg
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 1
    int 0x80

    ; check if a
    mov al, byte [input]
    cmp al, 'a'
    je win

    ; lose
    mov eax, 4
    mov ebx, 1
    mov ecx, lose_msg
    mov edx, lose_len
    int 0x80
    jmp exit

win:
    mov eax, 4
    mov ebx, 1
    mov ecx, win_msg
    mov edx, win_len
    int 0x80

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
  
