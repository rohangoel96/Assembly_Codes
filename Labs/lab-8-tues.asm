.model	tiny
.486
.data
	text db "&" 
.code
.startup
	;set video mode
	mov ah, 0
	mov al, 03h
	int 10h

	;type horizontal
	mov ah, 02h
	mov dl, 0
	mov dh, 13
	mov bh, 0
	int 10h
	
	mov ah, 09h
	mov al, text
	mov bh, 0
	mov bl, 00001011b
	mov cx, 80
	int 10h
	
	
	;type vertical
	
	mov dh, 0
	;move cursor
x2:	mov ah, 02h
	mov dl, 39
	;dh handled above
	mov bh, 0
	int 10h
	
	;type
	mov ah, 09h
	mov al, text
	mov bh, 0
	mov bl, 00001101b
	mov cx, 2
	int 10h
	
	inc dh
	cmp dh, 25
	jnz x2
		
	;blocking
	mov ah, 07h
x1:	int 21h
	cmp al, '?'
	jnz x1
	
.exit
end