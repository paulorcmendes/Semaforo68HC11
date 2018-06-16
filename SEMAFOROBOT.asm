*	SEMAFORO COM BOTONEIRA
*	PAULO RENATO E FELIPE BRENO
*	PROF TADEU

	ORG	$0000

SEMG	EQU	$0000
SEMY	EQU	$0001
SEMR	EQU	$0002
PORTB	EQU	$1004
PORTC	EQU	$1003
DDRC	EQU	$1007

	FCB	%00000110
	FCB	%00001010
	FCB	%00010001
	FCB	$01
*inutilizando outros pinos de c
	ldaa	#$00
	staa	portb
	ldaa	#%11111110
	staa	ddrc

*laco principal
VOLTA	LDAA	SEMG
	STAA	PORTB	
TESTE	LDAB	PORTC
	DECB
	BNE	TESTE
	JSR	FECHA
	BRA	VOLTA

FECHA	JSR	DELAYB
	JSR	RESTART
	LDAA	SEMY
	STAA	PORTB
	JSR	DELAYYP
	LDAA	SEMR
	STAA	PORTB
	JSR	DELAYRP
	rts

*reiniciar PC0
RESTART	ldaa	#$00
	staa	portb
	ldaa	#%11111111
	staa	ddrc
	ldaa	#%11111110
	staa	ddrc
	rts


delayYP	ldy	#10000
cont1	dey
	bne	cont1
	rts


delayRP	ldy	#20000
cont2	dey
	bne	cont2
	rts
	
delayB	ldy	#10000
cont3	dey
	bne	cont3
	rts
