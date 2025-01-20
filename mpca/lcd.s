.DATA

A: .ASCIZ "FOOD"

.TEXT
MOV R0,#0
MOV R1,#7
LDR R2,=A

LOOP1: SWI 0X206 ;Clear one line in the display on the LCD screen.r0-line no(y)
	  LDR R2,=A
	  SWI 0X204; display a string on screen address should be in r2 reg
	  ADD R0,R0,#1
	  CMP R0,#29
	  BNE LOOP1
	  CMP R0,#29
	  BEQ LOOP2
	  
	  
LOOP2: MOV R0,#39
	   MOV R1,#8
	   MOV R2,#10 ;integer to be displayed in R2
	   B LOOP3
	   
LOOP3: SWI 0X205 ; Display an integer on the LCD screen
	   SUB R0,R0,#1
	   CMP R0,#0
	   SWI 0X206
	   BNE LOOP3
	   SWI 0X11
	   
.END
