.MODEL SMALL
.STACK 100H
.DATA
    INPUT_MSG DB 'Enter a value (0-9): $'
    OUTPUT_MSG DB 'Value at (SP+2): $'
    NEWLINE DB 0DH, 0AH, '$'
.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Initialize Stack Segment
    MOV AX, SS
    MOV SP, 100H      ; Set stack pointer to 100h (for example)

    ; Push some values onto the stack (simulate existing data)
    push 7h
    PUSH 5h      ; Push the second element (this will be at SP+2)
    PUSH 3h        ; Push the top of the stack (at SP)

    ; Display message to enter a value
    MOV AH, 09H
    LEA DX, INPUT_MSG
    INT 21H
    
    ; Take user input (for simplicity, one character from '0' to '9')
    MOV AH, 01H        ; Input a single character
    INT 21H            ; Read character from input (input goes into AL)
    SUB AL, '0'        ; Convert from ASCII digit to actual number
    MOV AH, 00H        ; Make sure the full AX register is used
    MOV BX, AX         ; Store input value in BX
    
    ; Replace the top of the stack (SP) with input value
    POP AX             ; Pop the top of the stack into AX (this was 5678H)
    PUSH BX            ; Push the input value instead (replace top of stack)
    
    ; Print the second element from the top (SP+2)
    LEA DX, OUTPUT_MSG
    MOV AH, 09H
    INT 21H            ; Display the output message

    ; Access the second element from the top (SP+2) using BP
    MOV BP, SP         ; Copy SP to BP to access stack memory
    MOV AX, [BP+2]     ; Access the second item from the top of the stack (SP+2)
    
    ; Convert AX to displayable form (ASCII conversion)
    MOV BX, AX         ; Save the value of AX in BX
    MOV DL, BH         ; Get the high byte of the word in BX
    CALL PRINT_CHAR    ; Call subroutine to print character
    MOV DL, BL         ; Get the low byte of the word in BX
    CALL PRINT_CHAR    ; Call subroutine to print character

    ; Newline
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H            ; Print newline

    ; Terminate program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

; Subroutine to print character
PRINT_CHAR PROC
    ADD DL, '0'        ; Convert to ASCII
    MOV AH, 02H        ; BIOS interrupt to print character
    INT 21H
    RET
PRINT_CHAR ENDP
END MAIN
