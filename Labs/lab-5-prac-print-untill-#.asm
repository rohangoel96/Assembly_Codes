;Write an ALP that
;displays a key that user presses in CAPS (you can assume that the user will enter
;only small alphabets).The original key that the user presses must
;not be displayed on screen only the 
;CAPS must be displayed. User input in CAPS must be displayed till 
;user enter #. # should not be
;displayed on the screen.

.model tiny
.486 
.data
.code
.startup
x2:	
	mov ah, 08h
	int 21h
	cmp al,'#'
	jz x1
	sub al, 20h
	mov dl, al
	mov ah, 02h
	int 21h
	jmp x2
x1: 
	nop

.exit 
end