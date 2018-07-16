	* READ
	*
	* READ ONE SECTOR
READ		BSR	SEEK				; SEEK TO TRACK
		LDA	#RDCMND				; SETUP READ SECTOR COMMAND
	IF DRIVERS_FLEX
		TST	PRCNT				; ARE WE SPOOLING?
		BEQ	READ2				; SKIP IF NOT
		SWI3					; ELSE, SWITCH TASKS
		NOP					; NECESSARY FOR SBUG
	ENDIF
READ2		ORCC	#$50				; DISABLE INTERRUPTS
		STA	COMREG				; ISSUE READ COMMAND
		LBSR	DEL32U				; DELAY
		CLRB					; GET SECTOR LENGTH (=256)
READ3		LDA	COMREG				; GET WD STATUS
		BITA	#DRQ				; CHECK FOR DATA
		BNE	READ5				; BRANCH IF DATA PRESENT
		BITA	#BUSY				; CHECK IF BUSY
		BNE	READ3				; LOOP IF SO
		TFR	A,B				; ERROR IF NOT
		BRA	READ6
READ5		LDA	DATREG				; GET DATA BYTE
		STA	,X+				; PUT IN MEMORY
		DECB					; DEC THE COUNTER
		BNE	READ3				; LOOP TIL DONE
		BSR	WAIT				; WAIT TIL WD IS FINISHED
READ6		BITB	#DRQ
		BEQ	1F	
		TST	DATREG				; DB: clear pending data	
1		TST	COMREG
		BITB	#RDMSK				; MASK ERRORS
		ANDCC	#$AF				;  ENABLE INTERRUPTS
		RTS					;  RETURN
