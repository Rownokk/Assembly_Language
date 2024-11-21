.model small
.stack 100h
.code
main proc
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV CX,5 
    MOV AH,2
    PRINT:
    
    MOV DL,bl
   
    INT 21H
    dec cx
    dec bl
    JCXZ endd
    jmp print
    
    endd:
    mov ah,4ch
    int 21h