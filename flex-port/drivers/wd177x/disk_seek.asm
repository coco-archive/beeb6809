	* SEEK
	*
	* SEEK THE SPECIFIED TRACK
SEEK		CMPB	#SMAXS0+1			; DB: CHECK SIDE
		PSHS	D,CC
		LDA	CURDRV
		JSR	SETDRVREG
		PULS	D,CC
		STB	SECREG				; SET SECTOR
		CMPA	TRKREG				; DIF THAN LAST?
		BEQ	SEEK4				; EXIT IF NOT
		STA	DATREG				; SET NEW WD TRACK
		LBSR	DEL32U				; GO DELAY
		ORCC	#$50
		LDA	#SKCMND				; SETUP SEEK COMMAND
		STA	COMREG				; ISSUE SEEK COMMAND
		LBSR	DEL32U				; GO DELAY
		BSR	WAIT				; WAIT TIL DONE
		ANDCC	#$AF
		BITB	#$10				; CHECK FOR SEEK ERROR
SEEK4		LBRA	DEL32U				; DELAY
