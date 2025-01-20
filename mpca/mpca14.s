.data
str:    .asciz "Hello, World!"
char_to_find:   .asciz "l"

.text
.global main

main:
    ldr r0, =str
    ldrb r1, =char_to_find
    mov r2, #0
    
search_loop:
    ldrb r3, [r0], #1
    cmp r3, #0
    beq end_search
    cmp r3, r1
    bne search_loop
    add r2, r2, #1
    b search_loop

end_search:
    mov r7, #1
    mov r0, #0
    swi 0x11
