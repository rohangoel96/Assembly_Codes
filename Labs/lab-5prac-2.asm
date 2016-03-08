.model tiny
.486 
.data
	filename db "rohan.txt", 0
	handle dw ?
	data db 0dh, 0ah, "AH1 244$"
.code
.startup
	;open the file
	mov ah,3dh
	mov al,2
	lea dx, filename
	int 21h
	mov handle, ax
	
	;move file pointer relative to the end to 0
	mov ah, 42h
	mov al, 2
	mov bx, handle
	mov dx, 0000h
	mov cx, 0000h
	int 21h
	
	;enter (append) the required data
	mov ah, 40h
	mov bx, handle
	mov cx, 9d
	lea dx, data
	int 21h
	
	;close the file
	mov ah, 3eh
	mov bx, handle
	int 21h
	
.exit 
end