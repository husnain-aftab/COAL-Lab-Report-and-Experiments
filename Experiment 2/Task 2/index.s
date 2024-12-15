        AREA MYDATA, DATA, READWRITE  ; Data section
        NUM1   DCD 5                 ; First number
        NUM2   DCD 7                 ; Second number
        RESULT DCD 0                 ; Memory location to store result

        AREA MYCODE, CODE, READONLY  ; Code section
        ENTRY                        ; Start of the program

START
        LDR R0, =NUM1               ; Load address of NUM1 into R0
        LDR R1, [R0]                ; Load value of NUM1 into R1 (R1 = 5)

        LDR R2, =NUM2               ; Load address of NUM2 into R2
        LDR R3, [R2]                ; Load value of NUM2 into R3 (R3 = 7)

        ADD R4, R1, R3              ; Add R1 and R3, result in R4 (R4 = 12)
        SUB R5, R3, R1              ; Subtract R1 from R3, result in R5 (R5 = 2)

        LDR R6, =RESULT             ; Load address of RESULT into R6
        STR R4, [R6]                ; Store addition result (12) in RESULT
        STR R5, [R6, #4]            ; Store subtraction result (2) in the next memory location

        END                         ; End of program
