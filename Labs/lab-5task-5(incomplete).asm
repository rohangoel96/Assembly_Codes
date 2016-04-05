.model tiny
.486 
.data
	filename db "temp.txt",0
	handle dw ?
	newline db 0dh, 0Ah, "$" 
	max1 db 20
	act1 db ?
	nameentered db 21 dup("$")
	max2 db 20
	act2 db ?
	identered db 21 dup("$")
	max3 db 13
	act3 db ?
	newfilename db 13 dup(0)
	text1 db "Enter the name: ",0dh, 0Ah,"$"
	text2 db "Enter the id: ",0dh, 0Ah,"$"
	text3 db "Enter the filename: ",0dh, 0Ah,"$"
.code
.startup
	;create file
	mov ah, 3ch
	lea dx, filename
	mov cl , 00100000b
	int 21h
	mov handle, ax
	
	;input the name and id
	lea dx, text1
	mov ah,09h
	int 21h
	
	lea dx, max1
	mov ah, 0Ah
	int 21h
	
	lea dx, newline
	mov ah, 09h
	int 21h
	
	lea dx, text2
	mov ah,09h
	int 21h
	
	lea dx, max2
	mov ah, 0Ah
	int 21h
	
	;write to the file
	mov ah, 40h
	mov bx, handle
	movzx cx, act1
	lea dx, nameentered
	int 21h
	
	mov ah, 40h
	mov bx, handle
	mov cx, 2d
	lea dx, newline
	int 21h
	
	mov ah, 40h
	mov bx, handle
	movzx cx, act2
	lea dx, identered
	int 21h
	
	;input filename
	lea dx, text3
	mov ah,09h
	int 21h
	
	lea dx, max3
	mov ah, 0Ah
	int 21h
	
	;CORRECT FILE NAME
	lea si, newfilename
	mov bl, act3
	mov bh, 00h
	mov [si+bx], bh
	
	;close the file before RENAMING
	mov ah, 3eh
	mov bx, handle
	int 21h
	
	;rename the file
	mov ah, 56h
	lea dx, filename
	lea di, newfilename
	mov cl, 00100000b
	int 21h
.exit 
end
