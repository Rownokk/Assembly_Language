.MODEL SMALL
.STACK 100H
.DATA
A DB "ENTER A CHAR: $"
B DB 10,13,"TOTAL CHAR : $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,A
    MOV AH,9
    INT 21H
    
    XOR BX,BX
    
    MOV AH,1 
    
    WHILE:
    INT 21H
    
    CMP AL,13
    JE ENDD 
    INC BX
    JMP WHILE
    ENDD:
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    ADD DL,'0'
    INT 21H
    
    
    MOV AH,4CH
    INT 21H