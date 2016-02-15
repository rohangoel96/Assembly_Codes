;Write an ALP that will examine the contents of set of 10 bytes starting 
;from location ‘ARRAY1’ for the presence of data ‘0AH’ and replace it with the ASCII character ‘E’.

.model tiny
.486 
.data
	ARRAY1 db 01h,22h,0Ah,0Bh,55h
	SEARCH db 0Ah
	COUNT db 05h
.code
.startup
	lea si, ARRAY1
	mov al, SEARCH
	mov cl, COUNT
	mov bl, 'E'

x2:	cmp al,[si]
	jnz x1
	mov [si], bl

x1: inc si
	dec cl
	jnz x2

.exit 
end