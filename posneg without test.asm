.MODEL SMALL
.STACK 100H
.DATA
A DB 10,13,"ENTER : $"
B DB 10,13,"POS$"
C DB 10,13,"NEG$"
D DB 10,13,"INVALID$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
INPUT:
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,1            ; Read a character
    INT 21H 
    CMP AL,'-'          ; Check if it's a negative sign
    JE NEG_IN           ; If negative, jump to NEG_IN
    
    CMP AL,'0'
    JL INVALID          ; If less than '0', it's invalid
    CMP AL,'9'
    JG INVALID          ; If greater than '9', it's invalid
    JMP POS_IN          ; If valid, jump to POS_IN

NEG_IN:
    MOV AH,1            ; Get the next character for negative number
    INT 21H
    CMP AL,'0'
    JL INVALID          ; If less than '0', invalid
    CMP AL,'9'
    JG INVALID          ; If greater than '9', invalid
    JMP NEG_OUT         ; Jump to NEG_OUT after validation

POS_IN:
    MOV BL,AL           ; Move valid input to BL for further use
    JMP POS_OUT         ; Jump to positive output

NEG_OUT:
    MOV BL,AL           ; Move valid negative number to BL
    NEG BL              ; Negate BL to get the negative value
    JMP DISPLAY_NEG

POS_OUT:
    MOV AH,9            ; Display "POS"
    LEA DX,B
    INT 21H
    JMP INPUT           ; Go back to input for next value

DISPLAY_NEG:
    MOV AH,9            ; Display "NEG"
    LEA DX,C
    INT 21H
    JMP INPUT           ; Go back to input for next value

INVALID:
    MOV AH,9            ; Display "INVALID"
    LEA DX,D
    INT 21H
    JMP INPUT           ; Go back to input for next value
    
MAIN ENDP
END MAIN
