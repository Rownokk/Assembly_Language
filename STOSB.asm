.MODEL SMALL
.STACK 100H
.DATA
A DB "HELLO WORLD $"
B DB 15 DUP (?)
C DB 10,13,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    LEA DI,B
    MOV CX,12
    CLD
    
    MOV SI,OFFSET A
    
    PRINT:
    MOV AL,[SI]
    STOSB
    INC SI
    LOOP PRINT
    
    LEA DX,B
    MOV AH,9
    INT 21H
    
    LEA DX,C
    MOV AH,9
    INT 21H
    
    LEA DX,A
    MOV AH,9
    INT 21H
    
    