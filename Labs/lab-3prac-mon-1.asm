;Write an ALP that will scan a database of grades – the grades are to be stored as follows in
;memory: Last three digits of the id followed by grade. Only coarse grading is used so valid
;grades are – A, B, C D, E. For e.g. for 5 students the storage in memory will be as follows:
;‘238’, ‘A’, ‘211’, ‘B’, ‘247’, ‘C’, ‘110’, ‘E’, ‘111’, ‘B’
;The count of students is available in location cnt1. The database of student ids and grades are
;available from location dat1. Your ALP must find the id of students who have scored an A and
;store the ids alone starting from location res1. The ALP must also find out how many students
;have scored an ‘A’ grade and store it in location acnt1.
;The number of students will vary from a minimum of 10 to a maximum of 100. You need to
;demonstrate your ALP only for the minimum number.

.model tiny
.486 
.data
	DAT1 db '123','B','256','A','003','B','004','A','115','A'
	CNT1 db 5
	RES1 db 5 dup(?)
	ACNT1 db ?
.code
.startup
	lea si, DAT1
	lea di, RES1
	mov cl, CNT1
	mov al,'A'
	

	add si,3
	

x2:	cmp al,[si]
	jne x1
	mov bl, 3 ;counter for copying loop
	
	sub si, 3
	
x3:	mov dl, [si]
	mov [di],dl
	
	inc si
	inc di
	dec bl

	jnz x3


x1:	add si,4
	loop x2
	


.exit 
end