.MODEL SMALL
.STACK 100H
.DATA
 A DB 10,13,"ENTER NUM1: $"
 B DB 10,13,"ENTER NUM2: $"
 L DB 10,13,"LARGEST: $"
 S DB 10,13,"SMALLEST: $"
 .CODE
 MAIN PROC
    MOV AX,@DATA  
    MOV DS,AX
    INPUT:
    LEA DX,A
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV BL,AL
    
    LEA DX,B
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV BH,AL
    
    CMP BL,BH
    JG DISPLAY
    
    MOV AH,9
    LEA DX,L
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    ADD DL,'0'
    INT 21H          
    
    MOV AH,9
    LEA DX,S
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    ADD DL,'0'
    INT 21H 
    
    JMP INPUT
    
    DISPLAY:
    MOV AH,9
    LEA DX,L
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    ADD DL,'0'
    INT 21H
    
    MOV AH,9
    LEA DX,S
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    ADD DL,'0'
    INT 21H 
    JMP INPUT
    
    
    