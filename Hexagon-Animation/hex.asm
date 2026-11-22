org 0x0100
jmp start

clearscr:
mov ax,0xB800
mov es,ax
mov di,0
nextchar:
mov word[es:di],0x0720
add di,2
cmp di,4000
jne nextchar
ret

delay:
        push cx
        mov cx, 0xffff
dl1:    loop dl1
        mov cx, 0xffff
dl2:    loop dl2
        pop cx
        ret

line:                        ; di = start spot, bx = step, cx = how many, ax = character
nextpoint:
mov word[es:di],ax           ; put the character (# or *)
call delay                   ; wait, so we can see it
mov word[es:di],0x0E23       ; put the yellow # back
add di,bx                    ; move to the next spot
loop nextpoint
ret


hexagon:                     ; ax = what to print (# or *)
mov di,400                   ; row 2, column 40 (top point)
mov bx,164                   ; one row down, two columns right
mov cx,5
call line

mov di,1216                  ; row 7, column 48
mov bx,160                   ; straight down
mov cx,4
call line

mov di,1852                  ; row 11, column 46
mov bx,156                   ; one row down, two columns left
mov cx,4
call line

mov di,2156                  ; row 13, column 38
mov bx,-164                  ; one row up, two columns left
mov cx,3
call line

mov di,1664                  ; row 10, column 32
mov bx,-160                  ; straight up
mov cx,4
call line

mov di,1024                  ; row 6, column 32
mov bx,-156                  ; one row up, two columns right
mov cx,4
call line
ret


start:
call clearscr

mov ax,0x0E23                ; yellow #
call hexagon                 ; draw the hexagon

mov ax,0x0F2A                ; white *
call hexagon                 ; move the star around it

mov ax,0x4c00
int 0x21