.MODEL SMALL
.STACK 100H
.DATA
PROMPT1 DB 10,13, 'ENTER FIRST NUMBER (0-9): $'
PROMPT2 DB 10,13, 'ENTER SECOND NUMBER (0-9): $'
PROMPT3 DB 10,13, 'ENTER THIRD NUMBER (0-9): $'
GREAT DB 10,13, 'GREATEST: $'
MIDDLE DB 10,13, 'MIDDLE: $'
SMALL DB 10,13, 'SMALLEST: $'
NEWLINE DB 10,13, '$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; INPUT FIRST NUMBER
    MOV AH,9
    LEA DX, PROMPT1
    INT 21H

    MOV AH,1
    INT 21H
    SUB AL, '0'        ; Convert ASCII to number
    MOV BL, AL         ; Store first number in BL

    ; INPUT SECOND NUMBER
    MOV AH,9
    LEA DX, PROMPT2
    INT 21H

    MOV AH,1
    INT 21H
    SUB AL, '0'        ; Convert ASCII to number
    MOV BH, AL         ; Store second number in BH

    ; INPUT THIRD NUMBER
    MOV AH,9
    LEA DX, PROMPT3
    INT 21H

    MOV AH,1
    INT 21H
    SUB AL, '0'        ; Convert ASCII to number
    MOV CL, AL         ; Store third number in CL

    ; Sorting the numbers (Bubble Sort Logic)

    CMP BL, BH         ; Compare first and second
    JG SWAP_1          ; If BL > BH, swap them
    JMP CHECK_2

SWAP_1:
    XCHG BL, BH        ; Swap BL and BH

CHECK_2:
    CMP BL, CL         ; Compare first and third
    JG SWAP_2          ; If BL > CL, swap them
    JMP CHECK_3

SWAP_2:
    XCHG BL, CL        ; Swap BL and CL

CHECK_3:
    CMP BH, CL         ; Compare second and third
    JG SWAP_3          ; If BH > CL, swap them
    JMP DISPLAY_RESULT

SWAP_3:
    XCHG BH, CL        ; Swap BH and CL

DISPLAY_RESULT:
    ; BL now contains the smallest, BH contains the middle, and CL contains the greatest number

    ; Display Greatest
    MOV AH,9
    LEA DX, GREAT
    INT 21H

    MOV DL, CL         ; Output greatest number
    ADD DL, '0'        ; Convert to ASCII
    MOV AH, 2
    INT 21H

    ; New line
    MOV AH,9
    LEA DX, NEWLINE
    INT 21H

    ; Display Middle
    MOV AH,9
    LEA DX, MIDDLE
    INT 21H

    MOV DL, BH         ; Output middle number
    ADD DL, '0'        ; Convert to ASCII
    MOV AH, 2
    INT 21H

    ; New line
    MOV AH,9
    LEA DX, NEWLINE
    INT 21H

    ; Display Smallest
    MOV AH,9
    LEA DX, SMALL
    INT 21H

    MOV DL, BL         ; Output smallest number
    ADD DL, '0'        ; Convert to ASCII
    MOV AH, 2
    INT 21H

    ; New line
    MOV AH,9
    LEA DX, NEWLINE
    INT 21H

    ; End program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
