        AREA MYDATA, DATA, READWRITE  ; Data section
        NUM1   DCD 15                ; First number
        NUM2   DCD 20                ; Second number
        RESULT DCD 0                 ; Memory location for the larger number

        AREA MYCODE, CODE, READONLY  ; Code section
        ENTRY                        ; Start of the program

START
        LDR R0, =NUM1               ; Load address of NUM1 into R0
        LDR R1, [R0]                ; Load value of NUM1 into R1 (R1 = 15)

        LDR R2, =NUM2               ; Load address of NUM2 into R2
        LDR R3, [R2]                ; Load value of NUM2 into R3 (R3 = 20)

        CMP R1, R3                  ; Compare R1 (NUM1) with R3 (NUM2)
        BGT NUM1_IS_LARGER          ; If NUM1 > NUM2, branch to NUM1_IS_LARGER
        B   NUM2_IS_LARGER          ; Otherwise, branch to NUM2_IS_LARGER

NUM1_IS_LARGER
        LDR R4, =RESULT             ; Load address of RESULT into R4
        STR R1, [R4]                ; Store NUM1 (R1) in RESULT
        B END_PROGRAM               ; Branch to the end of the program

NUM2_IS_LARGER
        LDR R4, =RESULT             ; Load address of RESULT into R4
        STR R3, [R4]                ; Store NUM2 (R3) in RESULT

END_PROGRAM
        END                         ; End of the program
