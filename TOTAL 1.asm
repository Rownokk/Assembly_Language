.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AX,1011010B
    MOV CX,16
    XOR BL,BL 
    
    TOP:
    ROL AX,1
    JNC NEXT
    INC BL
    NEXT:
    LOOP TOP
    
    MOV AH,2
    
    ADD BL,'0'
    MOV DL,BL
    INT 21H
    
    