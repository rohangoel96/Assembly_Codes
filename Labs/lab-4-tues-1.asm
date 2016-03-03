;Print the data entered

.model tiny
.486 
.data
max db 21
act db ?
inp db 21 dup("$")
newline db 0dh,0ah,'$'
.code
.startup
	lea dx, max
	mov ah, 0Ah
	int 21h
	
	lea dx, newline
	mov ah,09h
	int 21h
	
	lea dx, inp
	mov ah,09h
	int 21h
	
.exit 
end