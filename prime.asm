.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB "ENTER A NUMBER: $"
RESULT DB 0DH,0AH,"THE NUMBER IS PRIME$"
NOTPRIME DB 0DH,0AH,"THE NUMBER IS NOT PRIME$"
NUM DB ?
DIVISOR DW 2

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Print prompt
    MOV AH, 9
    LEA DX, PROMPT
    INT 21H

    ; Read user input
    CALL INDEC
    MOV NUM, AL

    ; Initialize divisor
    MOV AX, 2
    MOV DIVISOR, AX

    ; Check for special case if number is 1
    MOV AL, NUM
    CMP AL, 1
    JE NOT_PRIME

    ; Loop to check for prime
CHECK_PRIME:
    MOV AX, NUM
    MOV DX, 0
    MOV CX, DIVISOR
    DIV CX
    CMP DX, 0
    JE NOT_PRIME

    INC DIVISOR
    MOV AX, DIVISOR
    CMP AX, NUM
    JL CHECK_PRIME

    ; Print prime message
    LEA DX, RESULT
    JMP PRINT_RESULT

NOT_PRIME:
    ; Print not prime message
    LEA DX, NOTPRIME

PRINT_RESULT:
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
