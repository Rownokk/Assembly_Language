.MODEL SMALL
.STACK 100H
.DATA
A DB 10,13, 'ZERO$'
B DB 10,13, 'ONE$'
C DB 10,13, 'TWO$'
D DB 10,13, 'THREE$'
E DB 10,13, 'FOUR$'
F DB 10,13, 'FIVE$'
G DB 10,13, 'SIX$'
H DB 10,13, 'SEVEN$'
I DB 10,13, 'EIGHT$'
J DB 10,13, 'NINE$'
K DB "ENTER NUMBER : $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX,K
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'0'
    JE ZERO
    CMP AL,'1'
    JE ONE
    CMP AL,'2'
    JE TWO
    CMP AL,'3'
    JE THREE
    CMP AL,'4'
    JE FOUR
    CMP AL,'5'
    JE FIVE
    CMP AL,'6'
    JE SIX
    CMP AL,'7'
    JE SEVEN
    CMP AL,'8'
    JE EIGHT
    CMP AL,'9'
    JE NINE
    JMP ENDD
    
    ZERO:
    LEA DX,A
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    ONE:
    LEA DX,B
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    TWO:
    LEA DX,C
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    THREE:
    LEA DX,D
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    FOUR:
    LEA DX,E
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    FIVE:
    LEA DX,F
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    SIX:
    LEA DX,G
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    SEVEN:
    LEA DX,H
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    EIGHT:
    LEA DX,I
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    NINE:
    LEA DX,J
    MOV AH,9
    INT 21H 
    JMP ENDD
    
    ENDD:
    MOV AH,4CH
    INT 21H
    