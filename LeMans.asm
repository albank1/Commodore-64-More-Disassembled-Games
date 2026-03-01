;======================================================================================
; Le Mans (1982, Commodore)
; Disassembly of the game. 
; After watching Robin on 8-Bit Show And Tell I have made the change
; so BOUNS is corrected to BONUS and table where difficulty is determined indicated
; at $F564
; To assemble to a cartride images:
; a) run dasm lemans.asm -olemans.bin -f3
; b) cartconv -t ulti -i lemans.bin -o lemans.crt
;======================================================================================

	processor 6502

	.org $E000

	pha	 	
	txa	 
	pha	 
	tya	 
	pha	 
	jmp	($0002)	 
WE008:
	lda	$11	
	beq	WE00F	
	jsr	WF5A9	
WE00F:
	Inc	$14	
	inc	$14	
	lda	$14	
	cmp	#$3C	 
	bcc	WE020	
	ldy	#$00	 
	sty	$14	
	iny	 
	sty	$15	
WE020:
	lda	#$01	 
	sta	$19	
	lda	$DC0D	
	pla	 
	tay	 
	pla	 
	tax	 
	pla	 
	rti	 
WE02D:
	bpl	WE02F	
WE02F:
	brk	 
	brk	 
	brk	 
	clc	 
	brk	 
	asl.w	$0000,x	
	sei	 
	lda	#$00	 
	sta	$0E	
	sta	$0F	
	sta	$10	
	ldx	#$FA	 
	txs	 
	cld	 
	ldx	#$09	 
WE046:
	lda	WE02D,x	
	sta	$D011,x	
	dex	 
	bpl	WE046	
	lda	#$7F	 
	sta	$DC0D	
	lda	#$08	 
	sta	$DC0E	
	sta	$DC0F	
	ldx	#$00	 
	stx	$DC03	
	dex	 
	stx	$DC02	
	lda	#$E5	 
	sta	$01	
	lda	#$2F	 
	sta	$00	
	lda	#$1A	 
	sta	$DC04	
	lda	#$41	 
	sta	$DC05	
	lda	#$81	 
	sta	$DC0D	
	lda	#$11	 
	sta	$DC0E	
	lda	#$08	 
	sta	$02	
	lda	#$E0	 
	sta	$03	
	cli	 
	cld	 
	lda	#$00	 
	sta	$0A	
	sta	$0B	
	sta	$0C	
	sta	$1B	
	sta	$1C	
	sta	$23	
	sta	$24	
	sta	$27	
	sta	$28	
	sta	$08	
	sta	$09	
	sta	$16	
	sta	$D015	
	ldy	#$0A	 
WE0AA:
	sta	$D000,y	
	dey	 
	bpl	WE0AA	
	sta	$1E	
	lda	#$64	 
	sta	$1F	
	lda	#$07	 
	sta	$1A	
	jsr	WE479	
WE0BD:
	sei	 
	ldx	#$FA	 
	txs	 
	lda	#$00	 
	sta	$D418	
	lda	#$D3	 
	sta	$02	
	lda	#$E0	 
	sta	$03	
	cli	 
	cld	 
	jmp	WE34C	
	lda	#$FF	 
	sta	$DC00	
	lda	$DC01	
	and	#$04	 
	beq	WE0EB	
	lda	#$FE	 
	sta	$DC00	
	lda	$DC01	
	and	#$10	 
	bne	WE0F9	
WE0EB:
	lda	#$08	 
	sta	$02	
	lda	#$E0	 
	sta	$03	
	lda	$DC0D	
	jmp	WE0FC	
WE0F9:
	jmp	WE008	
WE0FC:
	sei	 
	ldx	#$FA	 
	txs	 
	cld	 
	cli	 
	ldx	#$00	 
	stx	$0A	
	stx	$0B	
	stx	$0C	
	stx	$1B	
	stx	$1C	
	stx	$24	
	stx	$26	
	stx	$27	
	stx	$28	
	stx	$25	
	stx	$20	
	stx	$42	
	stx	$43	
	stx	$11	
	stx	$12	
	stx	$13	
	stx	$4B	
	stx	$4C	
	stx	$17	
	stx	$53	
	stx	$54	
	stx	$58	
	stx	$59	
	stx	$64	
	stx	$65	
	stx	$66	
	stx	$67	
	stx	$6B	
	stx	$6C	
	stx	$6D	
	stx	$6E	
	stx	$6F	
	stx	$70	
	stx	$71	
	stx	$55	
	stx	$77	
	stx	$34	
	stx	$35	
	stx	$36	
	stx	$37	
	stx	$30	
	stx	$31	
	stx	$32	
	stx	$33	
	stx	$D017	
	stx	$D01B	
	stx	$D01D	
	stx	$D026	
	stx	$1E	
	inx	 
	stx	$2B	
	stx	$4E	
	stx	$4F	
	lda	#$04	 
	sta	$5A	
	lda	#$06	 
	sta	$41	
	lda	#$07	 
	sta	$1A	
	lda	#$0F	 
	sta	$D025	
	lda	#$3C	 
	sta	$18	
	lda	#$60	 
	sta	$16	
	lda	#$64	 
	sta	$1F	
	lda	#$70	 
	sta	$2A	
	lda	#$8F	 
	sta	$D015	
	lda	#$FF	 
	sta	$D01C	
	sta	$50	
	sta	$51	
	lda	#$00	 
	ldy	#$18	 
WE1A4:
	sta	$D400,y	
	dey	 
	bpl	WE1A4	
	lda	#$02	 
	sta	$D403	
	sta	$D40A	
	lda	#$08	 
	sta	$D40C	
	lda	#$F9	 
	sta	$D40D	
	lda	#$2F	 
	sta	$D418	
	lda	#$BE	 
	sta	$D416	
	lda	#$F0	 
	sta	$D414	
	lda	#$FB	 
	sta	$D406	
	jsr	WE753	
	jsr	WE808	
	lda	#$0E	 
	sta	$D027	
	lda	#$F4	 
	sta	$07F8	
	lda	#$89	 
	sta	$D000	
	ldx	#$0F	 
WE1E7:
	stx	$23	
	jsr	WE889	
	jsr	WE5F4	
	ldy	#$01	 
	jsr	WE45B	
	ldx	$23	
	dex	 
	bpl	WE1E7	
	lda	#$0A	 
	sta	$D401	
	lda	#$41	 
	sta	$D404	
	ldx	#$FA	 
WE205:
	stx	$23	
	cpx	#$CA	 
	beq	WE259	
	cpx	#$C9	 
	beq	WE229	
	cpx	#$C8	 
	beq	WE241	
	cpx	#$CB	 
	bne	WE26B	
	ldy	#$1F	 
WE219:
	lda	WECAB,y	
	sta	$0400,y	
	lda	#$0A	 
	sta	$D800,y	
	dey	 
	bpl	WE219	
	bmi	WE26E	
WE229:
	jsr	WE889	
	ldy	#$07	 
WE22E:
	tya	 
	and	#$01	 
	clc	 
	adc	#$2D	 
	sta	$0404,y	
	lda	#$08	 
	sta	$D804,y	
	dey	 
	bpl	WE22E	
	bmi	WE26E	
WE241:
	jsr	WE889	
	ldy	#$07	 
WE246:
	tya	 
	and	#$01	 
	clc	 
	adc	#$2B	 
	sta	$0404,y	
	lda	#$08	 
	sta	$D804,y	
	dey	 
	bpl	WE246	
	bmi	WE26E	
WE259:
	ldy	#$1F	 
WE25B:
	lda	WEC8B,y	
	sta	$0400,y	
	lda	#$0A	 
	sta	$D800,y	
	dey	 
	bpl	WE25B	
	bmi	WE26E	
WE26B:
	jsr	WE889	
WE26E:
	jsr	WE5F4	
	ldx	$23	
	txa	 
	clc	 
	adc	#$08	 
	sta	$D001	
	ldy	#$01	 
	jsr	WE45B	
	dex	 
	cpx	#$BB	 
	bcc	WE287	
	jmp	WE205	
WE287:
	lda	#$00	 
	sta	$D404	
	ldy	#$01	 
	jsr	WE44D	
	lda	#$05	 
	sta	$D401	
	lda	#$40	 
	sta	$D404	
	ldy	#$01	 
	jsr	WE44D	
	lda	#$0E	 
	sta	$D02E	
	lda	#$F4	 
	sta	$07FF	
	lda	#$C3	 
	sta	$D00F	
	lda	#$19	 
	sta	$D001	
	sta	$D003	
	sta	$D005	
	sta	$D007	
	lda	#$89	 
	sta	$D00E	
	sta	$D000	
	sta	$D002	
	sta	$D004	
	sta	$D006	
	ldx	#$03	 
WE2D0:
	stx	$23	
	ldy	#$02	 
	jsr	WE44D	
	lda	WE344,x	
	sta	$D408	
	lda	#$11	 
	sta	$D40B	
	lda	#$08	 
	ldy	#$07	 
WE2E6:
	sta	$DA34,y	
	sta	$DA5C,y	
	dey	 
	bpl	WE2E6	
	lda	WE338,x	
	sta	$04	
	lda	WE33C,x	
	sta	$05	
	lda	WE340,x	
	ldx	#$03	 
WE2FE:
	ldy	WF43A,x	
	sta	($04),y	
	dex	 
	bpl	WE2FE	
	ldy	#$0A	 
	jsr	WE45B	
	ldx	$23	
	lda	WE348,x	
	sta	$D40B	
	dex	 
	bpl	WE2D0	
	lda	#$00	 
	sta	$23	
	lda	#$3C	 
	sta	$52	
	lda	#$08	 
	sta	$1A	
	lda	#$90	 
	sta	$D40C	
	sei	 
	lda	#$54	 
	sta	$02	
	lda	#$EE	 
	sta	$03	
	cli	 
	lda	#$01	 
	sta	$11	
	jmp	WEB34	
WE338:	
	.byte $3A, $38, $36, $34	
WE33C:	
	.byte $DA, $DA, $DA, $DA	
WE340:	
	.byte $0B, $0F, $0A, $0A	
WE344:
	.byte $59, $2C, $2C, $2C	
WE348:
	.byte $10, $00, $00, $00	
WE34C:
	lda	#$07	 
	sta	$1A	
	ldx	#$00	 
WE352:
	stx	$23	
	jsr	WE889	
	ldx	$23	
	ldy	WE43D,x	
	ldx	#$00	 
WE35E:
	lda	WE3AD,y	
	sta	$0408,x	
	lda	#$03	 
	sta	$D808,x	
	iny	 
	inx	 
	cpx	#$10	 
	bcc	WE35E	
	jsr	WE5F4	
	ldy	#$02	 
	jsr	WE45B	
	ldx	$23	
	inx	 
	cpx	#$10	 
	bcc	WE352	
	ldx	#$03	 
WE380:
	stx	$23	
	jsr	WE889	
	jsr	WE5F4	
	ldy	#$02	 
	jsr	WE45B	
	ldx	$23	
	dex	 
	bpl	WE380	
WE392:
	ldy	#$14	 
	jsr	WE45B	
	lda	$DAB0	
	eor	#$03	 
	ldy	#$0F	 
WE39E:
	sta	$DAB0,y	
	sta	$DAD8,y	
	sta	$DB00,y	
	dey	 
	bpl	WE39E	
	jmp	WE392	
