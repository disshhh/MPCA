.data
a: .asciz "Hello, World!" ; The string to process

.text
    ldr r0, =a              ; Load the address of the string 'a' into register r0
    mov r1, #0              ; Initialize the length of the string (r1) to 0
    
loop:
    ldrb r2, [r0], #1       ; Load a byte from the memory address pointed by r0 into register r2 and increment r0
    cmp r2, #0              ; Compare the byte loaded with 0 (null terminator)
    beq end_loop            ; If the byte is 0, exit the loop
    add r1, r1, #1          ; Otherwise, increment the length of the string (r1)
    b loop                  ; Repeat the loop
    
end_loop:
    mov r7, #1              ; Terminate the program using SWI interrupts like swi 0x002
    mov r0, #0
    SWI 0x002
    
.end
