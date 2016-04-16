.model	tiny
.486
.data

.code
.startup
	;set video mode
	mov ah, 0
	mov al, 12h
	int 10h

	;fill pixel colour
	mov ah, 0ch
	mov al, 0100b
	mov dx, 70 ;row
	
x2:	mov cx, 80 ;column
x1:	int 10h
	inc cx
	cmp cx, 180
	jnz x1
	inc dx
	cmp dx, 150
	jnz x2

	;bordor red color
	mov ah, 0ch
	mov al, 1111b
	
		;top bordor
			mov dx, 70
			mov cx, 80
		x3:	int 10h
			inc cx
			cmp cx, 180
			jnz x3
		
		;bottom bordor
			mov dx, 150
			mov cx, 80
		x4:	int 10h
			inc cx
			cmp cx, 180
			jnz x4

		;left bordor
			mov cx, 80
			mov dx, 70
		x5:	int 10h
			inc dx
			cmp dx, 150
			jnz x5

		;right bordor
			mov cx, 180
			mov dx, 70
		x6:	int 10h
			inc dx
			cmp dx, 150
			jnz x6

	;blocking
	mov ah, 07h
x7:	int 21h
	cmp al, '?'
	jnz x7

.exit
end