;Write an ALP that takes in user key press one by one until enter key (ODH) is pressed.
;The characters entered by the user must be stored in a file zyx.txt. The file is not
;already present; it has to be created You can assume that user will not enter more 
;than 100 characters (this is only for reserving storage space)

.model	tiny
.486
.data
	filename db "zyx.txt", 0 
	handle dw ?
	char db ?
.code
.startup
	mov ah, 3ch
	lea dx, filename
	mov cl, 00100000b
	int 21h
	mov handle, ax
	
	mov di, 0
	
x1:	mov ah, 01h
	int 21h
	mov char, al
	
	cmp al, 0dh
	jz x2
	
	mov ah, 40h
	mov bx, handle
	mov cx, 1
	lea dx, char
	int 21h
	
	inc di
	cmp di, 100
	jnz x1
	
x2 :
	
.exit
end