WE3AD:
	.byte $1B, $03, $1C, $20, $22, $2A, $29, $23 
	.byte $20, $02, $19, $20, $20, $20, $20, $20 
	.byte $20, $20, $20, $03, $0F, $0D, $0D, $0F	
	.byte $04, $0F, $12, $05, $20, $20 
	.byte $20, $20, $05, $0C, $05, $03, $14, $12 
	.byte $0F, $0E, $09, $03, $13, $20, $0C, $14 
	.byte $04, $1E, $20, $20, $20, $20, $20, $20 
	.byte $01, $0E, $04, $20, $20, $20, $20, $20 
	.byte $20, $20, $20, $08, $01, $0C, $20, $0C 
	.byte $01, $02, $0F, $12, $01, $14, $0F, $12 
	.byte $19, $20, $20, $20, $10, $15, $13, $08 
	.byte $20, $1D, $06, $22, $1D, $20, $0F, $12 
	.byte $20, $20, $02, $15, $14, $14, $0F, $0E 
	.byte $20, $0F, $0E, $20, $10, $01, $04, $04 
	.byte $0C, $05, $20, $20, $20, $20, $14, $0F 
	.byte $20, $13, $14, $01, $12, $14, $20, $20 
	.byte $20, $20, $20, $20, $20, $20, $20, $20 
	.byte $20, $20, $20, $20, $20, $20, $20, $20 
	.byte $20, $20	 
WE43D:
	.byte $80, $70, $60, $50, $80, $80, $80, $40 
	.byte $80, $30, $80, $20, $10, $80, $00 
	.byte $80
WE44D:
	.byte $A9, $00, $85, $14, $85, $15
WE453:
	lda	$15	
	beq	WE453	
	dey	 
	bne	WE44D	
	rts	 
	 
WE45B:
	lda	#$00	 
	sta	$19	
WE45F:
	lda	$19	
	beq	WE45F	
	dey	 
	bne	WE45B	
	rts	 
WE467:
	ldy	#$00	 
WE469:
	sta	$0400,y	
	sta	$0500,y	
	sta	$0600,y	
	sta	$06E8,y	
	iny	 
	bne	WE469	
	rts	 
WE479:
	lda	#$44	 
	jsr	WE467	
	lda	#$00	 
	sta	$D020	
	sta	$D021	
	lda	#$08	 
	sta	$D022	
	lda	#$0F	 
	sta	$D023	
	lda	#$0C	 
	ldy	#$00	 
WE494:
	sta	$D800,y	
	sta	$D900,y	
	sta	$DA00,y	
	sta	$DAE8,y	
	iny	 
	bne	WE494	
	lda	#$20	 
	sta	$04	
	lda	#$04	 
	sta	$05	
	ldx	#$18	 
WE4AD:
	ldy	#$07	 
	lda	#$20	 
WE4B1:
	sta	($04),y	
	dey	 
	bpl	WE4B1	
	lda	$04	
	clc	 
	adc	#$28	 
	sta	$04	
	lda	$05	
	adc	#$00	 
	sta	$05	
	dex	 
	bpl	WE4AD	
	ldy	#$07	 
WE4C8:
	lda	WE5D4,y	
	sta	$0448,y	
	lda	WE5DC,y	
	sta	$04C0,y	
	lda	WE5E4,y	
	sta	$0538,y	
	lda	WE5EC,y	
	sta	$05B0,y	
	lda	#$01	 
	sta	$D848,y	
	sta	$D9B0,y	
	sta	$DA50,y	
	sta	$DA78,y	
	lda	#$03	 
	sta	$D8C0,y	
	sta	$D9D8,y	
	sta	$DA00,y	
	lda	#$04	 
	sta	$DAA0,y	
	sta	$DAC8,y	
	sta	$DAF0,y	
	sta	$DB18,y	
	sta	$DB40,y	
	sta	$DB68,y	
	lda	#$05	 
	sta	$D938,y	
	lda	#$07	 
	sta	$D870,y	
	sta	$D8E8,y	
	sta	$D960,y	
	sta	$DBB8,y	
	sta	$DBE0,y	
	dey	 
	bpl	WE4C8	
	ldy	#$71	 
	sty	$05DE	
	iny	 
	sty	$05DF	
	iny	 
	sty	$0606	
	iny	 
	sty	$0607	
	jsr	WE753	
	jsr	WE808	
	lda	#$00	 
	sta	$04	
	lda	#$04	 
	sta	$05	
	ldx	#$18	 
WE547:
	ldy	#$03	 
WE549:
	cpy	#$00	 
	bne	WE556	
	txa	 
	and	#$03	 
	bne	WE556	
	lda	#$57	 
	bne	WE559	
WE556:
	lda	WEAE0,y	
WE559:
	sta	($04),y	
	dey	 
	bpl	WE549	
	lda	$04	
	clc	 
	adc	#$28	 
	sta	$04	
	lda	$05	
	adc	#$00	 
	sta	$05	
	dex	 
	bpl	WE547	
	lda	#$19	 
	sta	$04	
	lda	#$04	 
	sta	$05	
	ldx	#$18	 
WE578:
	ldy	#$03	 
WE57A:
	cpy	#$02	 
	bne	WE587	
	txa	 
	and	#$03	 
	bne	WE587	
	lda	#$46	 
	bne	WE58A	
WE587:
	lda	WEAC0,y	
WE58A:
	sta	($04),y	
	dey	 
	bpl	WE57A	
	lda	$04	
	clc	 
	adc	#$28	 
	sta	$04	
	lda	$05	
	adc	#$00	 
	sta	$05	
	dex	 
	bpl	WE578	
	lda	#$07	 
	sta	$04	
	lda	#$D8	 
	sta	$05	
	ldx	#$18	 
WE5A9:
	ldy	#$13	 
	lda	#$0E	 
WE5AD:
	sta	($04),y	
	dey	 
	bpl	WE5AD	
	lda	$04	
	clc	 
	adc	#$28	 
	sta	$04	
	lda	$05	
	adc	#$00	 
	sta	$05	
	dex	 
	bpl	WE5A9	
	ldx	#$18	 
WE5C4:
	lda	#$1A	 
	sta	$79,x	
	lda	#$E0	 
	sta	$92,x	
	lda	#$07	 
	sta	$AB,x	
	dex	 
	bpl	WE5C4	
	rts	 
WE5D4:	
	.byte $20, $13, $03, $0F, $12, $05
	.byte $20, $20	
WE5DC:
	.byte $20, $20, $14, $09, $0D, $05, $20 
	.byte $20
WE5E4:
	.byte $08, $09, $1F, $13, $03, $0F, $12, $05 
WE5EC:
	.byte $20, $13, $10, $05, $05, $04
	.byte $20, $20
WE5F4:
	ldy	#$1F	 
WE5F6:
	lda	$0798,y	
	sta	$07C0,y	
	lda	$0770,y	
	sta	$0798,y	
	lda	$0748,y	
	sta	$0770,y	
	lda	$0720,y	
	sta	$0748,y	
	lda	$06F8,y	
	sta	$0720,y	
	lda	$06D0,y	
	sta	$06F8,y	
	lda	$06A8,y	
	sta	$06D0,y	
	lda	$0680,y	
	sta	$06A8,y	
	lda	$0658,y	
	sta	$0680,y	
	lda	$0630,y	
	sta	$0658,y	
	lda	$0608,y	
	sta	$0630,y	
	lda	$05E0,y	
	sta	$0608,y	
	lda	$05B8,y	
	sta	$05E0,y	
	lda	$0590,y	
	sta	$05B8,y	
	lda	$0568,y	
	sta	$0590,y	
	lda	$0540,y	
	sta	$0568,y	
	lda	$0518,y	
	sta	$0540,y	
	lda	$04F0,y	
	sta	$0518,y	
	lda	$04C8,y	
	sta	$04F0,y	
	lda	$04A0,y	
	sta	$04C8,y	
	lda	$0478,y	
	sta	$04A0,y	
	lda	$0450,y	
	sta	$0478,y	
	lda	$0428,y	
	sta	$0450,y	
	lda	$0400,y	
	sta	$0428,y	
	lda	$DB98,y	
	sta	$DBC0,y	
	lda	$DB70,y	
	sta	$DB98,y	
	lda	$DB48,y	
	sta	$DB70,y	
	lda	$DB20,y	
	sta	$DB48,y	
	lda	$DAF8,y	
	sta	$DB20,y	
	lda	$DAD0,y	
	sta	$DAF8,y	
	lda	$DAA8,y	
	sta	$DAD0,y	
	lda	$DA80,y	
	sta	$DAA8,y	
	lda	$DA58,y	
	sta	$DA80,y	
	lda	$DA30,y	
	sta	$DA58,y	
	lda	$DA08,y	
	sta	$DA30,y	
	lda	$D9E0,y	
	sta	$DA08,y	
	lda	$D9B8,y	
	sta	$D9E0,y	
	lda	$D990,y	
	sta	$D9B8,y	
	lda	$D968,y	
	sta	$D990,y	
	lda	$D940,y	
	sta	$D968,y	
	lda	$D918,y	
	sta	$D940,y	
	lda	$D8F0,y	
	sta	$D918,y	
	lda	$D8C8,y	
	sta	$D8F0,y	
	lda	$D8A0,y	
	sta	$D8C8,y	
	lda	$D878,y	
	sta	$D8A0,y	
	lda	$D850,y	
	sta	$D878,y	
	lda	$D828,y	
	sta	$D850,y	
	lda	$D800,y	
	sta	$D828,y	
	dey	 
	bmi	WE71C	
	jmp	WE5F6	 
WE71C:
	ldy	#$17	 
WE71E:
	lda	$0079,y	
	sta	$007A,y	
	lda	$0092,y	
	sta	$0093,y	
	lda	$00AB,y	
	sta	$00AC,y	
	dey	 
	bpl	WE71E	
	rts	 
WE734:
	sty	$4A	
	ldy	#$05	 
WE738:
	asl	$08	
	rol	$09	
	rol	 
	rol	 
	eor	$08	
	rol	 
	eor	$08	
	lsr	 
	lsr	 
	eor	#$FF	 
	and	#$01	 
	ora	$08	
	sta	$08	
	dey	 
	bpl	WE738	
	ldy	$4A	
	rts	 
WE753:
	lda	$0E	
	sec	 
	sbc	$0A	
	lda	$0F	
	sbc	$0B	
	lda	$10	
	sbc	$0C	
	bcs	WE76E	
	lda	$0A	
	sta	$0E	
	lda	$0B	
	sta	$0F	
	lda	$0C	
	sta	$10	
WE76E:
	lda	#$60	 
	sta	$06	
	lda	#$05	 
	sta	$07	
	lda	#$00	 
	sta	$0D	
	tay	 
	lda	$10	
	sta	$22	
	jsr	WE7D8	
	lda	$0F	
	sta	$22	
	jsr	WE7D8	
	lda	$0E	
	sta	$22	
	jsr	WE7D8	
	lda	#$21	 
	sta	($06),y	
	lda	#$70	 
	sta	$06	
	lda	#$04	 
	sta	$07	
	lda	#$00	 
	sta	$0D	
	tay	 
	lda	$0C	
	sta	$22	
	jsr	WE7D8	
	lda	$0B	
	sta	$22	
	jsr	WE7D8	
	lda	$0A	
	sta	$22	
	jsr	WE7D8	
	lda	#$21	 
	sta	($06),y	
	lda	#$EB	 
	sta	$06	
	lda	#$04	 
	sta	$07	
	lda	#$00	 
	sta	$0D	
	tay	 
	lda	$16	
	sta	$22	
	jsr	WE7D8	
	lda	$0D	
	bne	WE7D7	
	dey	 
	lda	#$21	 
	sta	($06),y	
