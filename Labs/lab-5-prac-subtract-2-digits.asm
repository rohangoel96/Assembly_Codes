;Write an ALP that takes in a two user key inputs 
;(you can assume that user will enter only values 
;between 0 and 9 for both the keys and will always
;enter the largest number first) and displays the 
;difference between these numbers within double
;quotes on the screen. The keys that the user 
;presses must not be displayed onscreen.
;For e.g. if user enters 4 and 1 “3” must be displayed

.model tiny
.486 
.data

.code
.startup
	mov ah, 08h
	int 21h
	mov bl, al
	mov ah, 08h
	int 21h

	sub bl, al
	add bl, 30h ;number will be entered as ASCII, convert to decimal
	
	mov dl, '"'
	mov ah, 02h
	int 21h

	mov dl, bl
	mov ah, 02h
	int 21h

	mov dl, '"'
	mov ah, 02h
	int 21h
.exit 
end