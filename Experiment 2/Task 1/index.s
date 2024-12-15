        AREA MYDATA, DATA, READWRITE  ; Data section
        NUM    DCD 10                ; Define a memory location with value 10
        RESULT DCD 0                 ; Memory location to store result

        AREA MYCODE, CODE, READONLY  ; Code section
        ENTRY                        ; Start of the program

START
        LDR R0, =NUM                ; Load the address of NUM into R0
        LDR R1, [R0]                ; Load the value at NUM into R1 (R1 = 10)

        LDR R2, =RESULT             ; Load the address of RESULT into R2
        STR R1, [R2]                ; Store the value from R1 into RESULT

        END                         ; End of program
