		include "../../includes/hardware.inc"
		include "../../includes/common.inc"

SHEILA_RAMDAC		EQU	$FE28
SHEILA_RAMDAC_WR_ADD	EQU	SHEILA_RAMDAC
SHEILA_RAMDAC_RD_ADD	EQU	SHEILA_RAMDAC + 3
SHEILA_RAMDAC_VAL	EQU	SHEILA_RAMDAC + 1
SHEILA_RAMDAC_MASK	EQU	SHEILA_RAMDAC + 2


A_SAV			EQU	$80

		CODE
		ORG		$2000

		; set up a mode 2 palette with ramdac_p[6,3,2,0] containing colour number

		LDA	#$AA
		STA	SHEILA_RAMDAC_MASK

		CLR	SHEILA_RAMDAC_WR_ADD

		LDX	#$2FD0
		LDB	#0
lp		TFR	B,A
		CLR	A_SAV
		ROLA
		ROL	A_SAV
		ROLA
		ROLA
		ROL	A_SAV
		ROLA
		ROLA
		ROL	A_SAV
		ROLA
		ROLA
		ROL	A_SAV
		LDA 	A_SAV
		ADDA	A_SAV
		ADDA	A_SAV
		STA	A_SAV
		LDA	A,X
		LSRA
		LSRA
		STA	SHEILA_RAMDAC_VAL
		INC	A_SAV
		LDA	A_SAV
		LDA	A,X
		LSRA
		LSRA
		STA	SHEILA_RAMDAC_VAL
		INC	A_SAV
		LDA	A_SAV
		LDA	A,X
		LSRA
		LSRA
		STA	SHEILA_RAMDAC_VAL

		INCB
		BNE	lp

		SWI





