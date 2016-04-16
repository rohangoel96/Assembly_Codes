;Write an ALP that takes in a single user input from 1 to 7. The key pressed by the user must not be
;displayed. The program should display the 5th character (counting from 1) in file lab1.txt on the top
;left of the screen and 10th character (counting from 1) on the bottom right of the screen. The
;background of the display must be black. The foreground depends on the user input.
;If user input is ‘1’ then foreground must be blue
;If user input is ‘2’ then foreground must be green
;If user input is ‘3’ then foreground must be cyan
;If user input is ‘4’ then foreground must be red
;If user input is ‘5’ then foreground must be magenta
;If user input is ‘6’ then foreground must be brown
;If user input is ‘7’ then foreground must be white.
;For e.g if the 5th character is e and the 10th character of the file is j and the user input corresponds to
;(that is cyan) the display must be as shown below.
;Use Text mode of display. The file lab1.txt is available and can be downloaded into your MASM/BIN
;folder. The size of the file is atleast 20 bytes. The exit function from display is ‘@’.

.model	tiny
.486
.data
	numberinp db ?
	char5 db ?
	char10 db ?
	handle dw ?
	colors db 00000001b,00000010b, 00000011b, 00000100b, 00000101b, 00000110b, 00000111b 
	filename db "lab1.txt", 0
.code
.startup
	;user input
	mov ah, 08h
	int 21h
	sub al, 30h
	mov numberinp, al

	;open filename
	mov ah, 3dh
	mov al, 0
	lea dx, filename
	int 21h
	mov handle, ax

	;move to char 5
	mov ah, 42h
	mov al, 0
	mov bx, handle
	mov cx, 0
	mov dx, 4
	int 21h

	;read at pos5
	mov ah, 3fh
	mov bx, handle
	mov cx, 1
	lea dx, char5
	int 21h

	;move to char 10
	mov ah, 42h
	mov al, 0
	mov bx, handle
	mov cx, 0
	mov dx, 9
	int 21h

	;read at pos10
	mov ah, 3fh
	mov bx, handle
	mov cx, 1
	lea dx, char10
	int 21h

	;close the file
	mov ah, 3eh
	mov bx, handle
	int 21h

	;set video mode
	mov ah, 0
	mov al, 03h
	int 10h

	;move cursor to top left
	mov ah, 02h
	mov dh, 0 ;row
	mov dl, 0 ;column
	mov bh, 0
	int 10h

	;write at top left
	mov ah, 09h
	mov al, char5
	mov bh, 0
	mov dl, numberinp
	dec dl
	lea si, colors
	mov dh, 00
	add si, dx
	mov bl, [si]
	int 10h
	;move cursor to bottom rigjt
	mov ah, 02h
	mov dh, 24 ;row
	mov dl, 79 ;column
	mov bh, 0
	int 10h

	;write at top left
	mov ah, 09h
	mov al, char10
	mov bh, 0
	mov dl, numberinp
	dec dl
	lea si, colors
	mov dh, 00
	add si, dx
	mov bl, [si]
	int 10h

	;blocking
	mov ah, 07h
x1:	int 21h
	cmp al, '@'
	jnz x1
.exit
end