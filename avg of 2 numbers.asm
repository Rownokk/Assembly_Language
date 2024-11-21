.MODEL SMALL
.STACK 100H
.DATA
A DB 10,13,"ENTER DIGIT 1: $"
B DB 10,13,"ENTER DIGIT 2: $"
C DB 10,13,"SUM: $"
D DB 10,13,"AVERAGE: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; Display "ENTER DIGIT 1: "
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ; Read first digit
    MOV AH,1
    INT 21H
    SUB AL,'0'          ; Convert ASCII to number
    MOV BL,AL           ; Store first digit in BL
    
    ; Display "ENTER DIGIT 2: "
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ; Read second digit
    MOV AH,1
    INT 21H
    SUB AL,'0'          ; Convert ASCII to number
    MOV BH,AL           ; Store second digit in BH
    
    ; Calculate sum
    ADD BL,BH           ; BL now holds the sum of the two digits
    
    ; Display "SUM: "
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ; Display sum
    MOV AH,2
    MOV DL,BL           ; Move sum into DL for display
    ADD DL,'0'          ; Convert to ASCII
    INT 21H             ; Display the sum
    
    ; Display "AVERAGE: "
    MOV AH,9
    LEA DX,D
    INT 21H
    
    ; Calculate average
    MOV AX,0            ; Clear AX
    MOV AL,BL           ; Move sum into AL
                ; Set divisor to 2
    shr al,1              ; Divide AX by BX (AL = quotient)
    
    ; Display average
    MOV AH,2
    MOV DL,AL           ; Move quotient (average) into DL
    ADD DL,'0'          ; Convert to ASCII
    INT 21H             ; Display the average
    
    ; Exit program
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
