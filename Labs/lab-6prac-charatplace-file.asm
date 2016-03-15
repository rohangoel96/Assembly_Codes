;Write an ALP that will take a single user input of (1-9). 
;Read the character at position user input * 10 
;from file lab.txt and display the character. 
;The key that the user presses must not be displayed onscreen.
;[The File lab.txt is available for download – you can download this 
;file into your bin folder]
;For e.g. If user enters 8. The program should read 
;the 80th character from file lab.txt and display it.
;Use Model Tiny.

.model tiny
.486 
.data
	inp10 dw ?
	filname db "tab.txt", 0
	handle dw ?
	charatplace db "?"
.code
.startup
	;insert number
	mov ah, 08h
	int 21h
	
	;multiply inputted number by 10
	sub al, 30h
	mov bl, 10d
	mul bl
	mov inp10, ax

	;open existing file
	mov ah, 3dh
	mov al, 0
	lea dx, filname
	int 21h
	mov handle, ax

	;move the file pointer at correct position
	mov ah, 42h
	mov al, 0
	mov bx, handle
	mov cx, 0000h
	mov dx, inp10
	int 21h

	;read the data at the moved position
	mov ah, 3fh
	mov bx, handle
	mov cx, 1d
	lea dx, charatplace
	int 21h

	;print the character
	mov dl, charatplace
	mov ah, 02h
	int 21h

	;close the file
	mov ah, 3eh
	mov bx, handle
	int 21h
.exit 
end