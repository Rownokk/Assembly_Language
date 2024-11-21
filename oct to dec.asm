.MODEL SMALL
.STACK 100H
.DATA
A DB 10,13,"ENTER OCT: $"
B DB 10,13,"DECIMAL: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    INPUT:
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,1
    INT 21H 
   
    MOV BL,AL
    
    CMP AL,'7'
    JLE NUM
    CMP AL,'8'
    JGE PRINT
    
   NUM:
   MOV AH,9
   LEA DX,B
   INT 21H
   
   MOV AH,2
   MOV DL,BL
  
   INT 21H 
   JMP INPUT
   
   PRINT:
   MOV AH,9
   LEA DX,B
   INT 21H
   
   MOV AH,2
   MOV DL,49
   INT 21H 
   
   SUB BL,8
   
   MOV AH,2
   MOV DL,BL
   
   
   INT 21H 
   JMP INPUT
   MOV AH,4CH
   INT 21H
   
   