;Write an ALP to read the first five characters from the 
;file abc.txt and the first five characters from file
;xyz.txt. The ALP should then interleave the characters in the 
;following order [the character no. from
;file 1 is in Arabic numeral and from file 2 is in Roman numeral]
; : 1 V 2 IV 3III 4II 5I
;So if the following text is there in file abc.txt.
;If you don't build your dream somebody will hire you to build theirs.
;And the text in xyz.txt is
;It is hard to be a woman - you must think like a man, act like a lady, 
;look like a young girl and work
;like a horse.
;The ALP should read the first five characters from abc.txt[ If yo ]and 
;the first five characters from
;xyz.txt [ It is] and the display the following [Isfi ytoI]


.model	tiny
.486
.data
file1	db	"abc.txt",0
file2	db 	"xyz.txt",0
handle1 dw 	?
handle2 dw 	?
data1 	db 5 dup ("$")
data2 	db 5 dup ("$")
.code
.startup
	;open both the files
	mov ah, 3dh
	mov al, 0
	lea dx, file1
	int 21h
	mov handle1, ax

	mov ah, 3dh
	mov al, 0
	lea dx, file2
	int 21h
	mov handle2, ax

	;read the files
	mov ah, 3fh
	mov bx, handle1
	mov cx, 5
	lea dx, data1
	int 21h

	mov ah, 3fh
	mov bx, handle2
	mov cx, 5
	lea dx, data2
	int 21h

	;print
	mov cx, 05h
	lea si, data1
	lea di, data2
	add di, 4

x1:	mov dl, [si]
	mov ah, 02h
	int 21h

	mov dl, [di]
	mov ah, 02h
	int 21h

	inc si
	dec di

	loop x1

	;close files
	mov ah, 3eh
	mov bx, handle1
	int 21h

	mov ah, 3eh
	mov bx, handle2
	int 21h

.exit
end