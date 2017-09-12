		include "../../includes/hardware.inc"
		include "../../includes/common.inc"

SHEILA_RAMDAC		EQU	$FE28
SHEILA_RAMDAC_WR_ADD	EQU	SHEILA_RAMDAC
SHEILA_RAMDAC_RD_ADD	EQU	SHEILA_RAMDAC + 3
SHEILA_RAMDAC_VAL	EQU	SHEILA_RAMDAC + 1
SHEILA_RAMDAC_MASK	EQU	SHEILA_RAMDAC + 2


		CODE
		ORG		$2000

		LDA	#$FF
		STA	SHEILA_RAMDAC_MASK

		CLR	SHEILA_RAMDAC_WR_ADD

		CLRB
1		TFR	B,A
		ANDA	#$F
		ASLA
		ASLA
		STA	SHEILA_RAMDAC_VAL
		STA	SHEILA_RAMDAC_VAL
		STA	SHEILA_RAMDAC_VAL
		INCB
		BNE	1B

		CLR	SHEILA_RAMDAC_RD_ADD
		LDX	#$5800
1		LDA	SHEILA_RAMDAC_VAL
		STA	,X+
		LDA	SHEILA_RAMDAC_VAL
		STA	,X+
		LDA	SHEILA_RAMDAC_VAL
		STA	,X+
		LEAX	13,X
		INCB
		BNE	1B

		SWI




