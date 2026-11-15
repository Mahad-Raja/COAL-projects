[org 0x0100]
jmp start
num1: dw 44
num2: dw 13
divisor: dw 2
ifdivided: db 'even'
count1: dw 4
ifnotdivided: db 'odd'
count2: dw 3

clearsrc:
mov ax,0xB800
mov es,ax
mov di,0
nextchar:
mov word [es:di],0x0720     ; fixed: added "word"
add di,2
cmp di,4000
jne nextchar
ret

; printing: SI = text address, CX = length, DI = screen position
printing:
mov ah,0x07
printnext:
mov al,[si]
mov [es:di],ax
add di,2
add si,1
loop printnext
ret                         ; plain ret, because nothing was pushed

check:
push bp
mov bp,sp
mov ax,0xB800
mov es,ax

; ---------- first number ----------
mov ax,[bp+14]              ; num1
mov dx,0                    ; clear DX before div
mov bx,[bp+16]              ; divisor
div bx                      ; AX = quotient, DX = remainder
mov di,0                    ; print on the first row
cmp dx,0
je first_even
mov si,[bp+6]               ; remainder not 0, so "odd"
mov cx,[bp+4]
jmp first_print
first_even:
mov si,[bp+12]              ; remainder is 0, so "even"
mov cx,[bp+10]
first_print:
call printing

; ---------- second number ----------
mov ax,[bp+8]               ; num2
mov dx,0
div bx                      ; BX still holds the divisor
mov di,160                  ; print on the second row
cmp dx,0
je second_even
mov si,[bp+6]
mov cx,[bp+4]
jmp second_print
second_even:
mov si,[bp+12]
mov cx,[bp+10]
second_print:
call printing

pop bp                      ; added: put the old bp back
ret 14                      ; 7 pushed words = 14 bytes

start:
call clearsrc
mov ax,[divisor]
push ax
mov ax,[num1]
push ax
mov ax,ifdivided
push ax
mov cx,[count1]
push cx
mov ax,[num2]
push ax
mov ax,ifnotdivided
push ax
mov cx,[count2]
push cx
call check

mov ax,0x4C00
int 0x21