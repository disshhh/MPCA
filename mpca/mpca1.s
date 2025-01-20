.text

	MOV RO, #15
	MOV R1, #15 
	CMP RO, R1 
	BNE BRANCH
	ADD R3, R0, R1 
	SWI 0X011
BRANCH:
	SUB R3, RO, R1
.end

