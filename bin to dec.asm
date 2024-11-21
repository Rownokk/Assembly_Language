.MODEL SMALL
.STACK 100H
.DATA
A DB '0123456789'
B DB 9 
C DB 10,13,"ENTER BINARY: $"  
D DB 10,13,"DECIMAL: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,1
    INPUT:
    INT 21H
    CMP AL,13
    JE OUTPUT
    JMP INPUT
    
    OUTPUT:
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV AL,B
    MOV BX,OFFSET A
    
    XLAT
    
    MOV AH,2
    MOV DL,AL
    INT 21H
    
    
    
    
    