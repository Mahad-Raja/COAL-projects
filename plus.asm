
[org 0x0100]
jmp start

clearscr:
    mov ax, 0xB800
    mov es, ax
    mov di, 0

nextchar:
    mov word [es:di], 0x0720
    add di, 2
    cmp di, 4000
    jne nextchar
    ret

printing:
    mov ax, 0xB800
    mov es, ax

    ; Vertical line
    mov di, 1040          ; Row 13, column 0

vertical:
    mov word [es:di], 0x072A
    add di, 160           ; One row down
    cmp di, 2960
    jl vertical

    ; Horizontal line
    mov di, 1960          ; Row 12, column 20
    mov cx, 40

horizontal:
    mov word [es:di], 0x072A
    add di, 2             ; One column right
    loop horizontal

    ret

start:
    call clearscr
    call printing

    mov ax, 0x4c00
    int 0x21