WE7D7:
	rts	 
WE7D8:
	lda	$22	
	lsr	 
	lsr	 
	lsr	 
	lsr	 
	sta	$21	
	jsr	WE7E9	
	lda	$22	
	and	#$0F	 
	sta	$21	
WE7E9:
	lda	$21	
	bne	WE7F7	
	ldx	$0D	
	bne	WE7F7	
	lda	#$20	 
	sta	($06),y	
	bne	WE800	
WE7F7:
	clc	 
	adc	#$21	 
	sta	($06),y	
	lda	#$01	 
	sta	$0D	
WE800:
	iny	 
	rts	 
	bvs	WE7E9+1	
	rts	 
	.byte $04, $04	 
	.byte $05
WE808:
	ldx #$00	
	stx	$0D	
	lda	$28	
	and	#$0F	 
	sta	$21	
	jsr	WE831	
	lda	$27	
	lsr	 
	lsr	 
	lsr	 
	lsr	 
	sta	$21	
	jsr	WE831	
	lda	$27	
	and	#$0F	 
	sta	$21	
	jsr	WE831	
	lda	$0D	
	bne	WE85C	
	inc	$0D	
	dex	 
	dex	 
WE831:
	lda	$21	
	bne	WE83D	
	ldy	$0D	
	bne	WE83D	
	ldy	#$0A	 
	bne	WE842	
WE83D:
	tay	 
	lda	#$01	 
	sta	$0D	
WE842:
	lda	WE85D,y	
	sta	$05D8,x	
	lda	WE868,y	
	sta	$05D9,x	
	lda	WE873,y	
	sta	$0600,x	
	lda	WE87E,y	
	sta	$0601,x	
	inx	 
	inx	 
WE85C:
	rts	 
WE85D:
	.byte $5B, $6D, $61, $61, $67, $6B, $6B, $5B 
	.byte $6B, $6B	
	.byte $6D
WE868:
	.byte $5C, $5F, $62, $62, $68, $6C, $6C, $5C 
	.byte $62, $62	
	.byte $6E
WE873:
	.byte $5D, $6F, $63, $65, $69, $65, $63, $6F 
	.byte $63, $65	
	.byte $6F
WE87E:
	.byte $5E, $60, $64, $66, $6A, $66, $66, $60 
	.byte $66, $66	
	.byte $70
WE889:
	lda	$25	; Utility programs pointers area
	beq	WE88F	
	dec	$25	
WE88F:
	ldy	#$1F	 
	lda	#$44	 
WE893:
	sta	$0400,y	
	dey	 
	bpl	WE893	
	ldy	$1A	
	lda	WEA9E,y	
	ldx	#$1F	 
WE8A0:
	sta	$D800,x	
	dex	 
	bpl	WE8A0	
	inc	$20	
	lda	$20	
	and	#$03	 
	sta	$20	
	lda	$1A	
	cmp	#$05	 
	bcc	WE8B7	
	jmp	WE972	
WE8B7:
	lda	$1E	
	cmp	#$10	 
	bcs	WE8BF	
	inc	$1E	
WE8BF:
	lda	$1F	
	cmp	#$54	 
	bcs	WE8CA	
	inc	$1F	
	jmp	WE9BF	
WE8CA:
	inc	$1B	
	lda	$1B	
	cmp	#$08	 
	bcc	WE90F	
	lda	#$00	 
	sta	$1B	
	lda	$1A	
	cmp	#$03	 
	bcs	WE92C	
	cmp	#$02	 
	bne	WE8E4	
	lda	#$14	 
	sta	$25	
WE8E4:
	jsr	WE734	
	lda	$08	
	and	#$03	 
	beq	WE90F	
	cmp	#$03	 
	beq	WE90F	
	cmp	#$01	 
	bne	WE912	
	lda	$1E	
	sec	 
	sbc	#$01	 
	cmp	#$10	 
	bcs	WE900	
	lda	#$10	 
WE900:
	sta	$1E	
	lda	$1F	
	clc	 
	adc	#$01	 
	cmp	#$64	 
	bcc	WE90D	
	lda	#$64	 
WE90D:
	sta	$1F	
WE90F:
	jmp	WE9BF	
WE912:
	lda	$1E	
	clc	 
	adc	#$01	 
	cmp	#$20	 
	bcc	WE91D	
	lda	#$20	 
WE91D:
	sta	$1E	
	lda	$1F	
	sec	 
	sbc	#$01	 
	cmp	#$54	 
	bcs	WE90D	
	lda	#$54	 
	bne	WE90D	
WE92C:
	cmp	#$03	 
	bne	WE953	
	lda	#$00	 
	sta	$1C	
	lda	$1E	
	cmp	#$11	 
	bcc	WE93C	
	dec	$1E	
WE93C:
	cmp	#$10	 
	bcs	WE942	
	inc	$1E	
WE942:
	lda	$1F	
	cmp	#$54	 
	bcc	WE94A	
	dec	$1F	
WE94A:
	cmp	#$53	 
	bcs	WE90F	
	inc	$1F	
	jmp	WE9BF	
WE953:
	lda	$1E	
	cmp	#$11	 
	bcc	WE95B	
	dec	$1E	
WE95B:
	cmp	#$10	 
	bcs	WE961	
	inc	$1E	
WE961:
	lda	$1F	
	cmp	#$65	 
	bcc	WE969	
	dec	$1F	
WE969:
	cmp	#$64	 
	bcs	WE9BF	
	inc	$1F	
	jmp	WE9BF	
WE972:
	lda	$1A	
	cmp	#$05	 
	bne	WE994	
	inc	$1C	
	lda	$1C	
	and	#$3F	 
	sta	$1C	
	tay	 
	lda	WEAF4,y	
	clc	 
	adc	#$10	 
	sta	$1E	
	lda	WEAF4,y	
	clc	 
	adc	#$53	 
	sta	$1F	
	jmp	WE9BF	
WE994:
	cmp	#$06	 
	bne	WE99B	
	jmp	WEA49	
WE99B:
	cmp	#$07	 
	bne	WE9A8	
	lda	$1E	
	beq	WE9BF	
	dec	$1E	
	jmp	WE9BF	
WE9A8:
	lda	$52	
	beq	WE9B1	
	dec	$52	
	jmp	WE9BF	
WE9B1:
	lda	$1E	
	cmp	#$0F	 
	bcc	WE9BD	
	lda	#$00	 
	sta	$1A	
	bne	WE9BF	
WE9BD:
	inc	$1E	
WE9BF:
	lda	$1E	
	asl	 
	clc	 
	adc	#$18	 
	sta	$79	
	lda	$1F	
	asl	 
	clc	 
	adc	#$18	 
	sta	$92	
	lda	$1F	
	lsr	 
	lsr	 
	sta	$1D	
	inc	$1D	
	lda	$1E	
	lsr	 
	lsr	 
	tay	 
	iny	 
	lda	$1A	
	sta	$AB	
	cmp	#$07	 
	bcc	WE9EB	
	cpy	#$06	 
	bcs	WE9EB	
	ldy	#$06	 
WE9EB:
	ldx	$1A	
	lda	WEAA7,x	
WE9F0:
	sta	$D801,y	
	iny	 
	cpy	$1D	
	bcc	WE9F0	
	lda	$1E	
	lsr	 
	lsr	 
	sta	$04	
	lda	#$04	 
	sta	$05	
	lda	$1E	
	and	#$03	 
	tay	 
	ldx	WEAF0,y	
	ldy	#$00	 
WEA0C:
	lda	$20	
	bne	WEA15	
	lda	WEAD0,x	
	bne	WEA18	
WEA15:
	lda	WEAE0,x	
WEA18:
	sta	($04),y	
	inx	 
	iny	 
	cpy	#$04	 
	bcc	WEA0C	
	lda	$1F	
	lsr	 
	lsr	 
	sta	$04	
	lda	#$04	 
	sta	$05	
	lda	$1F	
	and	#$03	 
	tay	 
	ldx	WEAF0,y	
	ldy	#$00	 
WEA34:
	lda	$20	
	bne	WEA3D	
	lda	WEAB0,x	
	bne	WEA40	
WEA3D:
	lda	WEAC0,x	
WEA40:
	sta	($04),y	
	inx	 
	iny	 
	cpy	#$04	 
	bcc	WEA34	
	rts	 
WEA49:
	ldy	#$05	 
	lda	#$0E	 
WEA4D:
	sta	$D807,y	
	sta	$D813,y	
	dey	 
	bpl	WEA4D	
	ldy	#$03	 
WEA58:
	lda	$20	
	bne	WEA76	
	lda	WEAD0,y	
	sta	$0404,y	
	lda	WEAD4,y	
	sta	$0410,y	
	lda	WEABC,y	
	sta	$040C,y	
	lda	WEAB0,y	
	sta	$0419,y	
	bne	WEA8E	
WEA76:
	lda	WEAE0,y	
	sta	$0404,y	
	lda	WEAE4,y	
	sta	$0410,y	
	lda	WEACC,y	
	sta	$040C,y	
	lda	WEAC0,y	
	sta	$0419,y	
WEA8E:
	dey	 
	bpl	WEA58	
	lda	#$38	 
	sta	$79	
	lda	#$E0	 
	sta	$92	
	lda	#$06	 
	sta	$AB	
	rts	 
WEA9E:
	.byte $0D, $09, $08, $0D, $0D, $0A, $0B, $0C 
	.byte $0C
WEAA7:
	.byte $0E, $09, $08, $0E, $0E, $0E, $0E, $0E 
	.byte $0E	 
WEAB0:
	.byte $40, $45, $46, $44, $41, $45, $47, $48 
	.byte $42, $45, $45	 
	.byte $49
WEABC:
	.byte $43, $45, $45, $4A	
WEAC0:
	.byte $40, $45, $4B, $44, $41, $45, $47, $44 
	.byte $42, $45, $45	 
	.byte $4C
WEACC:
	.byte $43, $45, $45, $4D	
WEAD0:	
	.byte $57, $52, $52	 
	.byte $51
WEAD4:
	.byte $56, $52, $52, $50, $55, $54, $52, $4F 
	.byte $44, $53, $52	 
	.byte $4E
WEAE0:
	.byte $5A, $52, $52	 
	.byte $51
WEAE4:
	.byte $59, $52, $52, $50, $44, $54, $52, $4F 
	.byte $44, $58, $52	 
	.byte $4E
WEAF0:
	.byte $00, $04, $08	 
	.byte $0C
WEAF4:
	.byte $00, $00, $01, $01, $01, $02, $02, $02 
	.byte $03, $03, $04, $04, $05, $06, $07, $08 
	.byte $09, $0A, $0B, $0C, $0D, $0D, $0E, $0E 
	.byte $0F, $0F, $0F, $10, $10, $10, $11, $11 
	.byte $11, $11, $10, $10, $10, $0F, $0F, $0F 
	.byte $0E, $0E, $0D, $0D, $0C, $0B, $0A 
	.byte $09
	.byte $08, $07, $06, $05, $04	 
	.byte $04, $03, $03, $02	
	.byte $02
	.byte $02, $01, $01, $01, $00, $00
WEB34:
	lda	$27	
	bne	WEB44	
	lda	$28	
	bne	WEB44	
	lda	#$F4	 
	sta	$07FF	
	jmp	WEC0E	
