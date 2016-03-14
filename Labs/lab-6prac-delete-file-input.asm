;Write an ALP that will copy the last five characters of 
;the file lab.txt to the end of the file tab.txt .Both
;files can be of variable size. 
;[The File lab.txt and tab.txt are available for download – 
;you can download this file into your bin folder]

.model tiny
.486 
.data
	max1 db 12
	act1 db ?
	file1 db 13 dup(0)
	temp db 0
.code
.startup
	lea dx, max1
	mov ah, 0ah
	int 21h

	;VERY IMP, last nibble is 0dh when entering, make that 0 as ASCIZ
	;correcting the filename
	lea si, file1
	mov bl, act1
	mov bh ,00h
	mov [si+bx], bh 

	mov ah, 41h
	lea dx, file1
	int 21h
.exit 
end