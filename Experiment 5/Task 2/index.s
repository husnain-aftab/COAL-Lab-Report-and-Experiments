        AREA MYDATA, DATA, READWRITE  ; Data section
        ARRAY   DCD 5, 3, 8, 1, 2    ; Define an array
        SIZE    DCD 5                ; Define the size of the array

        AREA MYCODE, CODE, READONLY  ; Code section
        ENTRY                        ; Start of the program

START
        LDR R0, =ARRAY              ; Load the address of the array into R0
        LDR R1, =SIZE               ; Load the address of SIZE into R1
        LDR R2, [R1]                ; Load the size of the array into R2 (R2 = 5)

OUTER_LOOP
        MOV R3, R2                  ; Initialize inner loop counter (R3 = SIZE)
        SUB R3, R3, #1              ; R3 = SIZE - 1

INNER_LOOP
        LDR R4, [R0]                ; Load the first element into R4
        LDR R5, [R0, #4]            ; Load the second element into R5
        CMP R4, R5                  ; Compare the two elements
        BLE SKIP_SWAP               ; If R4 <= R5, skip the swap

        STR R5, [R0]                ; Swap: Store R5 at the first position
        STR R4, [R0, #4]            ; Swap: Store R4 at the second position

SKIP_SWAP
        ADD R0, R0, #4              ; Move to the next pair
        SUBS R3, R3, #1             ; Decrement the inner loop counter
        BNE INNER_LOOP              ; Repeat inner loop if not done

        LDR R0, =ARRAY              ; Reset the array pointer to the start
        SUBS R2, R2, #1             ; Decrement the outer loop counter
        BNE OUTER_LOOP              ; Repeat outer loop if not done

        END                         ; End of program
