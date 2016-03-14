;Write an ALP that will copy the last five characters of 
;the file lab.txt to the end of the file tab.txt .Both
;files can be of variable size. 
;[The File lab.txt and tab.txt are available for download – 
;you can download this file into your bin folder]

.model tiny
.486 
.data
	file1 db "lab.txt",0
	handle1 dw ?
	file2 db "tab.txt",0
	handle2 dw ?
	dataread db 20 dup ("?")
.code
.startup
	
	;open file1
	mov ah, 3dh
	mov al, 0
	lea dx, file1
	int 21h
	mov handle1, ax

	;move pointer 5 units back in file1
	mov ah, 42h
	mov al, 2
	mov bx, handle1
	mov cx, 0FFFFh  ;-5
	mov dx, 0FFFBh 	;-5
	int 21h

	;read those 5 letters
	mov ah, 3fh
	mov bx, handle1
	mov cx, 5 
	lea dx, dataread
	int 21h

	;close file1
	mov ah, 3eh
	mov bx, handle1
	int 21h

	;open file2
	mov ah, 3dh
	mov al, 2
	lea dx, file2
	int 21h
	mov handle2, ax

	;move pointer to end of file2
	mov ah, 42h
	mov al, 2
	mov bx, handle2
	mov cx, 0000h 
	mov dx, 0000h  
	int 21h

	;write the five bytes
	mov ah, 40h
	mov bx, handle2
	mov cx, 5d
	lea dx, dataread
	int 21h

	;close file2
	mov ah, 3eh
	mov bx, handle2
	int 21h

.exit 
end