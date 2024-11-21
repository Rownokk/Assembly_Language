.MODEL SMALL
.STACK 100H
.DATA
A DB 5 
B DB 10,13,"ENTER A NUM : $"
C DB 10,13,"EQUAL$"
D DB 10,13,"NOT$"
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    INPUT:
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,1
    INT 21H 
    SUB AL,'0'
    MOV BL,AL
    
    CMP BL,A
    JE EQUAL
    MOV AH,9
    LEA DX,D
    INT 21H
    JMP INPUT
    
    EQUAL:
    MOV AH,9
    LEA DX,C
    INT 21H
    JMP INPUT
    
