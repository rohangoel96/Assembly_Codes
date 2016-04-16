.model tiny
.486
.data
.code
.startup

	;set video mode
	mov ah, 0
	mov al, 12h
	int 10h

	;bigger rectange (150*250)
	mov dx, 0 ;intial row

x2:	mov cx, 0 ; intial column
x1:	mov ah, 0ch
	mov al, 0100b
	int 10h
	inc cx
	cmp cx, 150 ;final column
	jnz x1
	inc dx
	cmp dx, 250 ;final row
	jnz x2


	;second rectange (130*210)
	mov dx, 20 ;intial row

x4:	mov cx, 10 ; intial column
x3:	mov ah, 0ch
	mov al, 0010b
	int 10h
	inc cx
	cmp cx, 140 ;final column
	jnz x3
	inc dx
	cmp dx, 230 ;final row
	jnz x4

	;third rectange (110*170)
	mov dx, 40 ;intial row

x6:	mov cx, 20 ; intial column
x5:	mov ah, 0ch
	mov al, 0100b
	int 10h
	inc cx
	cmp cx, 130 ;final column
	jnz x5
	inc dx
	cmp dx, 210 ;final row
	jnz x6

	;fourth rectange (90*130)
	mov dx, 60 ;intial row

x8:	mov cx, 30 ; intial column
x7:	mov ah, 0ch
	mov al, 0010b
	int 10h
	inc cx
	cmp cx, 120 ;final column
	jnz x7
	inc dx
	cmp dx, 190 ;final row
	jnz x8

	;fifth rectange (70*130)
	mov dx, 80 ;intial row

x10:mov cx, 40 ; intial column
x9:	mov ah, 0ch
	mov al, 0100b
	int 10h
	inc cx
	cmp cx, 110 ;final column
	jnz x9
	inc dx
	cmp dx, 170 ;final row
	jnz x10


	;blocking
	mov ah, 07h
x0:	int 21h
	cmp al, '?'
	jnz x0
.exit
end