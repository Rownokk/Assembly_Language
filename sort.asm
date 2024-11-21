.MODEL SMALL
.STACK 100H
.DATA
A DB 5,2,1,3,4

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA SI,A
    MOV BX,5
    CALL SELECT 
    
    MOV CX,5 ;ARRAY SIZE
    MOV AH,2
    PRINT:
    MOV DL, [SI]
    ADD DL,48
    INT 21H 
    
    MOV DL,13
    INT 21H
    MOV DL,10 
    INT 21H
    
    INC SI
    LOOP PRINT
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
SELECT PROC
    ;sorts a byte array by the selectsort method
    ;input: SI = array offset address and BX = number of elements
    ;output: SI = offset of sorted array
    ;uses : SWAP
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    DEC BX
    JE END_SORT
    MOV DX,SI
    ;for N-1 times do
    SORT_LOOP:
    MOV SI,DX
    MOV CX,BX
    MOV DI,SI
    MOV AL,[DI]
    ;locate biggest of remaining elements
    FIND_BIG:
    INC SI
    CMP [SI],AL
    JNG NEXT
    MOV DI,SI
    MOV AL,[DI]
    NEXT:
    LOOP FIND_BIG
    ;swap biggest element with last element
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
    ;swaps two array elements
    ;input: SI = one element AND DI = other element
    ;output: exchange-elements
    PUSH AX
    MOV AL,[SI]
    XCHG AL,[DI]
    MOV [SI],AL
    POP AX
    RET
    SWAP ENDP 
END MAIN 