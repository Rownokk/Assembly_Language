.MODEL SMALL
.STACK 100H
.DATA
A DB '0123456789'
B DB 2 
C DB "ENTER STRING: $"
D DB 10,13,'OUTPUT: $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    LEA DX,C
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INPUT:
    INT 21H
    CMP AL,13
    JE ENDD
    PUSH AX
    JMP INPUT
    
    ENDD:
    LEA DX,D
    MOV AH,9
    INT 21H 
    
    MOV AL,B
    MOV BX,OFFSET A
    XLAT
    
    
    MOV AH,2
    MOV DL,AL
    INT 21H 
    
   
    
    
    
    
    