WEB44:
	lda	$1A	
	cmp	#$08	 
	beq	WEB66	
	inc	$24	
	lda	$24	
	cmp	#$FA	 
	bcc	WEB66	
	lda	#$00	 
	sta	$24	
	ldy	$23	
	iny	 
	cpy	#$28	 
	bcc	WEB5F	
	ldy	#$20	 
WEB5F:
	sty	$23	
	lda	WECCB,y	
	sta	$1A	
WEB66:
	jsr	WE889	
	jsr	WE5F4	
	jsr	WEE10	
	jsr	WEDDF	
	lda	$D00F	
	lsr	 
	lsr	 
	lsr	 
	sec	 
	sbc	#$05	 
	tay	 
	lda	$0079,y	
	cmp	$D00E	
	bcs	WEBB5	
	clc	 
	adc	#$18	 
	cmp	$D00E	
	bcs	WEBAB	
	lda	$0092,y	
	clc	 
	adc	#$02	 
	cmp	$D00E	
	bcc	WEBB5	
	sec	 
	sbc	#$16	 
	cmp	$D00E	
	bcc	WEBAB	
	lda	#$05	 
	sta	$41	
	lda	#$00	 
	sta	$42	
	sta	$64	
	beq	WEBB8	
WEBAB:
	lda	#$01	 
	sta	$41	
	sta	$42	
	sta	$64	
	bne	WEBB8	
WEBB5:
	jmp	WECF3	
WEBB8:
	lda	$00AB,y	
	cmp	#$01	 
	bne	WEBCB	
	lda	$41	
	cmp	#$05	 
	bne	WEBCB	
	lda	#$02	 
	sta	$41	
	sta	$64	
WEBCB:
	lda	$00AB,y	
	cmp	#$06	 
	bne	WEBF9	
	lda	#$6C	 
	cmp	$D00E	
	bcs	WEBF9	
	lda	#$B3	 
	cmp	$D00E	
	bcc	WEBF9	
	lda	#$01	 
	sta	$41	
	sta	$42	
	sta	$64	
	lda	#$81	 
	cmp	$D00E	
	bcs	WEBF9	
	lda	#$9E	 
	cmp	$D00E	
	bcc	WEBF9	
	jmp	WECF3	
WEBF9:
	ldy	$41	
WEBFB:
	lda	$38	
	cmp	$D00E	
	bcs	WEC08	
	dec	$D00E	
	jmp	WEC0B	
WEC08:
	inc	$D00E	
WEC0B:
	dey	 
	bpl	WEBFB	
WEC0E:
	lda	$25	
	beq	WEC7A	
	cmp	#$01	 
	bne	WEC21	
	lda	$D015	
	and	#$8F	 
	sta	$D015	
	jmp	WEC7A	
WEC21:
	lda	$D015	
	ora	#$70	 
	sta	$D015	
	lda	#$70	 
	sta	$D017	
	sta	$D01D	
	lda	$D01C	
	and	#$8F	 
	sta	$D01C	
	lda	#$0C	 
	sta	$D02B	
	sta	$D02C	
	lda	#$0F	 
	sta	$D02D	
	ldy	#$FC	 
	sty	$07FC	
	iny	 
	sty	$07FD	
	iny	 
	sty	$07FE	
	lda	$D00F	
	sec	 
	sbc	#$2A	 
	sta	$D00D	
	sec	 
	sbc	#$20	 
	sta	$D00B	
	sta	$D009	
	lda	$D00E	
	clc	 
	adc	#$0A	 
	sta	$D00A	
	sec	 
	sbc	#$18	 
	sta	$D00C	
	sec	 
	sbc	#$18	 
	sta	$D008	
WEC7A:
	lda	$12	
	beq	WEC81	
	jsr	WF462	
WEC81:
	lda	$58	
	beq	WEC88	
	jmp	WECF3	
WEC88:
	jmp	WEB34	
WEC8B:
	.byte $79, $79, $79, $79, $79, $79, $79, $91 
	.byte $92, $79, $79, $95, $96, $79, $79, $7A 
	.byte $7E, $79, $79, $85, $8E, $79, $79, $95 
	.byte $96, $79, $79, $79, $79, $79, $79 
	.byte $79
WECAB:
	.byte $79, $79, $79, $79, $79, $79, $79, $93 
	.byte $94, $79, $79, $97, $79, $79, $79, $7F 
	.byte $80, $79, $79, $8F, $90, $79, $79, $97 
	.byte $79, $79, $79, $79, $79, $79
	.byte $79, $79	
WECCB:
	.byte $00, $01, $02, $03, $05, $04, $06, $03 
	.byte $05, $00, $02, $00, $01, $00, $04, $06 
	.byte $00, $02, $00, $03, $05, $00, $01, $00 
	.byte $04, $06, $00, $01, $00, $02, $04, $06 
	.byte $00, $02, $03, $05, $00, $01, $04 
	.byte $06
WECF3:
	.byte $A0, $02	
	sty	$42	
	dey	 
	sty	$59	
	sty	$77	
	dey	 
	sty	$64	
	sty	$65	
	sty	$D017	
	sty	$D01D	
	sty	$25	
	lda	$D015	
	and	#$EF	 
	ora	#$60	 
	sta	$D015	
	lda	$D01C	
	and	#$9F	 
	sta	$D01C	
	lda	#$0F	 
	sta	$D02D	
	lda	#$0C	 
	sta	$D02C	
	ldy	#$F8	 
	sty	$07FE	
	iny	 
	sty	$07FD	
	lda	#$07	 
	sta	$1A	
	ldy	#$23	 
WED34:
	sty	$24	
	lda	$12	
	beq	WED3D	
	jsr	WF462	
WED3D:
	jsr	WE889	
	jsr	WE5F4	
	jsr	WEE10	
	jsr	WEDDF	
	ldy	$24	
	dey	 
	bpl	WED34	
WED4E:
	ldx	#$03	 
	ldy	$D00E	
WED53:
	cpy	#$32	 
	bcc	WED74	
	dey	 
	dex	 
	bpl	WED53	
	sty	$D00E	
	jsr	WE889	
	jsr	WE5F4	
	jsr	WEE10	
	jsr	WEDDF	
	lda	$12	
	beq	WED4E	
	jsr	WF462	
	jmp	WED4E	
WED74:
	lda	#$03	 
	sta	$42	
WED78:
	lda	$27	
	bne	WED80	
	lda	$28	
	beq	WED96	
WED80:
	jsr	WE889	
	jsr	WE5F4	
	jsr	WEE10	
	jsr	WEDDF	
	lda	$12	
	beq	WED78	
	jsr	WF462	
	jmp	WED78	
WED96:
	lda	$D015	
	and	#$8F	 
	sta	$D015	
	lda	#$2F	 
	sta	$D418	
	lda	#$BE	 
	sta	$D416	
	lda	#$F0	 
	sta	$D417	
	lda	#$00	 
	sta	$43	
	sta	$44	
	sta	$42	
	sta	$59	
	sta	$58	
	sta	$6F	
	sta	$77	
	lda	#$3C	 
	sta	$52	
	lda	#$08	 
	sta	$1A	
	ldy	$23	
	lda	WECCB,y	
	beq	WEDD6	
	cmp	#$03	 
	beq	WEDD6	
	cmp	#$04	 
	beq	WEDD6	
	bne	WEDD8	
WEDD6:
	dec	$23	
WEDD8:
	lda	#$FA	 
	sta	$24	
	jmp	WEB34	
WEDDF:
	lda	$3A	
	sta	$3D	
	lda	$3B	
	sta	$3E	
WEDE7:
	lda	$3D	
	sec	 
	sbc	#$01	 
	sta	$3D	
	lda	$3E	
	sbc	#$00	 
	sta	$3E	
	bcs	WEDE7	
	ldy	$44	
	iny	 
	cpy	#$02	 
	bcc	WEE0D	
	ldy	#$00	 
	lda	$43	
	eor	#$01	 
	and	#$01	 
	sta	$43	
	clc	 
	adc	#$F4	 
	sta	$07FF	
WEE0D:
	sty	$44	
	rts	 
WEE10:
	sed	 
	lda	$0A	
	clc	 
	adc	#$01	 
	sta	$0A	
	lda	$0B	
	adc	#$00	 
	sta	$0B	
	lda	$0C	
	adc	#$00	 
	sta	$0C	
	cld	 
	lda	$0A	
	bne	WEE35	
	lda	$0B	
	and	#$1F	 
	bne	WEE35	
	inc	$53	
	lda	#$5F	 
	sta	$55	
WEE35:
	ldy	#$01	 
	lda	$0B	
	cmp	#$40	 
	beq	WEE4B	
	cmp	#$20	 
	beq	WEE4D	
	cmp	#$05	 
	beq	WEE4F	
	cmp	#$02	 
	beq	WEE51	
	bne	WEE53	
WEE4B:
	sty	$33	
WEE4D:
	sty	$32	
WEE4F:
	sty	$31	
WEE51:
	sty	$30	
WEE53:
	rts	 
	lda	$13	
	beq	WEE5C	
	sed	 
	jmp	WEEB7	
WEE5C:
	lda	#$40	 
	sta	$DC00	
	lda	$D419	
	sta	$39	
	cmp	#$BC	 
	bcc	WEE6E	
	lda	#$BC	 
	sta	$39	
WEE6E:
	lda	#$EC	 
	sec	 
	sbc	$39	
	sta	$38	
	lda	$42	
	cmp	#$02	 
	bcs	WEE82	
	lda	$DC01	
	and	#$04	 
	bne	WEEEC	
WEE82:
	sed	 
	lda	$42	
	beq	WEEB7	
	cmp	#$01	 
	beq	WEE9C	
	cmp	#$03	 
	beq	WEEEC	
	lda	#$50	 
	sec	 
	sbc	$27	
	lda	#$00	 
	sbc	$28	
	bcc	WEEA7	
	bcs	WEF02	
WEE9C:
	lda	#$50	 
	sec	 
	sbc	$27	
	lda	#$01	 
	sbc	$28	
	bcs	WEEB7	
WEEA7:
	lda	$27	
	sec	 
	sbc	#$02	 
	sta	$27	
	lda	$28	
	sbc	#$00	 
	sta	$28	
	jmp	WEED6	
WEEB7:
	ldy	$28	
	lda	WF2F3,y	
	sta	$68	
	lda	WF2F7,y	
	sta	$69	
	lda	$29	
	clc	 
	adc	$68	
	sta	$29	
	lda	$27	
	adc	$69	
	sta	$27	
	lda	$28	
	adc	#$00	 
	sta	$28	
WEED6:
	lda	#$20	 
	sec	 
	sbc	$27	
	lda	#$03	 
	sbc	$28	
	bcs	WEF02	
	lda	#$03	 
	sta	$28	
	lda	#$20	 
	sta	$27	
	jmp	WEF02	
WEEEC:
	lda	$28	
	bne	WEEF4	
	lda	$27	
	beq	WEF02	
WEEF4:
	sed	 
	lda	$27	
	sec	 
	sbc	#$02	 
	sta	$27	
	lda	$28	
	sbc	#$00	 
	sta	$28	
WEF02:
	lda	$28	
	cmp	#$04	 
	bcc	WEF0E	
	lda	#$00	 
	sta	$27	
	sta	$28	
