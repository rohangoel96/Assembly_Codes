;Create a new file of any name and in that file 
;write your name and ID. No. twice on two different
;lines. Hint: make use of carriage return and line 
;feed ASCII codes. Be sure to close the file

.model tiny
.486 
.data
	filename db "rohan.txt", 0 ;this 0 is very imp
	handle dw ?
	data db "rohan 014", 0dh, 0ah, "rohan 014$"
.code
.startup
	mov ah, 3ch
	lea dx, filename
	mov cl, 00100000b 
	int 21h
	mov handle, ax
	
	mov ah, 40h
	mov bx, handle
	mov cx, 20d
	lea dx, data
	int 21h
	
	;close the file
	mov ah, 3eh
	mov bx, handle
	int 21h
.exit 
end