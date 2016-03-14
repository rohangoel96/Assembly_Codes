;Create a new file and write your name and ID. No. in it. 
;Use keyboard to input the data. Hint: Use
;dos function 0Ah for input from keyboard. Also try renaming
;the file and deleting it, changing its
;attributes date of creation & time.

.model tiny
.486 
.data
	tempfilename db "temp.txt", 0 ;this 0 is very imp
	handle dw ?
	text1 db "Enter the data: ","$"
	newline db 0dh, 0ah, "$"
	max1 db 20d
	act1 db ?
	textentered db 21 dup ("?")

	text2 db "Enter the file name you want to save it as (eg : newfile.txt)","$"
	max2 db 20d
	act2 db ?
	filenameentered db 30 dup(0)
.code
.startup
	lea dx, text1
	mov ah,09h
	int 21h
	
	lea dx, newline
	mov ah,09h
	int 21h
	
	;input text to be written
	lea dx, max1
	mov ah, 0Ah
	int 21h

	;open new file
	mov ah, 3ch
	lea dx, tempfilename
	mov cl, 00100000b
	int 21h
	mov handle, ax

	;write to that file
	mov ah, 40h
	mov bx, handle
	movzx cx, act1
	lea dx, textentered
	int 21h

	;print text2
	lea dx, newline
	mov ah,09h
	int 21h

	lea dx, text2
	mov ah,09h
	int 21h

	lea dx, newline
	mov ah,09h
	int 21h

	;input new file name
	lea dx, max2
	mov ah, 0Ah
	int 21h

	;VERY IMP, last nibble is 0dh when entering, make that 0 as ASCIZ
	;correcting the filename
	lea si, filenameentered
	mov bl, act2
	mov bh ,00h
	mov [si+bx] ,bh

	;rename the temp file
	mov ah, 56h
	lea dx, tempfilename
	lea di, filenameentered
	mov cl, 00100000b
	int 21h

	;close the file
	mov ah, 3eh
	mov bx, handle
	int 21h
.exit 
end