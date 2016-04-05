.model	tiny
.486
.data
	text db "DOLL" 
.code
.startup
	;set video mode
	mov ah, 0
	mov al, 03h
	int 10h

	;4 character
	lea si, text
	mov dl, 38
	
	;set cursor	position
x2:	mov ah, 02h
	mov dh, 12
	;dl is handled above
	mov bh, 0
	int 10h
	
	;write character at position
	mov ah, 09h
	mov al, [si]
	mov bh, 0
	mov bl, 10001111b
	mov cx, 1
	int 10h
	
	inc si
	inc dl
	cmp dl, 42
	jnz x2
	
	;blocking
	mov ah, 07h
x1:	int 21h
	cmp al, '%'
	jnz x1
	
.exit
end