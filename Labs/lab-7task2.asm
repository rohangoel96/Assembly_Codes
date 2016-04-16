.model tiny
.486
.data
.code
.startup
	;set video mode
	mov ah, 0
	mov al, 03h
	int 10h

	;color upper half
	mov ah, 09h
	mov al, " "
	mov bh, 0
	mov bl, 00011110b
	mov cx, 960
	int 10h

	;color lower half
		;move to 13th row
		mov ah, 02h
		mov dh, 12 ;row
		mov dl, 0 ;column
		mov bh, 0
		int 10h
	mov ah, 09h
	mov al, " "
	mov bh, 0
	mov bl, 01111010b
	mov cx, 1040
	int 10h

	mov dl, 0 ;handle column for typing

more:
	;char input
	mov ah, 08h
	int 21h

	;typing in 1st half
x2:	mov dh, 00

		;correct position
		mov ah, 02h
		;dh row handled
		;dl column handled
		mov bh, 0
		int 10h

		;type
		mov ah, 09h
		;al (char to be typed) handled above
		mov bh, 0
		mov bl, 00011110b
		mov cx, 1
		int 10h

	;typing in 2nd half
	mov dh, 12

		;correct position
		mov ah, 02h
		;dh row handled
		;dl column handled
		mov bh, 0
		int 10h
		
		;type
		mov ah, 09h
		;al (char to be typed) handled above
		mov bh, 0
		mov bl, 01111010b
		mov cx, 1
		int 10h

	;handle more characters
	inc dl
	
	cmp al, "$"
	jnz more

	mov ah, 08h
	int 21h
	cmp al, "#"
	jnz x2 

.exit
end