[org 0x0100]
jmp start

t1 db 'Top row 1$'
t2 db 'Top row 2$'
t3 db 'Top row 3$'
t4 db 'Top row 4$'
t5 db 'Top row 5$'
b1 db 'Bottom row 1$'
b2 db 'Bottom row 2$'
b3 db 'Bottom row 3$'
b4 db 'Bottom row 4$'
b5 db 'Bottom row 5$'

start:
 call clearscr

 mov dh,0
 mov si,t1
 call PrintAt

 mov dh,1
 mov si,t2
 call PrintAt

 mov dh,2
 mov si,t3
 call PrintAt

 mov dh,3
 mov si,t4
 call PrintAt

 mov dh,4
 mov si,t5
 call PrintAt

 mov dh,20
 mov si,b1
 call PrintAt

 mov dh,21
 mov si,b2
 call PrintAt

 mov dh,22
 mov si,b3
 call PrintAt

 mov dh,23
 mov si,b4
 call PrintAt

 mov dh,24
 mov si,b5
 call PrintAt

 sub sp,480                 ; local array on stack (240 words)
 mov bp,sp                  ; bp = address of saving array
again:
 call ScrollUp
 call Delay
 call ScrollDown
 call Delay
 jmp again

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

PrintAt:                    ; dh = row, si = string
 mov ah,2
 mov bh,0
 mov dl,0
 int 10h
 mov dx,si
 mov ah,9
 int 21h
 ret

ScrollUp:
 push ds
 push es
 cld
 mov ax,0B800h              ; video memory
 mov ds,ax
 mov ax,cs
 mov es,ax
 xor si,si
 mov di,bp
 mov cx,240                 ; 3 rows x 80 columns
 rep movsw                  ; save top 3 rows in array
 mov ax,0B800h
 mov es,ax
 mov si,480                 ; start of row 3
 xor di,di                  ; start of row 0
 mov cx,1760                ; 22 rows
 rep movsw                  ; move screen up
 mov ax,0720h               ; blank space
 mov cx,240
 rep stosw                  ; clear last 3 rows
 pop es
 pop ds
 ret

ScrollDown:
 push ds
 push es
 mov ax,0B800h
 mov ds,ax
 mov es,ax
 std                        ; copy backwards
 mov si,3518                ; last word of row 21
 mov di,3998                ; last word of row 24
 mov cx,1760
 rep movsw                  ; move screen down
 cld
 mov ax,cs
 mov ds,ax
 mov si,bp
 xor di,di
 mov cx,240
 rep movsw                  ; put saved 3 rows back on top
 pop es
 pop ds
 ret

Delay:
 push cx
 push dx
 mov dx,30
d1:
 mov cx,0FFFFh
d2:
 loop d2
 dec dx
 jnz d1
 pop dx
 pop cx
 ret