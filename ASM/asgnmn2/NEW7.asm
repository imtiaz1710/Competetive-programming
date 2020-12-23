;a program that will prompt the user to enter a hex digit character (0 – 9 or A – F),
;display it on the next line in decimal. If the user enters an illegal character, prompt the
;use to try again.


.MODEL SMALL
.STACK 100H
.DATA
	A DB 'ENTER A HEX DIGIT: $'
	B DB 0AH,0DH,'IN DECIMAL IT IS $'
	D DB 0AH,0DH,'DO YOU WANT TO DO IT AGAIN?$'
	E DB 0AH,0DH,'ILLEGAL CHARACTER _ ENTER 0...9 OR A...F:$'
.CODE 
MAIN PROC 
	MOV AX,@DATA	;INITIALIZE THE DATA SEGMENT
	MOV DS,AX
	
	FST1:
		LEA DX,A	;ENTER A HEX DIGIT 
		MOV AH,9
		INT 21H
	FST2:
		MOV AH,1	;INPUT A CHARACTER
		INT 21H
		MOV BL,AL
		
		CMP BL,'0'	;CHECK WHETHER IT IS IN BETWEEN 0 TO 9
		JNGE LABEL1
		CMP BL,'9'
		JNLE LABEL1
		
		LEA DX,B	;PRINT THE DIGIT IN BETWEEN 0 TO 9
		MOV AH,9
		INT 21H
		
		MOV AH,2
		MOV DL,AL
		INT 21H
		JMP LABEL3
	LABEL1:				;CHECK WHETHER IT IS IN BETWEEN 'A' TO 'F'
		CMP BL,'A'
		JNGE LABEL2
		CMP BL,'F'
		JNLE LABEL2
		
		LEA DX,B		;PRINT DECIMAL FORM IF IT IS IN BETWEEN 'A' TO 'F'
		MOV AH,9
		INT 21H
		
		CMP BL,'A'
		JE P1
		CMP BL,'B'
		JE P2
		CMP BL,'C'
		JE P3
		CMP BL,'D'
		JE P4
		CMP BL,'E'
		JE P5
		CMP BL,'F'
		JE P6
	LABEL2:			;PRINT MESSAGE IF IT IS ILLEGAL AND WANT ANOTHER INPUT
		LEA DX,E
		MOV AH,9
		INT 21H
		JMP FST2
	LABEL3:			;ASK USER FOR DOING IT AGAIN OR NOT
		LEA DX,D
		MOV AH,9
		INT 21H
		
		MOV AH,1
		INT 21H
		CMP AL,'Y'
		JE NEWLINE
		CMP AL,'y'
		JE NEWLINE
		JMP ENDCASE
	P1:					;PRINT THE DECIMAL FORM OF 'A'
		MOV AH,2
		MOV DL,'1'
		INT 21H
		MOV DL,'0'
		INT 21H
		JMP LABEL3
	P2:					;PRINT THE DECIMAL FORM OF 'B'
		MOV AH,2
		MOV DL,'1'
		INT 21H
		MOV DL,'1'
		INT 21H
		JMP LABEL3
	P3:					;PRINT THE DECIMAL FORM OF 'C'
		MOV AH,2
		MOV DL,'1'
		INT 21H
		MOV DL,'2'
		INT 21H
		JMP LABEL3
	P4:					;PRINT THE DECIMAL FORM OF 'D'
		MOV AH,2
		MOV DL,'1'
		INT 21H
		MOV DL,'3'
		INT 21H
		JMP LABEL3
	P5:					;PRINT THE DECIMAL FORM OF 'E'
		MOV AH,2
		MOV DL,'1'
		INT 21H
		MOV DL,'4'
		INT 21H
		JMP LABEL3
	P6:					;PRINT THE DECIMAL FORM OF 'F'
		MOV AH,2
		MOV DL,'1'
		INT 21H
		MOV DL,'5'
		INT 21H
		JMP LABEL3
	NEWLINE:			;PRINT A NEW LINE AND GO FOR START FROM FIRST
		MOV AH,2
		MOV DL,0AH
		INT 21H
		MOV DL,0DH
		INT 21H
		JMP FST1
	ENDCASE:			;DOS EXIT
		MOV AH,1
		INT 21H
		MOV AH,4CH
		INT 21H
MAIN ENDP
END MAIN
		
		
	