***************************************************************************
* GENERAL MEMORY MAP AND CONSTANTS
***************************************************************************


BASWKSP_INTVAR		EQU $400				; @%
BASWKSP_PPERCENT	EQU BASWKSP_INTVAR + 4 * ('P' - 'A')	; P%
BASWKSP_DYNVAR_HEADS	EQU $480
BASWKSP_DYNVAR_off_PROC	EQU $F6
BASWKSP_DYNVAR_off_FN	EQU $F8
BASWKSP_FPTEMP1		EQU $46C
BASWKSP_FPTEMP2		EQU $471
BASWKSP_FPTEMP3		EQU $476
BASWKSP_FPTEMP4		EQU $47B
BASWKSP_REPEATSTACK	EQU $500
BASWKSP_FORSTACK	EQU $528
BASWKSP_GOSUBSTACK	EQU $5CC
BASWKSP_STRING		EQU $600

FORSTACK_ITEM_SIZE	EQU	15
FORSTACK_MAX_ITEMS	EQU	10
FORSTACK_OFFS_VARPTR	EQU	0
FORSTACK_OFFS_VARTYPE	EQU	2
FORSTACK_OFFS_STEP	EQU	3	; 5 bytes for real, 4 for int
FORSTACK_OFFS_TO	EQU	8	; 5 bytes for real, 4 for int
FORSTACK_OFFS_LOOP	EQU	13	; pointer to start of loop instructions

GOSUBSTACK_MAX		EQU	17

BAS_StrA		EQU $600
BAS_InBuf		EQU $700

VAR_TYPE_BYTE		EQU	$00
VAR_TYPE_INT_LE		EQU	$02	; new type, int 32 in LE order for ! operator
VAR_TYPE_INT		EQU	$04
VAR_TYPE_REAL		EQU	$05
VAR_TYPE_STRING_STAT	EQU	$80
VAR_TYPE_STRING_DYN	EQU	$81

MACH_STACK_TOP		EQU	$200

