;A 5-character string is stored in memory location with label ‘dat1’. Write an ALP that will insert spaces
;between the characters and store the modified string in memory location with label ‘dat2’.
;For e.g. if the contents of dat1 is as follows
;loc1: hello
;after the ALP is executed dat2 should be as follows
;loc2:h e l l o
;The ASCII equivalent of space is 20H.

.model tiny
.486 
.data
	DAT1 db 'rohan'
	CNT1 db 5
	DAT2 db 10 dup(?)
.code
.startup
	lea si, DAT1
	lea di, DAT2
	mov bl, 20h
	mov cl, CNT1
	
	CLD

X1:	LODSB
	STOSB

	mov [di], bl
	INC di

	LOOP X1

.exit 
end