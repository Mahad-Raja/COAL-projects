[org 0x0100]
jmp start

row:    dw 0                ; CurrentRow
col:    dw 0                ; CurrentCol
dir:    db 'R'              ; Direction

clrscr:
        mov ax, 0xb800
        mov es, ax
        mov di, 0
nextloc:
        mov word [es:di], 0x0720    ; space
        add di, 2
        cmp di, 4000
        jne nextloc
        ret

; ---------- DI = (row*80 + col) * 2 ----------
getpos:
        push ax
        push dx                     ; MUL changes DX
        mov ax, 80
        mul word [row]              ; AX = row * 80
        add ax, [col]               ; AX = row*80 + col
        shl ax, 1                   ; x2 (each cell = 2 bytes)
        mov di, ax
        pop dx
        pop ax	
        ret

; ---------- delay ----------
delay:
        push cx
        mov cx, 0xffff
dl1:    loop dl1
        mov cx, 0xffff
dl2:    loop dl2
        pop cx
        ret

; ---------- move star by one cell ----------
movingstar:
        push ax
        push es
        push di

        mov ax, 0xb800
        mov es, ax

        call getpos
        mov word [es:di], 0x0720    ; erase star at old position

        cmp byte [dir], 'R'
        je right
        cmp byte [dir], 'D'
        je down
        cmp byte [dir], 'L'
        je left
        jmp up

right:  cmp word [col], 79          ; check if reached last column
        jne goright
        mov byte [dir], 'D'         ; turn down
        inc word [row]
        jmp draw
goright:
        inc word [col]
        jmp draw

down:   cmp word [row], 24          ; check if reached last row
        jne godown
        mov byte [dir], 'L'         ; turn left
        dec word [col]
        jmp draw
godown: inc word [row]
        jmp draw

left:   cmp word [col], 0           ; check if reached first column
        jne goleft
        mov byte [dir], 'U'         ; turn up
        dec word [row]
        jmp draw
goleft: dec word [col]
        jmp draw

up:     cmp word [row], 0           ;check if reached first row
        jne goup
        mov byte [dir], 'R'         ; turn right
        inc word [col]
        jmp draw
goup:   dec word [row]	

draw:   call getpos
        mov word [es:di], 0x072A    ; '*' at new position

        pop di
        pop es
        pop ax
        ret

; ---------- main ----------
start:  call clrscr

        mov ax, 0xb800              ; show star at starting cell
        mov es, ax
        call getpos
        mov word [es:di], 0x072A
        mov cx, 208                 ; 80+24+80+24 calls
mainloop:
        call delay
        call movingstar
        loop mainloop

        mov ax, 0x4c00           
        int 0x21
