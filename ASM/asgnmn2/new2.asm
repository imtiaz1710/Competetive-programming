;a program to read a lower case character from the keyboard and display it at the
;beginning of the next line in uppercase.

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
	MOV AH,1		;INPUT FUNCTION
	INT 21H			;TAKE INPUT
	
	SUB AL,20H		;MAKE IT UPPERCASE 
	
	MOV BL,AL
	
	MOV AH,2		;OUTPUT	FUNCTION
	MOV DL,0DH		;CARRIAGE RETURN
	INT 21H
	MOV DL,0AH		;LINE FEED
	INT 21H
	
	MOV DL,BL		
	INT 21H			;PRINT UPPERCASE LETTER
	
	MOV AH,1
	INT 21H
	
	MOV AH,4CH		;EXIT DOS
	INT 21H
MAIN ENDP
END MAIN