WEF0E:
	cld	 
	jsr	WE753	
	inc	$6A	
	lda	$6A	
	and	#$07	 
	bne	WEF1D	
	jsr	WE808	
WEF1D:
	lda	$27	
	lsr	 
	lsr	 
	lsr	 
	lsr	 
	ldx	$28	
	clc	 
	adc	WF2E3,x	
	sta	$3C	
	tay	 
	lda	WF2A3,y	
	sta	$3A	
	lda	WF2C3,y	
	sta	$3B	
	lda	$11	
	beq	WEF42	
	lda	#$C3	 
	sec	 
	sbc	$3C	
	sta	$D00F	
WEF42:
	lda	$1A	
	cmp	#$07	 
	bne	WEF7F	
	ldy	$D00F	
	iny	 
	sty	$D00D	
	iny	 
	sty	$D00B	
	lda	$D00E	
	sta	$D00C	
	sta	$D00A	
	ldy	$45	
	iny	 
	cpy	#$0A	 
	bcc	WEF7D	
	ldy	#$00	 
	lda	$46	
	eor	#$01	 
	and	#$01	 
	sta	$46	
	clc	 
	adc	#$F8	 
	sta	$07FE	
	and	#$01	 
	eor	#$01	 
	clc	 
	adc	#$F8	 
	sta	$07FD	
WEF7D:
	sty	$45	
WEF7F:
	lda	$1A	
	cmp	#$04	 
	bne	WEFEA	
	lda	$24	
	cmp	#$A0	 
	bcc	WEFEA	
	cmp	#$F0	 
	bcs	WEFDC	
	cmp	#$A0	 
	bne	WEFBD	
	lda	#$40	 
	sta	$D017	
	sta	$D01D	
	lda	$D01C	
	ora	#$40	 
	sta	$D01C	
	lda	#$03	 
	sta	$D02D	
	lda	#$FB	 
	sta	$07FE	
	lda	#$3A	 
	sta	$D00D	
	lda	#$81	 
	sta	$D00C	
	lda	#$00	 
	sta	$47	
	sta	$48	
WEFBD:
	ldy	$47	
	iny	 
	cpy	#$08	 
	bcc	WEFE8	
	ldy	#$00	 
	lda	$48	
	eor	#$01	 
	sta	$48	
	beq	WEFDC	
	lda	$D015	
	ora	#$40	 
	sta	$D015	
	lda	#$01	 
	sta	$65	
	bne	WEFE8	
WEFDC:
	lda	$D015	
	and	#$BF	 
	sta	$D015	
	lda	#$00	 
	sta	$65	
WEFE8:
	sty	$47	
WEFEA:
	lda	$11	
	beq	WF00B	
	lda	$16	
	beq	WF007	
	ldy	$17	
	iny	 
	cpy	$18	
	bcc	WF00B	
	ldy	#$00	 
	sed	 
	lda	$16	
	sec	 
	sbc	#$01	 
	sta	$16	
	cld	 
	jmp	WF00B	
WF007:
	lda	#$01	 
	sta	$12	
WF00B:
	sty	$17	
	sed	 
	lda	$27	
	sec	 
	sbc	$2A	
	lda	$28	
	sbc	$2B	
	bcs	WF030	
	lda	#$01	 
	sta	$4D	
	lda	$2A	
	sec	 
	sbc	$27	
	sta	$2C	
	lda	$2B	
	sbc	$28	
	sta	$2D	
	jsr	WF227	
	jmp	WF044	
WF030:
	lda	#$00	 
	sta	$4D	
	lda	$27	
	sec	 
	sbc	$2A	
	sta	$2C	
	lda	$28	
	sbc	$2B	
	sta	$2D	
	jsr	WF227	
WF044:
	ldx	#$03	 
WF046:
	txa	 
	asl	 
	sta	$49	
	tay	 
	lda	$D001,y	
	cmp	#$1D	 
	bcc	WF066	
	cmp	#$32	 
	bcc	WF061	
	cpx	$5A	
	bne	WF05E	
	lda	#$04	 
	sta	$5A	
WF05E:
	jmp	WF0E2	
WF061:
	stx	$5A	
	jmp	WF0E2	
WF066:
	lda	#$00	 
	sta	$6B,x	
	cpx	$5A	
	bne	WF079	
	lda	$30,x	
	bne	WF0E2	
	lda	#$04	 
	sta	$5A	
WF076:
	jmp	WF10C	
WF079:
	lda	$5A	
	cmp	#$04	 
	bne	WF076	
	lda	$30,x	
	beq	WF076	
	jsr	WE734	
	lda	$08	
	and	#$1F	 
	bne	WF076	
	stx	$5A	
	jsr	WE734	
	lda	$08	
	and	#$07	 
	tay	 
	lda	WF29B,y	
	sta	$D027,x	
	lda	$AB	
	cmp	#$06	 
	beq	WF0CE	
	lda	$C3	
	cmp	#$06	 
	beq	WF0CE	
	jsr	WE734	
	lda	$08	
	and	#$3F	 
	clc	 
	adc	#$6E	 
	ldy	$49	
	sta	$D000,y	
	jsr	WE734	
	lda	$08	
	and	#$01	 
	sta	$5D,x	
	jsr	WE734	
	lda	$08	
	and	#$02	 
	tay	 
	dey	 
	sty	$4E,x	
	jmp	WF0E2	
WF0CE:
	jsr	WE734	
	lda	$08	
	and	#$03	 
	tay	 
	lda	WF2EF,y	
	ldy	$49	
	sta	$D000,y	
	lda	#$01	 
	sta	$5D,x	
WF0E2:
	ldy	$49	
	lda	$4D	
	bne	WF0FA	
	lda	$34,x	
	clc	 
	adc	$2C	
	sta	$34,x	
	lda	$D001,y	
	adc	$2D	
	sta	$D001,y	
	jmp	WF113	
WF0FA:
	lda	$34,x	
	sec	 
	sbc	$2C	
	sta	$34,x	
	lda	$D001,y	
	sbc	$2D	
	sta	$D001,y	
	jmp	WF113	
WF10C:
	ldy	$49	
	lda	#$19	 
	sta	$D001,y	
WF113:
	lda	$1A	
	cmp	#$04	 
	bne	WF136	
	lda	$24	
	cmp	#$C8	 
	bcc	WF136	
	lda	$D000,y	
	cmp	#$6B	 
	bcc	WF161	
	cmp	#$B3	 
	bcs	WF161	
	lda	$D000,y	
	clc	 
	adc	$4E,x	
	sta	$D000,y	
	jmp	WF161	
WF136:
	lda	$5D,x	
	bne	WF161	
	lda	$1A	
	cmp	#$06	 
	beq	WF161	
	lda	$C3	
	cmp	#$06	 
	beq	WF161	
	lda	$D000,y	
	clc	 
	adc	$4E,x	
	sta	$D000,y	
	cmp	#$67	 
	bcs	WF159	
	lda	#$01	 
	sta	$4E,x	
	bne	WF161	
WF159:
	cmp	#$B7	 
	bcc	WF161	
	lda	#$FF	 
	sta	$4E,x	
WF161:
	ldy	$49	
	lda	$D001,y	
	lsr	 
	lsr	 
	lsr	 
	sec	 
	sbc	#$05	 
	tay	 
	lda	$00AB,y	
	cmp	#$02	 
	bne	WF17B	
	lda	#$FA	 
	sta	$07F8,x	
	bne	WF180	
WF17B:
	lda	#$F6	 
	sta	$07F8,x	
WF180:
	ldy	$49	
	lda	$D001,y	
	cmp	#$32	 
	bcc	WF191	
	cmp	#$3C	 
	bcs	WF191	
	lda	#$01	 
	sta	$6B,x	
WF191:
	lda	$D001,y	
	cmp	$D00F	
	bcc	WF1B0	
	lda	$6B,x	
	beq	WF1B0	
	lda	#$00	 
	sta	$6B,x	
	inc	$6F	
	lda	$6F	
	cmp	#$0A	 
	bcc	WF1B0	
	ldy	#$00	 
	sty	$6F	
	iny	 
	sty	$70	
WF1B0:
	dex	 
	bmi	WF1B6	
	jmp	WF046	
WF1B6:
	ldy	$4B	
	iny	 
	cpy	#$04	 
	bcc	WF1D7	
	ldy	#$00	 
	lda	$4C	
	eor	#$01	 
	sta	$4C	
	clc	 
	adc	#$F6	 
	ldy	#$03	 
WF1CA:
	ldx	$07F8,y	
	cpx	#$FA	 
	beq	WF1D4	
	sta	$07F8,y	
WF1D4:
	dey	 
	bpl	WF1CA	
WF1D7:
	sty	$4B	
	lda	$59	
	beq	WF224	
	inc	$78	
	lda	$78	
	and	#$04	 
	bne	WF1F0	
	lda	$D015	
	and	#$EF	 
	sta	$D015	
	jmp	WF224	
WF1F0:
	lda	$D015	
	ora	#$10	 
	sta	$D015	
	lda	$D017	
	ora	#$10	 
	sta	$D017	
	lda	$D01C	
	ora	#$10	 
	sta	$D01C	
	lda	$D01D	
	ora	#$10	 
	sta	$D01D	
	lda	#$02	 
	sta	$D02B	
	lda	#$F3	 
	sta	$07FC	
	lda	#$81	 
	sta	$D008	
	lda	#$3A	 
	sta	$D009	
WF224:
	jmp	WF2FB	
WF227:
	cld	 
	lda	#$00	 
	sta	$2E	
	sta	$2F	
	ldy	$2D	
	beq	WF242	
WF232:
	lda	$2E	
	clc	 
	adc	#$64	 
	sta	$2E	
	lda	$2F	
	adc	#$00	 
	sta	$2F	
	dey	 
	bne	WF232	
WF242:
	lda	$2C	
	lsr	 
	lsr	 
	lsr	 
	lsr	 
	tay	 
	beq	WF25B	
WF24B:
	lda	$2E	
	clc	 
	adc	#$0A	 
	sta	$2E	
	lda	$2F	
	adc	#$00	 
	sta	$2F	
	dey	 
	bne	WF24B	
WF25B:
	lda	$2C	
	and	#$0F	 
	tay	 
	beq	WF272	
WF262:
	lda	$2E	
	clc	 
	adc	#$01	 
	sta	$2E	
	lda	$2F	
	adc	#$00	 
	sta	$2F	
	dey	 
	bne	WF262	
WF272:
	lda	$2F	
	sta	$2C	
	lda	$2E	
	sta	$2D	
	ldy	#$05	 
WF27C:
	lsr	$2D	
	ror	$2C	
	dey	 
	bpl	WF27C	
	lda	$2D	
	lsr	 
	sta	$5C	
	lda	$2C	
	ror	 
	sta	$5B	
	lda	$2C	
	clc	 
	adc	$5B	
	sta	$2C	
	lda	$2D	
	adc	$5C	
	sta	$2D	
	rts	 
WF29B:	
	.byte $02, $03, $05, $07, $08, $09, $0A 
	.byte $0D
WF2A3:
	.byte $00, $00, $00, $00, $00, $00, $80, $00 
	.byte $80, $00, $80, $00, $80, $30, $00, $A0 
	.byte $60, $20, $00, $D0, $98, $70, $35, $10 
	.byte $00	 
	.byte $C0, $40, $18, $08, $04, $02, $00 
