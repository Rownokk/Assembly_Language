.MODEL SMALL
.STACK 100H
.DATA
A DB 10,13,"ENTER A CHAR : $"
B DB 10,13,"BINARY: $"
C DB 10,13,"TOTAL 1: $" 
d db 12
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
 
    mov bl,d
    MOV AH,9
    LEA DX,B
    INT 21H
    
    XOR BH,BH
    MOV CX,8
PRINT:
    SHL BL,1
    JNC ZERO
    INC BH
    MOV DL,'1'
    JMP NEXT
ZERO:
    MOV DL,'0'
    
NEXT:
    MOV AH,2
    INT 21H
    LOOP PRINT
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    ADD DL,'0'
    INT 21H
    

    