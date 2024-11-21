;SUM OF SERIES 100+90+80+70+....+10
.MODEL SMALL
.STACK 100H
.DATA
A DB "SUM OF THE SERIES: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,0
    MOV CX,10
    MOV AX,100
    
    LOOPER:
    ADD DX,AX
    SUB AX,10
    LOOP LOOPER
    
    PUSH DX
    MOV AH,9
    LEA DX,A
    INT 21H
    POP DX
    MOV AX,DX
    CALL OUTDEC 
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
OUTDEC PROC
    PUSH DX
    ENDIF:
    XOR CX,CX
    MOV BX,10D
    
    REPEAT:
    XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    OR AX,AX
    JNZ REPEAT
    MOV AH,2
    PRINT:
    POP DX
    OR DL,30H
    INT 21H
    LOOP PRINT
    POP DX
    RET
    OUTDEC ENDP
END MAIN
    
    