WF2C3:
	.byte $10, $0C, $0A, $09, $08, $07, $06, $06 
	.byte $05, $05, $04, $04, $03	 
	.byte $03
	.byte $03, $02, $02, $02, $02, $01, $01, $01 
	.byte $01, $01, $01, $00, $00, $00, $00, $00 
	.byte $00, $00	
WF2E3:
	.byte $00, $0A, $14, $1E, $FE, $FD, $FB, $F7 
	.byte $01, $02, $04, $08	
WF2EF:	
	.byte $51, $6B, $B3, $CD	
WF2F3:
	.byte $00, $00, $40, $08	
WF2F7:	
	.byte $03, $01, $00, $00	
WF2FB:
	.byte $A0, $03
WF2FD:
	tya
	asl	 
	tax	 
	lda	$D000,x	
	sec	 
	sbc	#$05	 
	cmp	$D00E	
	bcs	WF330	
	lda	$D001,x	
	sec	 
	sbc	#$04	 
	cmp	$D00F	
	bcs	WF330	
	lda	$D000,x	
	clc	 
	adc	#$0F	 
	cmp	$D00E	
	bcc	WF330	
	lda	$D001,x	
	clc	 
	adc	#$12	 
	cmp	$D00F	
	bcc	WF330	
	lda	#$01	 
	sta	$58	
WF330:
	lda	$D00E	
	sec	 
	sbc	#$03	 
	cmp	$D000,x	
	bcs	WF360	
	lda	$D00F	
	sec	 
	sbc	#$02	 
	cmp	$D001,x	
	bcs	WF360	
	lda	$D00E	
	clc	 
	adc	#$11	 
	cmp	$D000,x	
	bcc	WF360	
	lda	$D00F	
	clc	 
	adc	#$14	 
	cmp	$D001,x	
	bcc	WF360	
	lda	#$01	 
	sta	$58	
WF360:
	dey	 
	bpl	WF2FD	
	lda	$13	
	beq	WF36A	
	jmp	WF3F1	
WF36A:
	ldy	#$08	 
WF36C:
	lda	WF428,y	
	sta	$06	
	lda	WF431,y	
	sta	$07	
	sty	$49	
	ldx	#$03	 
WF37A:
	cpy	$6F	
	bcc	WF382	
	lda	#$20	 
	bne	WF385	
WF382:
	lda	WF43E,x	
WF385:
	ldy	WF43A,x	
	sta	($06),y	
	ldy	$49	
	dex	 
	bpl	WF37A	
	dey	 
	bpl	WF36C	
	lda	$70	
	beq	WF3CA	
	lda	#$28	 
	sta	$71	
	lda	#$00	 
	sta	$70	
	sed	 
	lda	$0B	
	clc	 
	adc	#$01	 
	sta	$0B	
	lda	$0C	
	adc	#$00	 
	sta	$0C	
	cld	 
	lda	$0B	
	and	#$1F	 
	bne	WF3B9	
	inc	$53	
	lda	#$5F	 
	sta	$55	
WF3B9:
	ldy	#$07	 
WF3BB:
	lda	WF442,y	
	sta	$07B8,y	
	lda	WF44A,y	
	sta	$07E0,y	
	dey	 
	bpl	WF3BB	
WF3CA:
	lda	$71	
	beq	WF3F1	
	dec	$71	
	lda	$71	
	and	#$04	 
	beq	WF3DC	
	lda	#$01	 
	sta	$66	
	bne	WF3F1	
WF3DC:
	lda	#$00	 
	sta	$66	
	lda	$71	
	bne	WF3F1	
	ldy	#$07	 
	lda	#$20	 
WF3E8:
	sta	$07B8,y	
	sta	$07E0,y	
	dey	 
	bpl	WF3E8	
WF3F1:
	lda	$55	
	beq	WF425	
	dec	$55	
	lda	$55	
	and	#$10	 
	beq	WF414	
	lda	#$01	 
	sta	$67	
	ldy	#$07	 
WF403:
	lda	WF452,y	
	sta	$0650,y	
	lda	WF45A,y	
	sta	$0678,y	
	dey	 
	bpl	WF403	
	bmi	WF425	
WF414:
	lda	#$00	 
	sta	$67	
	ldy	#$07	 
	lda	#$20	 
WF41C:
	sta	$0650,y	
	sta	$0678,y	
	dey	 
	bpl	WF41C	
WF425:
	jmp	WE008	
WF428:	
	.byte $A1, $A3, $A5, $F1, $F3, $F5, $41, $43 
	.byte $45
WF431:
	.byte $06, $06, $06, $06, $06, $06, $07, $07 
	.byte $07	 
WF43A:
	.byte $00, $01, $28	 
	.byte $29
WF43E:
	.byte $75, $76, $77, $78	
WF442:
	; text for BONUS (original game had this as BOUNS)
	.byte $20, $02, $0F, $0E, $15, $13, $20 
	.byte $20
WF44A:
	.byte $22, $21, $21, $21, $20, $10, $14 
	.byte $13
WF452:
	.byte $05, $18, $14, $05, $0E, $04, $05 
	.byte $04
WF45A:
	.byte $20, $20, $14, $09, $0D, $05, $20
	.byte $20
WF462:
	sty	$56	
	stx	$57	
	lda	$53	
	beq	WF48B	
	dec	$53	
	ldy	$54	
	cpy	#$05	 
	bcc	WF474	
	ldy	#$04	 
WF474:
	lda	WF564,y	
	sta	$18	
	iny	 
	sty	$54	
	lda	#$60	 
	sta	$16	
	lda	#$00	 
	sta	$12	
	sta	$17	
	ldy	$57	
	ldx	$56	
	rts	 
WF48B:
	inc	$13	
	lda	#$07	 
	sta	$1A	
	lda	$D015	
	and	#$8F	 
	sta	$D015	
	lda	#$00	 
	sta	$58	
	sta	$59	
	sta	$64	
	sta	$65	
	sta	$66	
	sta	$30	
	sta	$31	
	sta	$32	
	sta	$33	
	lda	#$F0	 
	sta	$D417	
	ldy	#$4B	 
WF4B4:
	sty	$24	
	jsr	WE889	
	jsr	WE5F4	
	jsr	WEDDF	
	ldy	$24	
	dey	 
	bne	WF4B4	
	ldy	#$1F	 
WF4C6:
	lda	WF589,y	
	sta	$0400,y	
	lda	#$0A	 
	sta	$D800,y	
	dey	 
	bpl	WF4C6	
	jsr	WE5F4	
	jsr	WEDDF	
	ldy	#$1F	 
WF4DC:
	lda	WF569,y	
	sta	$0400,y	
	dey	 
	bpl	WF4DC	
	jsr	WE5F4	
	jsr	WEDDF	
	ldy	#$0A	 
WF4ED:
	sty	$24	
	jsr	WE889	
	jsr	WE5F4	
	jsr	WEDDF	
	ldy	$24	
	dey	 
	bpl	WF4ED	
	sei	 
	lda	#$08	 
	sta	$02	
	lda	#$E0	 
	sta	$03	
	cli	 
	inc	$13	
	lda	#$A3	 
WF50B:
	cmp	#$08	 
	bcc	WF51F	
	sec	 
	sbc	#$04	 
	sta	$D00F	
	ldy	#$01	 
	jsr	WE45B	
	lda	$D00F	
	bne	WF50B	
WF51F:
	ldy	#$07	 
	lda	#$20	 
WF523:
	sta	$07B8,y	
	sta	$07E0,y	
	dey	 
	bpl	WF523	
	ldy	#$05	 
	jsr	WE44D	
	ldx	#$1A	 
WF533:
	stx	$23	
	jsr	WE889	
	jsr	WE5F4	
	lda	$1F	
	cmp	#$64	 
	beq	WF54A	
	bcc	WF548	
	dec	$1F	
	jmp	WF54A	
WF548:
	inc	$1F	
WF54A:
	ldy	#$01	 
	jsr	WE45B	
	ldx	$23	
	dex	 
	bpl	WF533	
	lda	#$00	 
	sta	$D015	
	ldx	#$0F	 
WF55B:
	sta	$D000,x	
	dex	 
	bpl	WF55B	
	jmp	WE0BD	
WF564:
	; DIFFICULTY LEVEL INCREASES EVERY TIME YOU USE AN EXTENDED TIME
	; To make this easier you can change to eg
	;byte $40, $40, $40, $40, $40

	.byte $40, $3A, $34, $2F, $22
WF569:
	.byte $79, $79, $79, $79, $79, $79, $85, $8E 
	.byte $7A, $7E, $7A, $7B, $85, $86, $79, $79 
	.byte $79, $79, $7A, $7E, $8A, $8B, $85, $86 
	.byte $85, $8E, $79, $79, $79, $79, $79, $79 
WF589:
	.byte $79, $79, $79, $79, $79, $79, $8F, $90 
	.byte $7F, $80, $7C, $7D, $87, $88, $79, $79 
	.byte $79, $79, $7C, $89, $8C, $8D, $87, $88 
	.byte $8F, $90, $79, $79, $79, $79, $79, $79
WF5A9:
	lda	$59	
	beq	WF5ED	
	cmp	#$01	 
	bne	WF5D9	
	lda	#$00	 
	sta	$D400	
	sta	$D415	
	lda	#$09	 
	sta	$D401	
	lda	#$1F	 
	sta	$D418	
	lda	#$F1	 
	sta	$D417	
	lda	#$C8	 
	sta	$D416	
	sta	$76	
	lda	#$81	 
	sta	$D404	
	inc	$59	
	jmp	WF667	
WF5D9:
	cmp	#$02	 
	bne	WF5EA	
	dec	$76	
	lda	$76	
	sta	$D416	
	cmp	#$96	 
	bcs	WF5EA	
	inc	$59	
WF5EA:
	jmp	WF667	
WF5ED:
	lda	$13	
	cmp	#$02	 
	bcc	WF632	
	cmp	#$03	 
	beq	WF616	
	cmp	#$04	 
	beq	WF667	
	lda	#$40	 
	sta	$D404	
	lda	#$00	 
	sta	$D40B	
	sta	$D412	
	sta	$61	
	sta	$D400	
	lda	#$0D	 
	sta	$62	
	sta	$D401	
	inc	$13	
WF616:
	lda	$61	
	sec	 
	sbc	#$1E	 
	sta	$61	
	sta	$D400	
	lda	$62	
	sbc	#$00	 
	sta	$62	
	sta	$D401	
	cmp	#$0A	 
	bne	WF667	
	inc	$13	
	jmp	WF667	
WF632:
	lda	$27	
	bne	WF641	
	lda	$28	
	bne	WF641	
	lda	#$00	 
	sta	$D404	
	beq	WF667	
WF641:
	lda	$27	
	sta	$2C	
	lda	$28	
	sta	$2D	
	jsr	WF227	
	ldy	#$02	 
WF64E:
	asl	$2E	
	rol	$2F	
	dey	 
	bpl	WF64E	
	lda	$2E	
	sta	$D400	
	lda	$2F	
	clc	 
	adc	#$03	 
	sta	$D401	
	lda	#$41	 
	sta	$D404	
WF667:
	lda	$67	
	bne	WF6CD	
	lda	$65	
	beq	WF672	
	jmp	WF6F3	
WF672:
	lda	$66	
	bne	WF6E0	
	lda	$64	
	bne	WF682	
	sta	$D412	
	bne	WF682	
	jmp	WF704	
WF682:
	cmp	#$01	 
	bne	WF6B8	
	ldy	$63	
	iny	 
	cpy	#$03	 
	bcc	WF68F	
	ldy	#$00	 
