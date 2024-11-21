.MODEL SMALL
.STACK 100H
.DATA
A DB "ENTER A NUM(0-9) : $"
B DB 10,13,"VALUE AT (SP+2) : $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,SS
    MOV SP,100H
    
    PUSH 1H
    PUSH 2H
    PUSH 5H
    PUSH 9H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    xor ax,ax
    MOV AH,1 
    INT 21H
    SUB AL,'0'
    xor ah,ah
    MOV BX,AX
    
    POP AX
    PUSH BX
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV BP,SP
    MOV AX,[BP+0]
    
    MOV BX,AX
    MOV DL,BH
    CALL PRINT 
    MOV DL,BL
    CALL PRINT
    MOV AH,4CH
    INT 21H
    MAIN ENDP
PRINT PROC
    ADD DL,'0'
    MOV AH,2
    INT 21H
    RET
    PRINT ENDP
END MAIN
    