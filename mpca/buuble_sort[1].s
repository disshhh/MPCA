/*BUBBLE SORT*/
A: .WORD 30,20,10,40,50
MOV R0, #0 ;Counter
MOV R9,#0
MOV R5,#4
LDR R1,=A
LDR R2,[R1] 

LOOP:
CMP R0,#4
BEQ L3
LDR R3,[R1,#4]
CMP R2, R3
BGT L2
BLT L4

L2: MOV R5,R3
    ADD R0,R0,#1 ;j val 
    STR R2,[R1,#4]
    STR R3,[R1]
    ADD R1,R1,#4
    B LOOP
L4: ADD R1,R1,#4
    ADD R0,R0,#1
    B LOOP
    
L3:CMP R9,#5
   BEQ EXIT
   SUB R1,R1,#16
   LDR R2,[R1]
   ADD R9,R9,#1
   MOV R0,#0
   B LOOP 
   
EXIT: SWI 0X11    

  