WF68F:
	sty	$63	
	cpy	#$01	 
	bcs	WF6B1	
	lda	$27	
	bne	WF6A0	
	lda	$28	
	bne	WF6A0	
	jmp	WF704	
WF6A0:
	lda	#$04	 
	sta	$D40F	
	lda	#$81	 
	sta	$D412	
	lda	#$F0	 
	sta	$D417	
	bne	WF704	
WF6B1:
	lda	$00	
	sta	$D412	
	beq	WF704	
WF6B8:
	cmp	#$02	 
	bne	WF704	
	lda	#$1E	 
	sta	$D40F	
	lda	#$81	 
	sta	$D412	
	lda	#$F4	 
	sta	$D417	
	bne	WF704	
WF6CD:
	lda	#$50	 
	sta	$D40F	
	lda	#$21	 
	sta	$D412	
	lda	#$F0	 
	ora	$77	
	sta	$D417	
	bne	WF704	
WF6E0:
	lda	#$82	 
	sta	$D40F	
	lda	#$21	 
	sta	$D412	
	lda	#$F0	 
	ora	$77	
	sta	$D417	
	bne	WF704	
WF6F3:
	lda	#$6E	 
	sta	$D40F	
	lda	#$21	 
	sta	$D412	
	lda	#$F0	 
	ora	$77	
	sta	$D417	
WF704:
	lda	$13	
	cmp	#$02	 
	bcc	WF70D	
	jmp	WF793	
WF70D:
	lda	$3C	
	cmp	#$10	 
	bcs	WF720	
	lda	$3C	
	sec	 
	sbc	#$10	 
	sta	$74	
	lda	#$01	 
	sta	$75	
	bne	WF72B	
WF720:
	lda	#$10	 
	sec	 
	sbc	$3C	
	sta	$74	
	lda	#$00	 
	sta	$75	
WF72B:
	lda	#$FF	 
	sta	$72	
	ldx	#$03	 
WF731:
	txa	 
	asl	 
	tay	 
	lda	$D001,y	
	cmp	$D00F	
	bcc	WF74F	
	lda	$D001,y	
	sec	 
	sbc	$D00F	
	cmp	$72	
	bcs	WF760	
	sta	$72	
	lda	#$00	 
	sta	$73	
	beq	WF760	
WF74F:
	lda	$D00F	
	sec	 
	sbc	$D001,y	
	cmp	$72	
	bcs	WF760	
	sta	$72	
	lda	#$01	 
	sta	$73	
WF760:
	dex	 
	bpl	WF731	
	lda	$72	
	cmp	#$20	 
	bcc	WF770	
	lda	#$40	 
	sta	$D40B	
	bne	WF793	
WF770:
	lda	#$41	 
	sta	$D40B	
	lda	$73	
	eor	$75	
	beq	WF786	
	lda	$72	
	clc	 
	adc	#$20	 
	sta	$D407	
	jmp	WF78E	
WF786:
	lda	#$20	 
	sec	 
	sbc	$72	
	sta	$D407	
WF78E:
	lda	#$0A	 
	sta	$D408	
