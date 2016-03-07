;Write an ALP that takes in a single user key input 
;(you can assume that user will enter only values 
;between 1 and 9) and displays as many ‘$’ as the 
;numeric value entered by the user. The key that
;the user presses must not be displayed onscreen.
;For e.g. if user enters 4 then $$$$ must be displayed on screen.

.model tiny
.486 
.data

.code
.startup
	mov ah, 08h
	int 21h
	sub al, 30h
	movzx cx, al
	mov dl, "$"

x1: mov ah, 02h
	int 21h
	loop x1	

.exit 
end