.MODEL SMALL
.STACK 100H
.DATA
A DB "ENTER CHAR : $"
B DB 10,13,"OUTPUT: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
  
  
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV CX,26
    
    MOV AH,2
    
    PRINT:
    MOV DL,BL
    INT 21H
    MOV AH,2
    MOV DL,','
    INT 21H 
    INC BL
    LOOP PRINT
    
    