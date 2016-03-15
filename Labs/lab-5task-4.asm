;Open the file you created in Task 2. Read the entire file one 
;byte at a time and stop after you
;reach the end of file. After reading the file, display the data
;using dos function call 09h. Close the
;file in the end.

.model tiny
.486 
.data
	filename db "rohan.txt", 0 ;this 0 is very imp
	handle dw ?
	dataread db 100 dup ("$")
.code
.startup
	;open existing file
	mov ah, 3dh 
	mov al, 00h
	lea dx, filename
	int 21h
	mov handle, ax

	lea si, dataread

	;read byte
x1:	mov ah, 3fh
	mov bx, handle
	mov cx, 1
	mov dx, si
	int 21h

	cmp ax, 0000h ;If AX = 0 or AX < CX, EOF
	inc si
	jnz x1

	;close the file
	mov ah, 3eh
	mov bx, handle
	int 21h

	;print using interupts
	mov ah, 09h
	lea dx, dataread
	int 21h
.exit 
end
