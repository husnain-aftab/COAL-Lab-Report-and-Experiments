        AREA MYDATA, DATA, READWRITE  ; Data section
        ARRAY   DCD 3, 7, 2, 9, 5    ; Define an array
        SIZE    DCD 5                ; Define the size of the array
        MAX     DCD 0                ; Memory location to store the maximum value

        AREA MYCODE, CODE, READONLY  ; Code section
        ENTRY                        ; Start of the program

START
        LDR R0, =ARRAY              ; Load the address of the array into R0
        LDR R1, =SIZE               ; Load the address of SIZE into R1
        LDR R2, [R1]                ; Load the size of the array into R2 (R2 = 5)

        LDR R3, [R0]                ; Load the first element of the array into R3 (MAX = ARRAY[0])

LOOP
        ADD R0, R0, #4              ; Move to the next element in the array
        LDR R4, [R0]                ; Load the next element into R4
        CMP R3, R4                  ; Compare current MAX (R3) with the element (R4)
        BGT CONTINUE                ; If MAX > element, skip updating MAX
        MOV R3, R4                  ; Update MAX (R3 = R4)

CONTINUE
        SUBS R2, R2, #1             ; Decrement the counter (R2 = R2 - 1)
        BNE LOOP                    ; Repeat loop if there are more elements

        LDR R5, =MAX                ; Load the address of MAX into R5
        STR R3, [R5]                ; Store the final maximum value in MAX

        END                         ; End of program
