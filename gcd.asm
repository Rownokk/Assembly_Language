.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    ; Set up data segment
    MOV AX,@DATA
    MOV DS,AX
    
    ; Initialize BL with 9
    MOV BL,9

CHECK:
    ; Divide 9 by BL
    MOV AX,9
    DIV BL  ; AX / BL -> Quotient in AL, Remainder in AH

    ; Check if remainder is 0 (i.e., BL divides 9 exactly)
    CMP AH,0
    JE AGAIN  ; Jump if equal (remainder is 0)
    
    ; If not, decrease BL and repeat
    DEC BL
    JMP CHECK

AGAIN:
    ; Now check if BL divides 5 exactly
    MOV AX,5
    DIV BL  ; AX / BL -> Quotient in AL, Remainder in AH

    ; Check if remainder is 0 (i.e., BL divides 5 exactly)
    CMP AH,0
    JE ENDD  ; Jump if equal (remainder is 0)
    
    ; If not, decrease BL and repeat the process
    DEC BL
    JMP CHECK

ENDD:
    ; If GCD found, print it
    MOV AH,2        ; Function to display character
    MOV DL,BL       ; Move the GCD (BL) to DL for printing
    ADD DL,30H      ; Convert the number to its ASCII equivalent
    INT 21H         ; Print the character

    ; End the program
    MOV AH,4CH      ; Function to terminate the program
    INT 21H         ; Terminate the program

MAIN ENDP
END MAIN
