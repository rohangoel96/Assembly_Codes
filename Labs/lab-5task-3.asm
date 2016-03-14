;Open the file you created in Task 2 and read its contents. 
;You can count the number of bytes to
;be read beforehand. After reading the file, display 
;the data using dos function call 09h. Close the
;file in the end.

.model tiny
.486 
.data
	filename db "rohan.txt", 0 ;this 0 is very imp
	handle dw ?
	dataread db 50 dup("$")
.code
.startup
	;open the file
	mov ah,3dh
	mov al,0
	lea dx, filename
	int 21h
	mov handle, ax
	
	;read the file
	mov ah, 3fh
	mov bx, handle
	mov cx, 40d
	lea dx, dataread
	int 21h
	
	;print the data using interrupts
	mov ah,09h
	lea dx, dataread
	int 21h
	
	;close the file
	mov ah, 3eh
	mov bx, handle
	int 21h
	
.exit 
end