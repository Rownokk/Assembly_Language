.MODEL SMALL
.STACK 100H
.DATA
A DB 5,2,1,3,4         ; Array of elements to sort
B DB 10,13,"LARGEST: $" ; Message to print largest value
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA SI,A            ; Load offset of array into SI
    MOV BX,5            ; Number of elements in array
    CALL SELECT         ; Sort the array using the SELECT procedure

    MOV CX,5            ; Array size
    MOV AH,2
PRINT_ARRAY:
    MOV DL, [SI]        ; Print each element of the sorted array
    ADD DL, 48          ; Convert number to ASCII
    INT 21H

    MOV DL,13           ; Newline (carriage return)
    INT 21H
    MOV DL,10           ; Newline (line feed)
    INT 21H

    INC SI              ; Move to next element in the array
    LOOP PRINT_ARRAY    ; Repeat until all elements are printed

    ; Print the "LARGEST" message
    MOV AH,9
    LEA DX,B
    INT 21H

    ; Print the largest element (last in the sorted array)
    LEA SI,A            ; Load base of array into SI again
    ADD SI,4            ; Point to the last element of the sorted array (largest)
    MOV DL,[SI]         ; Move largest element into DL
    ADD DL,'0'          ; Convert to ASCII
    MOV AH,2
    INT 21H             ; Print largest element
    
    MOV AH,4CH          ; Terminate program
    INT 21H
MAIN ENDP

SELECT PROC
    ; Sorts a byte array using selection sort
    ; Input: SI = array offset, BX = number of elements
    ; Output: Sorted array in place
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    DEC BX
    JE END_SORT
    MOV DX,SI

SORT_LOOP:
    MOV SI,DX
    MOV CX,BX
    MOV DI,SI
    MOV AL,[DI]          ; AL = current element

FIND_BIG:
    INC SI
    CMP [SI],AL
    JNG NEXT
    MOV DI,SI            ; Update DI to point to new largest element
    MOV AL,[DI]          ; Update AL with largest element
NEXT:
    LOOP FIND_BIG

    ; Swap largest element with the last unsorted element
    CALL SWAP
    DEC BX
    JNE SORT_LOOP
END_SORT:
    POP SI
    POP DX
    POP CX
    POP BX
    RET
SELECT ENDP

SWAP PROC
    ; Swaps two elements in the array
    ; Input: SI = one element, DI = other element
    PUSH AX
    MOV AL,[SI]
    XCHG AL,[DI]
    MOV [SI],AL
    POP AX
    RET
SWAP ENDP
END MAIN
