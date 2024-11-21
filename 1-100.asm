.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    

    MOV CX,100         ; Loop counter set to 100
    MOV BX,1           ; Start BX at 1 (starting number)

    PRINT_NUMBERS:
        PUSH CX        ; Save loop counter

        MOV AX,BX      ; Move current number into AX
        CALL PRINT_DEC ; Print the number in decimal format

        ; Print comma and space
        MOV AH,2
        MOV DL,','
        INT 21H
        MOV DL,' '
        INT 21H

        INC BX         ; Increment BX for next number
        POP CX         ; Restore loop counter
        LOOP PRINT_NUMBERS

    ; Exit program
    MOV AH,4CH
    INT 21H
MAIN ENDP

; Subroutine to print decimal numbers in AX
PRINT_DEC PROC
    PUSH AX            ; Save AX
    PUSH BX            ; Save BX
    PUSH CX            ; Save CX
    PUSH DX            ; Save DX

    XOR CX,CX          ; Clear CX (will hold digits count)
    MOV BX,10          ; Divisor for decimal numbers

CONVERT:
    XOR DX,DX          ; Clear DX before division
    DIV BX             ; Divide AX by 10 (AX = quotient, DX = remainder)
    PUSH DX            ; Push remainder (digit) onto stack
    INC CX             ; Increment digits count
    TEST AX,AX         ; Check if AX is 0
    JNZ CONVERT        ; If not zero, keep dividing

PRINT_LOOP:
    POP DX             ; Get the digit from stack
    ADD DL,'0'         ; Convert to ASCII
    MOV AH,2
    INT 21H            ; Print the digit
    LOOP PRINT_LOOP    ; Loop through all digits

    POP DX             ; Restore DX
    POP CX             ; Restore CX
    POP BX             ; Restore BX
    POP AX             ; Restore AX
    RET
PRINT_DEC ENDP
END MAIN
