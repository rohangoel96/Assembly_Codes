;Write an ALP to search for number of occurrences of a character
;from in the file abc.txt. The character
;has to be entered by the user and the number of occurrences 
;of the character can vary from 0 to 9.
;The ALP should display “Enter the character to search” The user 
;then enters the caharcter. The
;program has to count the number of times the character occurs in
;the file and display it on the next
;line. The file abc.txt is uploaded along with the question. The
;number of characters in the file is fixed
;at 50.
;If abc.txt has the following data
;Never say "oops!!!" always say "ah, interesting!!"
;The ALP should display
;“Enter the character to search ”
;If the user enters the value ! - then the ALP should display the 
;following on the next line
;5

.model	tiny
.486
.data
file1	db	"abc.txt",0
handle1 dw 	?
data1 	db 100 dup ("$")
char 	db	?
text1	db "Enter the character to search", "$"
newline db 0dh, 0ah, "$"
filelength dw ?
.code
.startup
	
	;take input
	mov ah, 09h
	lea dx, text1
	int 21h
	
	mov ah, 09h
	lea dx, newline
	int 21h

	mov ah, 01h
	int 21h
	mov char, al

	;open file
	mov ah, 3dh
	mov al, 0
	lea dx, file1
	int 21h
	mov handle1, ax

	;read the file
	mov ah, 3fh
	mov bx, handle1
	mov cx, 100
	lea dx, data1
	int 21h
	mov filelength, ax

	;start searching
	mov cx, filelength
	lea si, data1
	mov bl, char
	mov dh, 0

x2:	lodsb
	cmp al, bl
	jnz x1
	inc dh
x1:	loop x2
	
	;dh lost because of lea dx
	mov bl, dh
	;to make this a ascii number add 30h
	add bl, 30h


	;print answer
	mov ah, 09h
	lea dx, newline
	int 21h

	mov dl, bl
	mov ah, 02h
	int 21h

	;close files
	mov ah, 3eh
	mov bx, handle1
	int 21h


.exit
end