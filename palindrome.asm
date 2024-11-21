.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB "ENTER A NUMBER: $"
RESULT DB 0DH,0AH,"THE NUMBER IS A PALINDROME$"
NOTPALINDROME DB 0DH,0AH,"THE NUMBER IS NOT A PALINDROME$"
NUM DB ?
REVERSED DW 0

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

    ; Initialize reversed number
    MOV AX, 0
    MOV REVERSED, AX

    ; Loop to reverse the number
    MOV CX, NUM
REVERSE_LOOP:
    MOV AX, REVERSED
    MUL BYTE PTR 10
    ADD AX, CX
    MOV REVERSED, AX
    SHR CX, 1
    JNZ REVERSE_LOOP

    ; Compare original and reversed numbers
    MOV AX, NUM
    CMP AX, REVERSED
    JE IS_PALINDROME

    ; Print not palindrome message
    LEA DX, NOTPALINDROME
    JMP PRINT_RESULT

IS_PALINDROME:
    ; Print palindrome message
    LEA DX, RESULT

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
