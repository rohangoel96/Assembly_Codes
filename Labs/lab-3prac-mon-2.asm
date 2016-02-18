;Write an ALP that will examine a set of strings. The length each string is four characters. The
;number of strings to be examined is stored in location ‘cnt1’. The strings are stored starting
;from location ‘dat1’. The ALP should scan each string and see if it is equal to ‘ ‘ (four blank
;spaces). If yes, all strings that follow this string of four blank spaces should be reversed until
;the next string of four blank spaces is encountered.
;For e.g. if the set of strings are
;‘math’, ‘have’, ‘ ‘, ‘bury’, ‘mine’, ‘dine’, ‘ ‘ , ‘hell’, ‘deep’, ‘tree’
;The ALP should change it to
;‘math’, ‘have’, ‘ ‘, ‘yrub’, ‘enim’, ‘enid’ , ‘ ‘ , ‘hell’, ‘deep’, ‘tree’
;You have to use a single instruction to reverse the string.


.model tiny
.486 
.data
	DAT1 db 'abcd','have','    ','xyza','aabc','    ','axcf','abcd'
	SEARCH dd '    '
	DAT2 dd 8 dup(?)
	CNT1 db 8
.code
.startup
	lea si,DAT1
	lea di,DAT2
	mov cl, CNT1

	CLD
	 	
x3:	LODSD
	dec cl
	CMP eax, SEARCH
	STOSD
	jne x3
	
x2:	LODSD
	dec cl
 	CMP eax, SEARCH
 	je x1
 	BSWAP eax 
 	STOSD
 	jmp x2

x1: STOSD
	
x4: MOVSD
	LOOP x4
 

.exit 
end