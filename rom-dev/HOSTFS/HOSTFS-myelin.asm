VERSION_NAME	MACRO
		FCB	"HOSTFS-myelin"
		ENDM

fred_MYELIN_SERIAL_STATUS	EQU	$FCA1
fred_MYELIN_SERIAL_DATA		EQU	$FCA0
MYELIN_SERIAL_TXRDY		EQU	2
MYELIN_SERIAL_RXRDY		EQU	1
MYELIN				EQU	1

		include	"./HOSTFS-core.asm"