WF793:
	rts	 
	.byte $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $00, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $7F, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $38, $6C, $C6, $C6, $FE, $C6
	.byte $C6, $00, $FC, $66, $66, $7C, $66, $66
	.byte $FC, $00, $3C, $66, $C0, $C0, $C0, $66
	.byte $3C, $00, $F8, $6C, $66, $66, $66, $6C
	.byte $F0, $00, $FE, $60, $60, $7C, $60, $60
	.byte $FE, $00, $FE, $60, $60, $7C, $60, $60
	.byte $F0, $00, $3C, $66, $C0, $DE, $C6, $66
	.byte $3C, $00, $C6, $C6, $C6, $FE, $C6, $C6
	.byte $C6, $00, $3C, $18, $18, $18, $18, $18
	.byte $3C, $00, $1E, $0C, $0C, $0C, $0C, $CC
	.byte $78, $00, $C6, $CC, $D8, $F0, $D8, $CC
	.byte $C6, $00, $C0, $C0, $C0, $C0, $C0, $C0
	.byte $FE, $00, $C6, $EE, $FE, $D6, $C6, $C6
	.byte $C6, $00, $C6, $E6, $F6, $DE, $CE, $C6
	.byte $C6, $00, $38, $6C, $C6, $C6, $C6, $6C
	.byte $38, $00, $FC, $C6, $C6, $FC, $C0, $C0
	.byte $C0, $00, $38, $6C, $C6, $D6, $CE, $6C
	.byte $3A, $00, $FC, $C6, $C6, $FC, $D8, $CC
	.byte $C6, $00, $7C, $C6, $C0, $7C, $06, $C6
	.byte $7C, $00, $7E, $18, $18, $18, $18, $18
	.byte $18, $00, $C6, $C6, $C6, $C6, $C6, $C6
	.byte $7C, $00, $C6, $C6, $C6, $6C, $6C, $38
	.byte $38, $00, $C6, $C6, $C6, $D6, $FE, $EE
	.byte $C6, $00, $C6, $C6, $6C, $38, $6C, $C6
	.byte $C6, $00, $66, $66, $66, $3C, $18, $18
	.byte $18, $00, $FE, $06, $0C, $38, $60, $C0
	.byte $FE, $00, $0C, $18, $30, $30, $30, $18
	.byte $0C, $00, $30, $18, $0C, $0C, $0C, $18
	.byte $30, $00, $18, $18, $18, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $18
	.byte $18, $00, $00, $00, $00, $7E, $7E, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $7C, $C6, $C6, $C6, $C6, $C6
	.byte $7C, $00, $18, $38, $58, $18, $18, $18
	.byte $7E, $00, $7C, $C6, $06, $1C, $70, $C0
	.byte $FE, $00, $7C, $C6, $06, $3C, $06, $C6
	.byte $7C, $00, $1C, $3C, $6C, $CC, $FE, $0C
	.byte $0C, $00, $FE, $C0, $F8, $0C, $06, $CC
	.byte $78, $00, $3C, $60, $C0, $FC, $C6, $C6
	.byte $7C, $00, $FE, $C6, $0C, $18, $30, $30
	.byte $30, $00, $7C, $C6, $C6, $7C, $C6, $C6
	.byte $7C, $00, $7C, $C6, $C6, $7E, $06, $0C
	.byte $78, $00, $55, $55, $57, $5F, $5F, $7F
	.byte $7F, $7F, $55, $55, $D5, $F5, $F5, $FD
	.byte $FD, $FD, $7F, $7F, $7F, $5F, $5F, $57
	.byte $55, $55, $FD, $FD, $FD, $F5, $F5, $D5
	.byte $55, $55, $00, $42, $24, $18, $18, $24
	.byte $42, $00, $0A, $AA, $A0, $25, $55, $68
	.byte $25, $55, $68, $95, $55, $5A, $AA, $AA
	.byte $AA, $AA, $AA, $AA, $9A, $AA, $A6, $9A
	.byte $96, $A6, $9A, $96, $A6, $9A, $AA, $A6
	.byte $AA, $AA, $AA, $95, $55, $56, $95, $55
	.byte $56, $95, $55, $56, $95, $55, $56, $95
	.byte $55, $56, $95, $7D, $56, $95, $7D, $56
	.byte $95, $7D, $56, $95, $7D, $56, $95, $7D
	.byte $56, $AA, $95, $7D, $56, $95, $7D, $56
	.byte $95, $7D, $56, $95, $7D, $56, $95, $7D
	.byte $56, $95, $7D, $56, $95, $7D, $56, $95
	.byte $7D, $56, $95, $55, $56, $95, $55, $56
	.byte $95, $55, $56, $95, $55, $56, $95, $55
	.byte $56, $2A, $00, $A8, $2A, $00, $A8, $2A
	.byte $00, $A8, $2A, $00, $A8, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $AA, $62, $48, $62, $48, $62, $48
	.byte $62, $48, $D2, $D8, $D2, $D8, $D2, $D8
	.byte $D2, $D8, $F6, $F4, $F6, $F4, $F6, $F4
	.byte $F6, $F4, $FD, $FD, $FD, $FD, $FD, $FD
	.byte $FD, $FD, $FF, $FF, $FF, $FF, $FF, $FF
	.byte $FF, $FF, $22, $88, $22, $88, $22, $88
	.byte $22, $88, $26, $86, $26, $86, $26, $86
	.byte $26, $86, $21, $89, $21, $89, $21, $89
	.byte $21, $89, $BF, $BF, $BF, $BF, $BF, $BF
	.byte $BF, $BF, $6F, $6F, $6F, $6F, $6F, $6F
	.byte $6F, $6F, $1B, $9B, $1B, $9B, $1B, $9B
	.byte $1B, $9B, $27, $87, $27, $87, $27, $87
	.byte $27, $87, $7F, $7F, $7F, $7F, $7F, $7F
	.byte $7F, $7F, $1F, $9F, $1F, $9F, $1F, $9F
	.byte $1F, $9F, $89, $21, $89, $21, $89, $21
	.byte $89, $21, $87, $27, $87, $27, $87, $27
	.byte $87, $27, $9F, $1F, $9F, $1F, $9F, $1F
	.byte $9F, $1F, $7F, $7F, $7F, $7F, $7F, $7F
	.byte $7F, $7F, $88, $22, $88, $22, $88, $22
	.byte $88, $22, $98, $92, $98, $92, $98, $92
	.byte $98, $92, $48, $62, $48, $62, $48, $62
	.byte $48, $62, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $F9, $F9, $F9, $F9, $F9, $F9
	.byte $F9, $F9, $E4, $E6, $E4, $E6, $E4, $E6
	.byte $E4, $E6, $D8, $D2, $D8, $D2, $D8, $D2
	.byte $D8, $D2, $FD, $FD, $FD, $FD, $FD, $FD
	.byte $FD, $FD, $F4, $F6, $F4, $F6, $F4, $F6
	.byte $F4, $F6, $FF, $80, $8F, $97, $98, $98
	.byte $98, $90, $FF, $01, $F1, $E9, $19, $19
	.byte $19, $09, $90, $98, $98, $98, $97, $8F
	.byte $80, $FF, $09, $19, $19, $19, $E9, $F1
	.byte $01, $FF, $FF, $01, $01, $09, $19, $19
	.byte $19, $09, $09, $19, $19, $19, $09, $01
	.byte $01, $FF, $FF, $80, $8F, $87, $80, $80
	.byte $80, $87, $FF, $01, $F1, $E9, $19, $19
	.byte $19, $E9, $97, $98, $98, $98, $97, $8F
	.byte $80, $FF, $E1, $01, $01, $01, $E1, $F1
	.byte $01, $FF, $87, $80, $80, $80, $87, $8F
	.byte $80, $FF, $E9, $19, $19, $19, $E9, $F1
	.byte $01, $FF, $FF, $80, $80, $90, $98, $98
	.byte $98, $97, $FF, $01, $01, $09, $19, $19
	.byte $19, $E9, $87, $80, $80, $80, $80, $80
	.byte $80, $FF, $E9, $19, $19, $19, $09, $01
	.byte $01, $FF, $FF, $80, $8F, $97, $98, $98
	.byte $98, $97, $FF, $01, $F1, $E1, $01, $01
	.byte $01, $E1, $FF, $80, $80, $80, $80, $80
	.byte $80, $80, $FF, $01, $01, $01, $01, $01
	.byte $01, $01, $80, $80, $80, $80, $80, $80
	.byte $80, $FF, $01, $01, $01, $01, $01, $01
	.byte $01, $FF, $00, $00, $25, $29, $31, $29
	.byte $25, $00, $00, $00, $10, $B0, $50, $11
	.byte $12, $04, $00, $00, $00, $00, $00, $01
	.byte $02, $04, $08, $10, $20, $48, $88, $0E
	.byte $09, $09, $00, $00, $01, $3B, $3F, $3B
	.byte $07, $0E, $00, $00, $80, $DC, $FC, $DC
	.byte $E0, $70, $1C, $1E, $07, $3B, $3F, $3F
	.byte $3A, $00, $38, $78, $E0, $DC, $FC, $FC
	.byte $5C, $00, $AA, $AA, $AA, $AA, $AA, $AA
	.byte $AA, $AA, $AA, $AB, $AB, $AE, $AE, $BA
	.byte $BA, $BA, $AA, $FA, $FA, $AE, $AE, $AA
	.byte $AA, $AA, $BA, $BA, $BA, $AE, $AE, $AB
	.byte $AB, $AA, $AA, $AA, $AA, $AE, $AE, $FA
	.byte $FA, $AA, $AA, $EA, $EA, $BA, $BA, $AE
	.byte $AE, $AE, $BA, $BF, $BF, $BA, $BA, $BA
	.byte $BA, $AA, $AE, $FE, $FE, $AE, $AE, $AE
	.byte $AE, $AA, $AA, $BA, $BA, $BE, $BE, $BB
	.byte $BB, $BB, $AA, $AE, $AE, $BE, $BE, $EE
	.byte $EE, $EE, $BB, $BA, $BA, $BA, $BA, $BA
	.byte $BA, $AA, $EE, $AE, $AE, $AE, $AE, $AE
	.byte $AE, $AA, $AA, $BF, $BF, $BA, $BA, $BA
	.byte $BA, $BF, $AA, $FE, $FE, $AA, $AA, $AA
	.byte $AA, $FA, $BF, $BA, $BA, $BA, $BA, $BF
	.byte $BF, $AA, $FA, $AA, $AA, $AA, $AA, $FE
	.byte $FE, $AA, $AE, $AE, $AE, $BA, $BA, $EA
	.byte $EA, $AA, $AA, $BA, $BA, $BA, $BA, $BA
	.byte $BA, $AE, $AA, $AE, $AE, $AE, $AE, $AE
	.byte $AE, $BA, $AE, $AE, $AE, $AB, $AB, $AB
	.byte $AB, $AA, $BA, $BA, $BA, $EA, $EA, $EA
	.byte $EA, $AA, $AA, $FA, $FA, $AE, $AE, $AE
	.byte $AE, $FA, $BF, $BA, $BA, $BA, $BA, $BA
	.byte $BA, $AA, $FA, $EA, $EA, $BA, $BA, $AE
	.byte $AE, $AA, $AA, $AF, $AF, $BA, $BA, $BA
	.byte $BA, $AF, $AA, $FA, $FA, $AE, $AE, $AA
	.byte $AA, $FA, $AF, $AA, $AA, $BA, $BA, $AF
	.byte $AF, $AA, $FA, $AE, $AE, $AE, $AE, $FA
	.byte $FA, $AA, $AA, $BF, $BF, $AB, $AB, $AB
	.byte $AB, $AB, $AA, $FA, $FA, $AA, $AA, $AA
	.byte $AA, $AA, $AB, $AB, $AB, $AB, $AB, $AB
	.byte $AB, $AA, $55, $55, $54, $55, $55, $54
	.byte $69, $66, $A4, $66, $65, $94, $66, $65
	.byte $94, $66, $65, $94, $69, $65, $94, $65
	.byte $65, $94, $65, $65, $94, $65, $65, $94
	.byte $55, $55, $54, $55, $55, $54, $55, $D5
	.byte $54, $57, $D5, $54, $5F, $FF, $F4, $7F
	.byte $FF, $F4, $5F, $FF, $F4, $57, $D5, $54
	.byte $55, $D5, $54, $55, $55, $54, $55, $55
	.byte $54, $AA, $0A, $AA, $00, $20, $A0, $80
	.byte $3C, $A3, $C0, $3C, $A3, $C0, $3D, $A7
	.byte $C0, $3C, $A3, $C0, $3C, $A3, $C0, $02
	.byte $A8, $00, $02, $58, $00, $0A, $5A, $00
	.byte $09, $56, $00, $29, $56, $80, $2A, $5A
	.byte $80, $2A, $AA, $80, $02, $A8, $00, $F2
	.byte $A8, $F0, $F2, $A8, $F0, $F6, $A9, $F0
	.byte $F6, $A9, $F0, $F2, $A8, $F0, $F0, $A0
	.byte $F0, $AA, $0A, $AA, $00, $20, $A0, $80
	.byte $3C, $A3, $C0, $14, $A1, $40, $3D, $A7
	.byte $C0, $3C, $A3, $C0, $3C, $A3, $C0, $02
	.byte $A8, $00, $02, $58, $00, $0A, $5A, $00
	.byte $09, $56, $00, $29, $56, $80, $2A, $5A
	.byte $80, $2A, $AA, $80, $02, $A8, $00, $F2
	.byte $A8, $F0, $52, $A8, $50, $F6, $A9, $F0
	.byte $76, $A9, $D0, $F2, $A8, $F0, $F0, $A0
	.byte $F0, $AA, $00, $A0, $00, $02, $A8, $00
	.byte $F2, $A8, $F0, $F2, $A8, $F0, $F6, $A9
	.byte $F0, $F2, $A8, $F0, $F2, $A8, $F0, $0A
	.byte $AA, $00, $0A, $AA, $00, $0A, $AA, $00
	.byte $2A, $5A, $80, $2A, $5A, $80, $29, $56
	.byte $80, $29, $56, $80, $0A, $5A, $00, $FA
	.byte $AA, $F0, $FA, $AA, $F0, $FA, $AA, $F0
	.byte $FA, $AA, $F0, $F2, $A8, $F0, $F2, $08
	.byte $F0, $AA, $00, $A0, $00, $02, $A8, $00
	.byte $F2, $A8, $F0, $52, $A8, $50, $F6, $A9
	.byte $F0, $F2, $A8, $F0, $F2, $A8, $F0, $0A
	.byte $AA, $00, $0A, $AA, $00, $0A, $AA, $00
	.byte $2A, $5A, $80, $2A, $5A, $80, $29, $56
	.byte $80, $29, $56, $80, $0A, $5A, $00, $FA
	.byte $AA, $F0, $5A, $AA, $50, $FA, $AA, $F0
	.byte $FA, $AA, $F0, $72, $A8, $D0, $F2, $08
	.byte $F0, $AA, $03, $80, $00, $0E, $C6, $00
	.byte $1F, $6F, $00, $1B, $FB, $80, $31, $B9
	.byte $80, $39, $B9, $C0, $39, $9B, $E0, $79
	.byte $CD, $E0, $73, $EF, $B0, $F3, $EF, $10
	.byte $B3, $DF, $10, $B7, $FB, $80, $BB, $B9
	.byte $E0, $3B, $B9, $E0, $7F, $90, $E0, $39
	.byte $C8, $F0, $30, $E9, $F0, $30, $63, $30
	.byte $30, $22, $10, $10, $42, $10, $10, $40
	.byte $20, $AA, $00, $0E, $00, $06, $1F, $80
	.byte $0F, $3F, $C0, $19, $38, $C0, $18, $20
	.byte $60, $18, $20, $60, $30, $43, $20, $30
	.byte $07, $30, $23, $8F, $10, $27, $86, $10
	.byte $07, $C6, $40, $0E, $E6, $60, $1C, $E6
	.byte $E0, $3C, $EE, $E0, $38, $4C, $E0, $38
	.byte $88, $E0, $7C, $84, $60, $66, $10, $60
	.byte $C2, $30, $C0, $82, $30, $80, $80, $21
	.byte $00, $AA, $00, $F0, $00, $03, $FC, $00
	.byte $F3, $FC, $F0, $F3, $FC, $F0, $FF, $FF
	.byte $F0, $F3, $FC, $F0, $F3, $FC, $F0, $0F
	.byte $FF, $00, $0F, $FF, $00, $0F, $FF, $00
	.byte $3F, $FF, $C0, $3F, $FF, $C0, $3F, $FF
	.byte $C0, $3F, $FF, $C0, $0F, $FF, $00, $FF
	.byte $FF, $F0, $FF, $FF, $F0, $FF, $FF, $F0
	.byte $FF, $FF, $F0, $F1, $F4, $F0, $F1, $04
	.byte $F0, $AA, $AA, $AA, $AA, $90, $EB, $06
	.byte $B0, $69, $0E, $90, $EB, $06, $B0, $69
	.byte $0E, $90, $EB, $06, $B0, $69, $0E, $90
	.byte $EB, $06, $B0, $69, $0E, $90, $EB, $06
	.byte $B0, $00, $0E, $90, $00, $06, $B0, $00
	.byte $0E, $90, $00, $06, $B0, $00, $0E, $90
	.byte $00, $06, $B0, $00, $0E, $90, $00, $06
	.byte $B0, $00, $0E, $90, $00, $06, $AA, $AA
	.byte $AA, $AA, $00, $12, $80, $00, $44, $10
	.byte $00, $1A, $C4, $01, $6B, $B6, $01, $DE
	.byte $ED, $02, $FF, $FF, $03, $BF, $FF, $01
	.byte $FF, $FF, $01, $FF, $FF, $00, $FF, $FF
	.byte $00, $FF, $FF, $00, $7F, $FF, $00, $7F
	.byte $FF, $00, $3F, $FF, $00, $3F, $FF, $00
	.byte $1F, $FF, $00, $1B, $EF, $00, $0E, $FE
	.byte $00, $0B, $B5, $00, $01, $59, $00, $04
	.byte $A2, $AA, $04, $90, $00, $10, $22, $00
	.byte $05, $54, $00, $6B, $EA, $80, $B6, $F7
	.byte $80, $FF, $FD, $40, $FF, $FF, $80, $FF
	.byte $FF, $80, $FF, $FF, $80, $FF, $FF, $00
	.byte $FF, $FF, $00, $FF, $FE, $00, $FF, $FE
	.byte $00, $FF, $FC, $00, $FF, $FC, $00, $FF
	.byte $F8, $00, $EF, $78, $00, $BF, $B0, $00
	.byte $76, $D0, $00, $DB, $00, $00, $94, $40
	.byte $00, $AA, $FF, $FF, $FF, $FF, $FF, $FF
	.byte $FF, $FF, $FF, $7F, $FF, $FE, $7F, $FF
	.byte $FE, $3F, $FF, $FC, $3F, $FF, $FC, $1F
	.byte $FF, $F8, $1F, $FF, $F8, $0F, $FF, $F0
	.byte $0F, $FF, $F0, $07, $FF, $E0, $07, $FF
	.byte $E0, $03, $FF, $C0, $03, $FF, $C0, $01
	.byte $E7, $80, $01, $E7, $80, $00, $E7, $00
	.byte $00, $C3, $00, $00, $42, $00, $00, $42
	.byte $00, $AA, $00, $FF, $00, $00, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $7F, $00, $FF
	.byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
	.byte $00, $FF, $00, $FF, $54, $F5, $37, $E0
	.byte $00, $E0

