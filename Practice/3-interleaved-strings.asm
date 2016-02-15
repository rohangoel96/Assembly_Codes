;An interleaved string is stored from displacement ‘istr1’.  
;The size of the interleaved string is stored in location ‘cnt1’. 
;Write an ALP that will separate the interleaved string into two strings 
;If the interleaved string is “hmeilclroo” it should be separated as two strings “hello” and “micro”. 
;You can assume that the strings to be separated will be of equal size.
;[note – there is no need to use string instructions for this]

.model tiny
.486
.data
	ISTR1 db "hmeilclroo"
	CNTL1 db 10
	ANS1 db 5 dup("X")
	ANS2 db 5 dup("X")
.code
.startup
	LEA SI,ISTR1
	MOV CL,CNTL1
	LEA DI,ANS1
	LEA BX,ANS2
X1:	MOV AL,[SI]
	MOV [DI], AL
	INC SI
	INC DI
	DEC CL
	MOV AL, [SI]
	MOV [BX], AL
	INC SI
	INC BX
	DEC CL
	JNZ X1
.exit
end