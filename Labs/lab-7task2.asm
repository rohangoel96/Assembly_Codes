.model	tiny
.486
.data
	text db " " 
.code
.startup
	;set video mode
	mov ah, 0
	mov al, 03h
	int 10h

	;color first half
	mov dh, 0
	
x2:	mov ah, 09h
	mov al, text
	mov bh, 0
	mov bl, 00011110b
	mov cx, 80
	int 10h
		
		;move the cursor for next line
		mov ah, 02h
		;dh handled by loop
		mov dl, 0 
		mov bh, 00
		int 10h
				
	inc dh
	cmp dh, 13
	jnz x2
	
	;color second half
	mov dh, 13
	
x3:	mov ah, 09h
	mov al, text
	mov bh, 0
	mov bl, 01111010b
	mov cx, 80
	int 10h
		
		;move the cursor for next line
		mov ah, 02h
		;dh handled by loop
		mov dl, 0 
		mov bh, 00
		int 10h
		
	inc dh
	cmp dh, 25
	jnz x3


	;text typing
	mov dl, 0

x4:	mov ah, 01h
	int 21h

	mov ah, 02h
	mov dh, 0
	;dl handled above
	mov bh, 0
	int 10h

	mov ah, 09h
	;al handled
	mov bh, 0
	mov bl, 00011110b
	mov cx, 1
	int 10h

		;type in second window
	mov ah, 02h
	mov dh, 12
	;dl handled above
	mov bh, 0
	int 10h

	mov ah, 09h
	;al handled
	mov bh, 0
	mov bl, 01111010b
	mov cx, 1
	int 10h

	inc dl
	;check for end
	cmp al, "$"
	jnz x4

	mov ah, 01h
	int 21h
	cmp al, '#'
	jnz x4

	
.exit
end