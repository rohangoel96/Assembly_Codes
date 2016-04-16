;Write an ALP that takes in a single user input from keyboard. The key pressed by the user must not 
;be displayed. The program should compare the user input with the 12th byte in the file lab1.txt and if 
;the user input is equal to the 12th byte (counting from one) in the file then the following pattern 
;must be displayed on the screen.
;Else the following pattern must be displayed on the screen.

.model	tiny
.486
.data
	charinp db ?
	charfile db ?
	filename db "lab1.txt", 0
	handle dw ?
.code
.startup
	;input character
	mov ah, 08h
	int 21h
	mov charinp, al

	;open filename
	mov ah, 3dh
	mov al, 0
	lea dx, filename
	int 21h
	mov handle, ax 

	;move file pointer to position12
	mov ah, 42h
	mov al, 0
	mov bx, handle
	mov cx, 0
	mov dx, 11
	int 21h

	;read position12
	mov ah, 3fh
	mov bx, handle
	mov cx, 1
	lea dx, charfile
	int 21h

	;set video mode
	mov ah, 0
	mov al, 03h
	int 10h

	mov dh, 0
	mov ah , charfile
	cmp ah, charinp
	jz x3

	;make pattern if not equal  
x1:	mov ah, 02h
	;dh handled above
	mov dl, 0;column
	mov bh, 0
	int 10h

	mov ah, 09h
	mov al, " "
	mov bh, 0
	mov bl, 01010000b
	mov cx, 80
	int 10h

	inc dh

	mov ah, 02h
	;dh handled above
	mov dl, 0;column
	mov bh, 0
	int 10h

	mov ah, 09h
	mov al, " "
	mov bh, 0
	mov bl, 00100000b
	mov cx, 80
	int 10h

	inc dh
	
	cmp dh, 26
	jnz x1
	jmp last

	;make pattern if equal
x3: mov ah, 02h
	;dh handled above
	mov dl, 0;column
	mov bh, 0
	int 10h

	mov ah, 09h
	mov al, " "
	mov bh, 0
	mov bl, 00100000b
	mov cx, 80
	int 10h

	inc dh

	mov ah, 02h
	;dh handled above
	mov dl, 0;column
	mov bh, 0
	int 10h

	mov ah, 09h
	mov al, " "
	mov bh, 0
	mov bl, 01010000b
	mov cx, 80
	int 10h

	inc dh
	
	cmp dh, 26
	jnz x3

last:
	;blocking
	mov ah, 07h
x7:	int 21h
	cmp al, '?'
	jnz x7
.exit
end