.data
a: .word 1, 2, 3
   .word 4, 5, 6
   .word 7, 8, 9

.text
.global main

main:
    ldr r0, =a             
    mov r1, #0             
    mov r2, #3             
    mov r3, #3             
    mov r4, #0             
    mov r5, #0             

for_i:
    stmfd sp!, {r4, r5}    
    mov r6, r4             
    mov r7, r5             
    bl get_addr            
    ldmfd sp!, {r4, r5}    
    ldr r6, [r6]           
    add r1, r1, r6         
    add r5, r5, #1         
    cmp r5, r3             
    bne for_i              
    mov r5, #0             
    add r4, r4, #1         
    cmp r4, r2             
    bne for_i              

    b exit_program         

get_addr:
    stmfd sp!, {r4, r5}    
    mov r6, r4             
    mov r7, r5             
    mul r4, r6, r3         
    add r4, r4, r7         
    add r4, r4, r4         
    ldr r5, =a             
    add r5, r5, r4         
    ldmfd sp!, {r4, r5}    
    bx lr                  

exit_program:
    mov r7, #1             
    mov r0, #0
    SWI 0x11
