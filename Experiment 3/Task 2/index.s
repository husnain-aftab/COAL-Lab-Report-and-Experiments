        AREA MYDATA, DATA, READWRITE  ; Data section
        NUM1   DCD 10                ; First number
        NUM2   DCD 10                ; Second number
        RESULT DCD 0                 ; Memory location for result (e.g., Equal/Not Equal)

        AREA MYCODE, CODE, READONLY  ; Code section
        ENTRY                        ; Start of the program

START
        LDR R0, =NUM1               ; Load address of NUM1 into R0
        LDR R1, [R0]                ; Load value of NUM1 into R1 (R1 = 10)

        LDR R2, =NUM2               ; Load address of NUM2 into R2
        LDR R3, [R2]                ; Load value of NUM2 into R3 (R3 = 10)

        CMP R1, R3                  ; Compare R1 (NUM1) with R3 (NUM2)
        BEQ NUMS_ARE_EQUAL          ; If NUM1 == NUM2, branch to NUMS_ARE_EQUAL
        BNE NUMS_ARE_NOT_EQUAL      ; If NUM1 != NUM2, branch to NUMS_ARE_NOT_EQUAL

NUMS_ARE_EQUAL
        LDR R4, =RESULT             ; Load address of RESULT into R4
        MOV R5, #1                  ; Store 1 in R5 to indicate equality
        STR R5, [R4]                ; Store the value of R5 (1) in RESULT
        B END_PROGRAM               ; Branch to the end of the program

NUMS_ARE_NOT_EQUAL
        LDR R4, =RESULT             ; Load address of RESULT into R4
        MOV R5, #0                  ; Store 0 in R5 to indicate inequality
        STR R5, [R4]                ; Store the value of R5 (0) in RESULT

END_PROGRAM
        END                         ; End of the program
