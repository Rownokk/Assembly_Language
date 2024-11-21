.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB "ENTER A NUMBER: $"
RESULT DB 0DH,0AH,"SUM OF DIGITS IS: $"
NUM DB ?
SUM DW 0

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

    ; Initialize sum
    MOV AX, 0
    MOV SUM, AX

    ; Loop to calculate sum of digits
    MOV CX, NUM
CALC_SUM:
    MOV AX, CX
    MOV DX, 0
    DIV BYTE PTR 10
    ADD DX, SUM
    MOV SUM, DX
    MOV CX, AX
    JNZ CALC_SUM

    ; Print result message
    LEA DX, RESULT
    MOV AH, 9
    INT 21H

    ; Print sum of digits
    MOV AX, SUM
    CALL OUTDEC

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
