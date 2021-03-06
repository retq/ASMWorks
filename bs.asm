MYSS SEGMENT PARA STACK 'MYSTACK'
	DB 20 DUP(?)
MYSS ENDS

MYDS SEGMENT PARA 'MYDATA'
DIZI DW 3, 7, 8, 11, 13, 29, 36, 43, 44, 47, 48, 50, 51, 54, 56, 61, 63, 69, 71, 75, 82, 83
DW 86, 87, 88, 93, 97, 101, 105, 107
DW 110, 113, 115, 121, 122, 127, 134
DW 136, 139, 141, 143, 144, 146, 148
DW 150, 153, 158, 165, 168, 169, 171
DW 172, 175, 193, 194, 196, 199, 212
DW 220, 229, 231, 233, 234, 244, 258
DW 264, 265, 267, 272, 274, 275, 277
DW 283, 289, 296, 297, 305, 307, 310
DW 312, 318, 320, 322, 324, 328, 337
DW 348, 349, 358, 359, 369, 370, 371
DW 373, 376, 377, 378, 379, 385, 394
DW 399, 408, 411, 419, 422, 429, 430
DIZISAYISI DB 106
X DW 399
MYDS ENDS

MYCS SEGMENT PARA 'MYCODE'
	ASSUME CS:MYCS, DS:MYDS, SS:MYSS
MAIN PROC FAR
		PUSH DS
		XOR AX,AX
		PUSH AX
		MOV AX,MYDS
		MOV DS,AX

		XOR AX,AX
		MOV DX,X
		MOV CL,2
		MOV BH,0
		MOV BL,DIZISAYISI
LDON:   MOV AL,BL
		ADD AL,BH
		DIV CL
		CMP BH,BL
		JA LEND
		XOR AH,AH
		MUL CL
		MOV SI,AX
		DIV CL
		CMP DIZI[SI],DX
		JZ LEND
		JA LELSE
		INC AL
		MOV BH,AL
		JMP LDON
LELSE:  DEC AL
		MOV BL,AL
		JMP LDON
LEND:   CMP BH,BL
		JBE LRET
		XOR AX,AX
		MOV AL,DIZISAYISI
		INC AL
LRET:	RETF
MAIN ENDP

MYCS ENDS

END MAIN
