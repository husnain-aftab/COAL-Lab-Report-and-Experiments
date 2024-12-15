        AREA MYDATA, DATA, READWRITE  ; Data section
        N       DCD 5                ; The value of N (first 5 natural numbers)
        RESULT  DCD 0                ; Memory location to store the sum

        AREA MYCODE, CODE, READONLY  ; Code section
        ENTRY                        ; Start of the program

START
        LDR R0, =N                  ; Load address of N into R0
        LDR R1, [R0]                ; Load the value of N into R1 (R1 = 5)

        MOV R2, #0                  ; Initialize sum (R2 = 0)
        MOV R3, #1                  ; Initialize counter (R3 = 1)

LOOP
        ADD R2, R2, R3              ; Add counter (R3) to sum (R2)
        ADD R3, R3, #1              ; Increment counter (R3 = R3 + 1)
        CMP R3, R1                  ; Compare counter with N
        BLE LOOP                    ; Repeat loop if R3 <= N

        LDR R4, =RESULT             ; Load address of RESULT into R4
        STR R2, [R4]                ; Store the final sum in RESULT

        END                         ; End of program
