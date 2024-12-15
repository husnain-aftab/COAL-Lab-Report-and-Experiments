        AREA MYDATA, DATA, READWRITE  ; Data section
        NUM1    DCD 4                ; First number
        NUM2    DCD 3                ; Second number
        RESULT  DCD 0                ; Memory location for the product

        AREA MYCODE, CODE, READONLY  ; Code section
        ENTRY                        ; Start of the program

START
        LDR R0, =NUM1               ; Load address of NUM1 into R0
        LDR R1, [R0]                ; Load value of NUM1 into R1 (R1 = 4)

        LDR R2, =NUM2               ; Load address of NUM2 into R2
        LDR R3, [R2]                ; Load value of NUM2 into R3 (R3 = 3)

        MOV R4, #0                  ; Initialize product (R4 = 0)

LOOP
        ADD R4, R4, R1              ; Add NUM1 to the product (R4 = R4 + R1)
        SUBS R3, R3, #1             ; Decrement NUM2 (R3 = R3 - 1)
        BNE LOOP                    ; Repeat loop if R3 != 0

        LDR R5, =RESULT             ; Load address of RESULT into R5
        STR R4, [R5]                ; Store the final product in RESULT

        END                         ; End of program
