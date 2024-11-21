.MODEL SMALL
.STACK 100H
.DATA
A DB "ENTER NUM: $"
B DB 10,13, "POSITIVE$"
C DB 10,13, "NEGATIVE$"
D DB 10,13,"Invalid Input.$"  ; New message for invalid input
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; Display "ENTER NUM: " prompt
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ; Read the first character (could be a minus sign or digit)
    MOV AH,1
    INT 21H
    MOV BL,AL   ; Store the first character in BL
    
    ; Check if the first character is a minus sign
    CMP BL,2DH  ; Compare with ASCII for '-'
    JE NEG_INPUT ; If '-' is entered, go to NEG_INPUT
    
    ; If not negative, convert the number from ASCII
    CMP BL,'0'
    JL INVALID_INPUT  ; If the input is less than '0', it's invalid
    CMP BL,'9'
    JG INVALID_INPUT  ; If the input is greater than '9', it's invalid
    SUB BL,'0'        ; Convert ASCII character to actual number
    JMP POS_INPUT     ; Continue to handle as a positive number
    
NEG_INPUT:
    ; Read the next digit after the minus sign
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ; Ensure the character is a valid number
    CMP BL,'0'
    JL INVALID_INPUT
    CMP BL,'9'
    JG INVALID_INPUT
    SUB BL,'0'        ; Convert ASCII to number
    NEG BL            ; Make the number negative
    
POS_INPUT:
    ; Now check whether the number is positive or negative
    TEST BL,80H       ; Test if the number is negative (MSB set)
    JZ POSITIVE       ; If MSB is not set, the number is positive
    
NEGATIVE:
    ; Display "NEGATIVE"
    MOV AH,9
    LEA DX,C
    INT 21H
    JMP END_PROGRAM
    
POSITIVE:
    ; Display "POSITIVE"
    MOV AH,9
    LEA DX,B
    INT 21H
    JMP END_PROGRAM
    
INVALID_INPUT:
    ; Handle invalid input
    MOV AH,9
    LEA DX,D
    INT 21H
    JMP END_PROGRAM
    
END_PROGRAM:
    ; Exit the program
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
