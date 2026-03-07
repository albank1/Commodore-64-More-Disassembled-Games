;====================================================================
; Avenger (1983, Commodore)
; Source in Dasm format
; Memory address $3D contains the number of lives
; I have changed dec $3D to lda $3D which gives infinite lives
;
; To assemble to a cartride images:
; a) run dasm avenger.asm -oavenger.bin -f3
; b) cartconv -t ulti -i avenger.bin -o avenger.crt
;====================================================================
      processor 6502

      .org $E000

      pha
      txa
      pha
      tya
      pha
      lda  $D019
      sta  $D019
      and  #$01
      beq  WE02F
      ldx  $D012
      lda  #$C8
      cpx  $8F
      beq  WE021
      ora  $20
      ldx  $8F
      stx  $8B
      jmp  WE027
WE021:
      ldx  #$00
      stx  $8B
      ldx  $8E
WE027:
      stx  $D012
      and  #$CF
      sta  $D016                        ; VIC control register
WE02F:
      pla
      tay
      pla
      tax
      pla
      rti
      cld
      lda  #$00
      sta  $02
      sta  $03
      sei
      ldx  #$2F
      txs
      jsr  WE740
      lda  #$7F
      sta  $DC0D
      lda  #$00
      sta  $DC0F
      ldx  #$00
      stx  $DC03
      dex
      stx  $DC02
      lda  #$E5
      sta  $01
      lda  #$2F
      sta  $00
      lda  #$08
      sta  $DC0E
      lda  #$1B
      sta  $DC04
      lda  #$41
      sta  $DC05
      lda  #$18
      sta  $DC0E
      ldx  #$04
      lda  #$00
WE076:
      sta  $00,x
      inx
      bne  WE076
      lda  #$4C
      sta  $4A
      jsr  WE2BC
      ldx  #$00
WE084:
      lda  WF7BB,x
      sta  $02C0,x
      lda  WF7FB,x
      sta  $0300,x
      dex
      bne  WE084
      ldx  #$47
WE095:
      lda  WF973,x
      sta  $B0,x
      dex
      bpl  WE095
      jsr  WE81F
      jsr  WE5F0
      lda  #$07
      sta  $2A
      jsr  WE314
      jmp  WE1FF
WE0AD:
      .byte $1B, $00, $00
      .byte $00, $00, $08, $00, $10, $00
      .byte $01, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00
WE0C8:
      ldx  #$0A
WE0CA:
      lda  WF745,x
      ldy  $06
      beq  WE0D4
      lda  WF75F,x
WE0D4:
      sta  $07CF,x
      dex
      bpl  WE0CA
      rts
WE0DB:
      lda  $2A
      clc
      adc  #$70
      sta  $07E4
      rts
WE0E4:
      ldx  #$27
WE0E6:
      lda  WF48D,x
      ldy  $06
      beq  WE0F0
      lda  WF4B5,x
WE0F0:
      sta  $0400,x                      ; Video matrix (25*40)
      dex
      bpl  WE0E6
      rts
WE0F7:
      ldx  #$15
      lda  $06                          ; Jump Vector: integer-real conversion
      beq  WE0FF
      ldx  #$0F
WE0FF:
      lda  $03
      jsr  WF076
      lda  $02
      jsr  WF076
      rts
WE10A:
      lda  #$00
      ldx  #$05
WE10E:
      sta  $22,x
      dex
      bpl  WE10E
      lda  #$03
      ldx  $28
      sta  $3D
      sta  $04,x
      jsr  WE0E4
      lda  $06
      beq  WE125
      jsr  WE800
WE125:
      jsr  WF05D
      jsr  WE0F7
      jsr  WE79F
WE12E:
      ldx  #$00
      stx  $D015
      stx  $39
      stx  $3A
      stx  $27
      ldy  #$0D
WE13B:
      stx  $13,y
      dey
      bpl  WE13B
      inx
      stx  $21
      inx
      stx  $42
      jsr  WE740
      lda  #$81
      sta  $1B
      lda  #$37
      sta  $2C
      lda  #$01
      sta  $34
      lda  #$00
      sta  $35
      lda  #$06
      sta  $29
      ldx  $22
      lda  WF33D,x
      sta  $90
      tax
      clc
      adc  #$08
      sta  $91
      txa
      asl
      asl
      asl
      adc  #$31
      sta  $8E
      sta  $D012
      adc  #$49
      sta  $8F
      ldx  #$09
WE17B:
      lda  WF406,x
      sta  $5C,x
      dex
      bpl  WE17B
      ldx  #$01
      jsr  WE2BE
      ldx  #$3F
WE18A:
      lda  WF6F6,x
      sta  $01C0,x
      sta  $0200,x
      sta  $0240,x
      sta  $0280,x
      dex
      bpl  WE18A
      jsr  WE7EF
      lda  #$00
      sta  $20
      lda  #$38
      sta  $10
      lda  $91
      sta  $11
      lda  #$05
      sta  $8C
WE1AF:
      ldy  #$21
      ldx  $11
      lda  WF30B,x
      sta  $0C
      lda  WF324,x
      sta  $0D
WE1BD:
      ldx  #$03
      lda  $10
WE1C1:
      sec
      sbc  #$01
      sta  ($0C),y
      dey
      beq  WE1CF
      dex
      bne  WE1C1
      jmp  WE1BD
WE1CF:
      sta  $10
      dec  $11
      dec  $11
      dec  $8C
      bne  WE1AF
      cli
      lda  #$09
      sta  $37
      lda  #$FF
      sta  $8D
      lda  #$0B
      sta  $38
      lda  #$F8
      sta  $07FD
      jsr  WE5C2
      lda  $26
      bne  WE1FC
      lda  #$4F
      sta  $D418
      sta  $96
      jsr  WE816
WE1FC:
      jmp  WE5F0
WE1FF:
      inc  $DC0E
      jsr  WE20E
WE205:
      lda  $DC0E
      lsr
      bcs  WE205
      jmp  WE1FF
WE20E:
      lda  #$00
      sta  $36
      lda  $D01E
      sta  $46
      lda  $D01F
      sta  $45
WE21C:
      ldx  $36
      inc  $15
      lda  $5C,x
      bmi  WE23C
      beq  WE22B
      dec  $5C,x
      jmp  WE23C
WE22B:
      lda  WF42C,x
      cmp  #$FF
      beq  WE240
      sta  $4C
      lda  WF41E,x
      sta  $4B
      jsr  $004A
WE23C:
      inc  $36
      bne  WE21C
WE240:
      lda  $3D
      beq  WE27A
      lda  $91
      cmp  #$17
      bne  WE253
      lda  #$01
      sta  $3D
      sta  $91
      jmp  WEE97
WE253:
      lda  $2C
      bne  WE279
      jsr  WE5C2
      lda  $1C
      ora  $1D
      ora  $1E
      ora  $1F
      ora  $5E
      bne  WE279
      lda  $64
      bpl  WE279
      inc  $22
      lda  $22
      cmp  #$09
      bne  WE274
      lda  #$01
WE274:
      sta  $22
      jmp  WE12E
WE279:
      rts
WE27A:
      lda  $26
      beq  WE28E
      lda  $5E
      cmp  #$14
      bne  WE289
WE284:
      inc  $2C
      jmp  WE314
WE289:
      lda  $2C
      beq  WE284
      rts
WE28E:
      lda  $66
      bpl  WE2BB
      lda  #$80
      ldx  #$09
WE296:
      sta  $5C,x
      dex
      bpl  WE296
      lda  #$00
      sta  $66
      sta  $33
      jsr  WE5C2
      lda  $24
      cmp  $02
      lda  $25
      sbc  $03
      bcc  WE2BB
      lda  $24
      sta  $02
      lda  $25
      sta  $03
      ldx  #$0C
      jmp  WE0F7
WE2BB:
      rts
WE2BC:
      ldx  #$00
WE2BE:
      lda  WF30B,x
      sta  $0C
      lda  WF324,x
      sta  $0D
      ldy  #$27
      lda  #$58
WE2CC:
      sta  ($0C),y
      dey
      bpl  WE2CC
      inx
      cpx  #$19
      bne  WE2BE
      rts
      lda  #$06
      sta  $66
      ldx  $33
      bne  WE2E9
      ldx  #$77
      lda  #$58
WE2E3:
      sta  $0450,x
      dex
      bpl  WE2E3
WE2E9:				; Writes GAME OVER TO SCREEN
      ldx  $33
      inc  $33
      cpx  #$28
      beq  WE305
      cpx  #$11
      bcs  WE2FC
      lda  WF46F,x
      sta  $0483,x
      rts
WE2FC:
      lda  $28
      clc
      adc  #$77
      sta  $0494
      rts
WE305:
      lda  #$80
      sta  $66
      lda  $07
      beq  WE314
      dec  $07
      inc  $3D
      jmp  WF158
WE314:
      ldx  #$00
      stx  $69
WE318:
      stx  $67
      stx  $3D
      stx  $1B
      stx  $D015
      dex
      stx  $26
      lda  #$80
      ldx  #$0A
WE328:
      sta  $5C,x
      dex
      bpl  WE328
      sta  $68
      jsr  WE2BC
      jsr  WE75C
      sei
      lda  #$00
      sta  $11
      lda  #$0A
      sta  $12
      ldx  #$5E
      stx  $0771
      stx  $0783
      stx  $0790
      ldx  #$67
      stx  $0774
      ldx  #$6A
      stx  $0775
      ldx  #$5E
      stx  $0777
      ldx  #$61
      stx  $0778
      ldx  #$6A
      stx  $0779
      ldx  #$5D
      stx  $077A
      ldx  #$77
      stx  $0772
      ldx  #$79
      stx  $0784
      ldx  #$7B
      stx  $0791
      ldx  #$27
WE378:
      lda  WF736,x
      sta  $07C0,x
      dex
      bpl  WE378
      jsr  WE0C8
      jsr  WE0DB
      jmp  WE662
WE38A:
      ldy  $32
      lda  WF30B,y
      sta  $0C
      lda  WF324,y
      sta  $0D
      ldx  $11
      inc  $11
      lda  WF64D,x
      cmp  #$C0
      bcs  WE3AF
      ldy  $30
      sta  ($0C),y
      inc  $30
      lda  $12
      beq  WE38A
      sta  $67
      bne  WE3D0
WE3AF:
      cmp  #$FF
      beq  WE3E1
      cmp  #$FE
      beq  WE3C9
      lda  WF64E,x
      sta  $30
      lda  WF64F,x
      sta  $32
      inx
      inx
      inx
      stx  $11
      jmp  WE38A
WE3C9:
      lda  WF64E,x
      sta  $12
      inc  $11
WE3D0:
      lda  $95
      clc
      adc  #$06
      cmp  #$0B
      beq  WE3DE
      sta  $95
      jmp  WE6DD
WE3DE:
      jmp  WE6D4
WE3E1:
      ldx  #$00
      stx  $22
      stx  $07
      stx  $06
      inx
      stx  $3F
      stx  $40
      stx  $41
      jsr  WE12E
      jsr  WE0E4
      jsr  WE0F7
      lda  #$64
      sta  $68
      lda  #$80
      sta  $67
      sta  $61
      lda  $24
      sta  $15
      rts
      lda  $64
      bmi  WE40D
      rts
WE40D:
      lda  $1F
      bne  WE414
      jsr  WE98D
WE414:
      dec  $3F
      bne  WE433
      inc  $43
      ldx  $43
      lda  WF552,x
      and  #$0F
      sta  $3F
      lda  WF554,x
      lsr
      bcc  WE42F
      lda  $40
      sta  $41
      bcs  WE433
WE42F:
      lda  #$00
      sta  $41
WE433:
      lda  $34
      clc
      adc  $41
      sta  $34
      tax
      lda  $41
      bpl  WE443
      bcs  WE44B
      bcc  WE445
WE443:
      bcc  WE44B
WE445:
      lda  $35
      eor  #$01
      sta  $35
WE44B:
      lda  $35
      bne  WE456
      txa
      bne  WE469
      inc  $34
      bne  WE45A
WE456:
      cpx  #$28
      bcc  WE469
WE45A:
      lda  $40
      eor  #$FF
      clc
      adc  #$01
      sta  $40
      sta  $41
      lda  #$05
      sta  $3F
WE469:
      rts
      lda  #$03
      sta  $69
      lda  $44
      beq  WE478
      dec  $44
      beq  WE4BE
      bne  WE49A
WE478:
      lda  #$FF
      sta  $DC02
      lda  #$FE
      sta  $DC00
      lda  $DC01
      tay
      lda  #$00
      sta  $DC02
      tya
      and  #$10
      beq  WE4CE
      tya
      and  #$20
      beq  WE49B
      tya
      and  #$40
      beq  WE4AA
WE49A:
      rts
WE49B:
      lda  $06
      eor  #$01
      sta  $06
      lda  #$3C
      sta  $69
      ldx  #$00
      jmp  WE318
WE4AA:
      ldx  $2A
      cpx  #$0A
      bne  WE4B2
      ldx  #$06
WE4B2:
      inx
      stx  $2A
      lda  #$3C
      sta  $69
      ldx  #$00
      jmp  WE318
WE4BE:
      lda  #$80
      sta  $69
      ldx  $28
      lda  $04,x
      bne  WE4CB
      jmp  WE10A
WE4CB:
      jmp  WF170
WE4CE:
      lda  $06
      sta  $07
      lda  #$00
      sta  $04
      sta  $05
      sta  $28
      sta  $08
      sta  $09
      sta  $0A
      sta  $0B
WE4E2:
      sta  $D015
      jsr  WE2BC
      jsr  WE5F0
      ldx  #$0A
WE4ED:
      lda  WF480,x
      sta  $05ED,x
      dex
      bpl  WE4ED
      lda  $28
      clc
      adc  #$77
      sta  $05F9
      lda  #$16
      sta  $44
      ldx  #$0C
      lda  #$80
WE506:
      sta  $5C,x
      dex
      bpl  WE506
      rts
      lda  $17
      beq  WE51B
      lda  #$80
      sta  $D404
      lda  #$00
      sta  $17
      beq  WE547
WE51B:
      lda  $19
      beq  WE528
      dec  $19
      bne  WE528
      lda  #$80
      sta  $D40B
WE528:
      lda  $18
      beq  WE547
      dec  $18
      dec  $18
      bne  WE539
      lda  #$00
      sta  $D40B
      bne  WE547
WE539:
      ldx  $18
      lda  WF78A,x
      sta  $D407
      lda  WF78B,x
      sta  $D408
WE547:
      lda  $1A
      bmi  WE559
      lda  $64
      bmi  WE559
      lda  #$00
      sta  $D40E
      sta  $D40F
      beq  WE582
WE559:
      lda  $1A
      and  #$7F
      beq  WE582
      dec  $1A
      lda  $1A
      and  #$7F
      bne  WE56E
      lda  $1A
      clc
      adc  #$0B
      sta  $1A
WE56E:
      lda  $1A
      asl
      tax
      lda  WF772,x
      sta  $D40E
      lda  WF773,x
      bcc  WE57F
      sbc  #$30
WE57F:
      sta  $D40F
WE582:
      lda  $64
      bpl  WE5C1
      lda  #$00
      sta  $D404
      lda  $1B
      and  #$3F
      beq  WE5C1
      lda  $5E
      bne  WE5C1
      dec  $1B
      lda  $1B
      and  #$3F
      bne  WE5C1
      lda  $1B
      clc
      adc  $2C
      adc  #$02
      adc  #$40
      sta  $1B
      and  #$C0
      clc
      rol
      rol
      rol
      rol
      tax
      lda  WF76A,x
      sta  $D400
      lda  WF76B,x
      sta  $D401
      lda  #$41
      sta  $D404
WE5C1:
      rts
WE5C2:
      ldx  #$18
WE5C4:
      lda  WE5D7,x
      sta  $D400,x
      dex
      bpl  WE5C4
      ldx  #$03
      lda  #$00
WE5D1:
      sta  $17,x
      dex
      bpl  WE5D1
      rts
WE5D7:
      .byte $00, $00, $00, $08, $40, $00, $80, $00
      .byte $00, $00, $08, $00, $00, $F0, $00
      .byte $00, $00, $08, $40, $00, $8C, $FF, $8C
      .byte $F0, $40
WE5F0:
      ldx  #$17
WE5F2:
      lda  WF30B,x
      sta  $0C
      lda  WF324,x
      clc
      adc  #$D4
      sta  $0D
      ldy  #$27
      lda  WF52D,x
WE604:
      sta  ($0C),y
      dey
      bpl  WE604
      dex
      bpl  WE5F2
      ldx  #$27
WE60E:
      lda  WF505,x
      ldy  $06
      beq  WE618
      lda  WF4DD,x
WE618:
      sta  $D800,x
      dex
      bpl  WE60E
      lda  $06
      beq  WE638
      lda  $28
      eor  #$01
      sta  $28
      lda  #$0C
      jsr  WE7DD
      lda  $28
      eor  #$01
      sta  $28
      lda  #$01
      jsr  WE7DD
WE638:
      ldx  #$07
WE63A:
      lda  WF547,x
      sta  $D027,x
      dex
      bpl  WE63A
      rts
WE644:
      lda  #$02
      ldx  #$00
WE648:
      sta  $D800,x
      sta  $D900,x
      sta  $DA00,x
      sta  $DB00,x
      dex
      bne  WE648
      ldx  #$07
      lda  #$02
WE65B:
      sta  $D027,x
      dex
      bpl  WE65B
      rts
WE662:
      lda  #$A0
      sta  $0C
      lda  #$02
      sta  $0D
      ldx  #$78
WE66C:
      lda  WF8FB,x
      sta  $01C0,x
      dex
      bpl  WE66C
      ldx  #$70
WE677:
      ldy  #$00
WE679:
      lda  $01C7,x
      sta  ($0C),y
      dex
      beq  WE694
      iny
      cpy  #$08
      bne  WE679
      lda  $0C
      sec
      sbc  #$08
      sta  $0C
      bcs  WE691
      dec  $0D
WE691:
      jmp  WE677
WE694:
      ldx  #$02
      ldy  #$EB
WE698:
      tya
      sta  $07F8,x
      dey
      dex
      bpl  WE698
      lda  #$3A
      sta  $D001
      sta  $D003
      sta  $D005
      lda  #$77
      sta  $D000
      lda  #$A7
      sta  $D002
      lda  #$D7
      sta  $D004
      lda  #$08
      sta  $D027
      sta  $D028
      sta  $D029
      lda  #$07
      sta  $D01D
      lda  #$00
      sta  $D010
      lda  #$07
      sta  $D015
WE6D4:
      ldx  #$05
      stx  $95
      lda  WE735,x
      sta  $94
WE6DD:
      ldx  #$CE
      ldy  #$29
WE6E1:
      lda  #$06
      sta  $0C
WE6E5:
      lda  WE70B,y
      sta  $0402,x
      lda  $94
      sta  $D802,x
      dex
      dey
      bmi  WE70A
      dec  $0C
      bpl  WE6E5
      txa
      sec
      sbc  #$21
      pha
      dec  $95
      ldx  $95
      lda  WE735,x
      sta  $94
      pla
      tax
      bne  WE6E1
WE70A:
      rts
WE70B:
      .byte $39, $3A, $3B, $3C, $38, $38, $38, $3D
      .byte $3E, $3F, $40, $41, $41, $42, $43, $44
      .byte $38, $38, $45, $46, $38, $51, $52, $38
      .byte $38, $53, $54, $38, $4B, $4C, $4D, $4E
      .byte $4F, $4F, $50, $47, $48, $49, $4A, $38
      .byte $38, $38
WE735:
      .byte $02, $08, $07, $05, $06, $04, $02, $08
      .byte $07
      ora  $06                          ; Jump Vector: integer-real conversion
WE740:
      ldx  #$1D
WE742:
      lda  WE0AD,x
      sta  $D011,x                      ; VIC control register
      dex
      bpl  WE742
      lda  $D01E
      lda  $D01F
      lda  #$42
      sta  $D009
      lda  #$EA
      sta  $D00B
      rts
WE75C:
      ldx  #$18
WE75E:
      lda  WF30B,x
      sta  $0C
      lda  WF324,x
      clc
      adc  #$D4
      sta  $0D
      ldy  #$27
      lda  WE786,x
WE770:
      sta  ($0C),y
      dey
      bpl  WE770
      dex
      bpl  WE75E
      ldx  #$0B
WE77A:
      lda  #$07
      sta  $DB7E,x
      sta  $DBCE,x
      dex
      bpl  WE77A
      rts
WE786:
      ora  ($01,x)
      ora  ($01,x)
      ora  $010D
      ora  ($01,x)
      ora  ($0E,x)
      asl  $0707
      asl
      asl
      ora  $030D
      slo  ($03,x)
      ora  ($01,x)
      ora  ($01,x)
WE79F:
      lda  #$58
      ldx  #$08
WE7A3:
      ldy  $06
      beq  WE7AC
      sta  $0415,x
      bne  WE7AF
WE7AC:
      sta  $041B,x
WE7AF:
      dex
      bpl  WE7A3
      lda  $3D
      beq  WE7DC
      ldx  #$01
WE7B8:
      cpx  $3D
      beq  WE7DC
      txa
      asl
      tay
      lda  $06
      beq  WE7CF
      lda  #$1B
      sta  $0413,y
      lda  #$1C
      sta  $0414,y
      bne  WE7D9
WE7CF:			; draw ships at top of screen (no of lives)
      lda  #$1B
      sta  $0419,y
      lda  #$1C
      sta  $041A,y
WE7D9:
      inx
      bne  WE7B8
WE7DC:
      rts
WE7DD:
      ldx  #$0A
      ldy  $28
      beq  WE7E5
      ldx  #$25
WE7E5:
      ldy  #$07
WE7E7:
      sta  $D800,x
      dex
      dey
      bpl  WE7E7
      rts
WE7EF:
      ldy  #$1F
      lda  #$57
WE7F3:
      ldx  WF43C,y
      sta  $0720,x
      sec
      sbc  #$01
      dey
      bpl  WE7F3
      rts
WE800:
      jsr  WE806
      jsr  WF05D
WE806:
      lda  $28
      eor  #$01
      sta  $28
      tax
      lda  $08,x
      sta  $24
      lda  $0A,x
      sta  $25
      rts
WE816:
      lda  $22
      clc
      adc  #$77
      sta  $0401
      rts
WE81F:
      ldx  #$90
      lsr
      bcc  WE82E
WE824:
      lda  WF1E8+2,x
      sta  $012F,x
      dex
      bne  WE824
      rts
WE82E:
      lda  WF27A,x
      sta  $012F,x
      dex
      bne  WE82E
      rts
      dec  $93
      lda  $93
      bpl  WE863
      lda  $29
      sta  $93
WE842:
      lda  $8B
      beq  WE842
WE846:
      lda  $8B
      bne  WE846
      lda  $20
      clc
      adc  $21
      tay
      and  #$07
      sta  $20
      dec  $8C
      lda  $8C
      lsr
      bcc  WE85E
      jsr  WE81F
WE85E:
      tya
      and  #$08
      bne  WE864
WE863:
      rts
WE864:
      ldx  $91
      ldy  #$00
      lda  $21
      bmi  WE86E
      ldy  #$26
WE86E:
      lda  WF30B,x
      sta  $0C
      lda  WF324,x
      sta  $0D
      lda  ($0C),y
      cmp  #$58
      bne  WE887
      cpx  $90
      beq  WE8E3
      dex
      dex
      jmp  WE86E
WE887:
      ldx  $91
WE889:
      lda  WF30B,x
      sta  $0C
      lda  WF324,x
      sta  $0D
      inx
      lda  WF30B,x
      sta  $0E
      lda  WF324,x
      sta  $0F
      dex
      ldy  #$27
WE8A1:
      lda  ($0C),y
      sta  ($0E),y
      dey
      bpl  WE8A1
      cpx  $90
      beq  WE8AF
      dex
      bpl  WE889
WE8AF:
      lda  #$58
      ldy  #$27
WE8B3:
      sta  ($0C),y
      dey
      bpl  WE8B3
      inc  $90
      ldx  $91
      inx
      stx  $91
      cpx  #$15
      bne  WE8C5
      stx  $27
WE8C5:
      cpx  #$17
      bne  WE8CD
      lda  #$14
      sta  $5E
WE8CD:
      lda  #$08
      clc
      adc  $8E
      sta  $8E
      lda  #$08
      clc
      adc  $8F
      sta  $8F
      lda  #$00
      sec
      sbc  $21
      sta  $21
      rts
WE8E3:
      lda  WF30B,x
      sta  $0C
      sta  $0E
      lda  WF324,x
      sta  $0D
      sta  $0F
      lda  $21
      bpl  WE8FB
      inc  $0E
      ldy  #$00
      beq  WE8FF
WE8FB:
      dec  $0E
      ldy  #$27
WE8FF:
      lda  ($0E),y
      sta  ($0C),y
      lda  $21
      bpl  WE90E
      iny
      cpy  #$28
      bne  WE8FF
      beq  WE911
WE90E:
      dey
      bpl  WE8FF
WE911:
      cpx  $91
      beq  WE91A
      inx
      inx
      jmp  WE8E3
WE91A:
      lda  $21
      clc
      adc  $8D
      sta  $8D
      rts
      lda  #$20
      ora  $D015
      sta  $D015
      lda  #$F8
      sta  $07FD
      clc
      lda  $34
      adc  #$20
      sta  $D00A
      lda  $35
      adc  #$00
      beq  WE944
      lda  #$20
      ora  $D010
      bne  WE949
WE944:
      lda  #$DF
      and  $D010
WE949:
      sta  $D010
      rts
      jsr  WECD3
      lsr
      lsr
      lsr
      bcs  WE967
      ldx  $35
      bne  WE95F
      ldx  $34
      cpx  #$01
      bcc  WE97A
WE95F:
      ldx  $34
      bne  WE965
      dec  $35
WE965:
      dec  $34
WE967:
      lsr
      bcs  WE97A
      ldx  $35
      beq  WE974
      ldx  $34
      cpx  #$28
      bcs  WE97A
WE974:
      inc  $34
      bne  WE97A
      inc  $35
WE97A:
      ldx  $1F
      bne  WE98C
      lsr
      bcs  WE988
      lda  $14
      bne  WE98C
      jmp  WE98D
WE988:
      lda  #$00
      sta  $14
WE98C:
      rts
WE98D:
      lda  $34
      clc
      adc  #$0E
      sta  $53
      lda  #$00
      adc  $35
      sta  $57
      lda  #$B1
      sta  $1F
      sta  $14
      lda  #$F2
      sta  $07FB
      lda  #$00
      sta  $5B
      dec  $37
      bne  WE9B1
      lda  #$0F
      sta  $37
WE9B1:
      lda  #$05
      sta  $19
      lda  #$5C
      sta  $D407
      lda  #$12
      sta  $D408
      lda  #$F9
      sta  $D40D
      lda  #$5A
      sta  $D416
      lda  #$F2
      sta  $D417
      lda  $26
      eor  #$4F
      sta  $D418
      sta  $96
      lda  #$81
      sta  $D40B
      rts
      lda  #$01
      sta  $5D
      ldx  $1F
      bne  WE9E6
      rts
WE9E6:
      lda  #$08
      ora  $D015
      sta  $D015
      stx  $32
      lda  $53
      sta  $30
      lda  $57
      sta  $31
      lda  $5B
      beq  WE9FF
      jmp  WEB96
WE9FF:
      jsr  WEBF9
      cmp  #$58
      bne  WEA4A
WEA06:
      lda  $46
      and  #$08
      beq  WEA0F
      jmp  WEB69
WEA0F:
      lda  $32
      sec
      sbc  #$08
      cmp  #$02
      bcs  WEA1D
      ldy  #$05
      jmp  WEB3C
WEA1D:
      sta  $1F
      sta  $32
      clc
      adc  #$31
      sta  $D007
      lda  #$F2
      sta  $07FB
      lda  $30
      clc
      adc  #$18
      sta  $D006
      lda  $31
      adc  #$00
      beq  WEA41
      lda  #$08
      ora  $D010
      bne  WEA46
WEA41:
      lda  #$F7
      and  $D010
WEA46:
      sta  $D010
      rts
WEA4A:
      jsr  WEBF9
      cmp  #$38
      bcc  WEA58
      cmp  #$58
      bcs  WEA58
      jmp  WEB13
WEA58:
      lda  $30
      sec
      sbc  $20
      bcs  WEA61
      dec  $31
WEA61:
      jsr  WEBF9
      ldx  $53
      stx  $30
      ldx  $57
      stx  $31
      cmp  #$38
      bcc  WEA73
      jmp  WEA0F
WEA73:
      sec
      sbc  #$29
      tax
WEA77:
      cmp  #$03
      bcc  WEA7F
      sbc  #$03
      bpl  WEA77
WEA7F:
      sta  $10
      lda  $0C
      sec
      sbc  $10
      sta  $0C
      bcs  WEA8C
      dec  $0D
WEA8C:
      lda  #$58
      ldy  #$02
WEA90:
      sta  ($0C),y
      dey
      bpl  WEA90
      cpx  #$03
      bcs  WEA9D
      lda  #$03
      bcc  WEAA7
WEA9D:
      cpx  #$09
      bcs  WEAA5
      lda  #$02
      bcc  WEAA7
WEAA5:
      lda  #$01
WEAA7:
      jsr  WF03D
      ldx  $2C
      dex
      beq  WEAD3
WEAAF:
      ldx  $91
      lda  WF30B,x
      sta  $0C
      lda  WF324,x
      sta  $0D
      ldy  #$27
WEABD:
      lda  ($0C),y
      cmp  #$58
      bne  WEAD3
      dey
      bpl  WEABD
      dec  $91
      dec  $91
      lda  $8F
      sec
      sbc  #$10
      sta  $8F
      bcs  WEAAF
WEAD3:
      lda  $53
      clc
      adc  #$18
      sta  $D006
      lda  $57
      adc  #$00
      beq  WEAE8
      lda  #$08
      ora  $D010
      bne  WEAED
WEAE8:
      lda  #$F7
      and  $D010
WEAED:
      sta  $D010
      lda  #$F5
      sta  $07FB
      lda  #$86
      sta  $5B
      sta  $5E
      lda  #$18
      sta  $18
      lda  #$80
      sta  $D40D
      lda  #$F0
      sta  $D417
      lda  #$11
      sta  $D40B
      lda  #$00
      sta  $19
      rts
WEB13:
      sec
      sbc  #$37
      asl
      asl
      asl
      tax
      dex
      lda  $30
      and  #$07
      sta  $10
      lda  #$07
      sec
      sbc  $10
      tay
      lda  WF7A2,y
      sta  $10
      ldy  #$07
WEB2E:
      lda  $10
      and  $01C0,x
      bne  WEB3C
      dex
      dey
      bpl  WEB2E
      jmp  WEA06
WEB3C:
      sty  $10
      lda  $32
      clc
      adc  $10
      sec
      sbc  #$06
      sta  $32
      sta  $1F
      lda  $13
      lsr
      lda  $30
      sbc  #$03
      sta  $30
      sta  $53
      lda  $31
      sbc  #$00
      sta  $31
      sta  $57
      lda  #$00
      ldx  #$03
      jsr  WEC1F
      lda  #$06
      sta  $5B
      rts
WEB69:
      lda  $46
      and  #$10
      bne  WEB72
WEB6F:
      jmp  WEA0F
WEB72:
      lda  $3C
      bne  WEB6F
      lda  #$10
      sta  $5D
      lda  #$FF
      sta  $3C
      lda  #$00
      sta  $1F
      lda  $1A
      ora  #$80
      sta  $1A
      lda  #$40
      sta  $D412
      lda  #$F7
      and  $D015
      sta  $D015
      rts
WEB96:
      dec  $5B
      bmi  WEBA7
      beq  WEB9D
      rts
WEB9D:
      ldx  #$03
      jsr  WEC56
WEBA2:
      lda  #$00
      sta  $1F
      rts
WEBA7:
      lda  $5B
      cmp  #$81
      bne  WEBF2
      lda  #$F7
      and  $D015
      sta  $D015
      lda  $64
      and  #$80
      eor  #$80
      sta  $5E
      dec  $2C
      lda  $2C
      ldx  $2A
WEBC3:
      cmp  WED2F,x
      beq  WEBCD
      dex
      bpl  WEBC3
      bmi  WEBDE
WEBCD:
      lda  $29
      bne  WEBDB+1
      lda  $21
      bmi  WEBD9
      inc  $21
      bne  WEBDE
WEBD9:
      dec  $21
WEBDB:
      bit  $29C6
WEBDE:
      lda  $2C
      cmp  #$08
      bcc  WEBE7
      jmp  WEBA2
WEBE7:
      ldx  #$02
      stx  $42
      lda  #$80
      sta  $63
      jmp  WEBA2
WEBF2:
      rts
      jsr  WEBFF
      sta  ($0C),y
      rts
WEBF9:
      jsr  WEBFF
      lda  ($0C),y
      rts
WEBFF:
      pha
      lda  $32
      lsr
      lsr
      lsr
      tay
      lda  $31
      ror
      lda  $30
      ror
      lsr
      lsr
      clc
      adc  WF30B,y
      sta  $0C
      lda  WF324,y
      adc  #$00
      sta  $0D
      ldy  #$00
      pla
      rts
WEC1F:
      cpx  #$03
      bne  WEC25+1
      lda  #$F4
WEC25:
      bit  WF3A9
      sta  $07F8,x
      ldy  WF7B2,x
      lda  $30
      clc
      adc  #$18
      sta  $D000,y
      lda  $31
      adc  #$00
      beq  WEC44
      lda  WF7A2,x
      ora  $D010
      bne  WEC4A
WEC44:
      lda  WF7AA,x
      and  $D010
WEC4A:
      sta  $D010
      lda  $32
      clc
      adc  #$32
      sta  $D001,y
      rts
WEC56:
      stx  $11
      jsr  WEBFF
      lda  #$00
      ldx  #$1F
WEC5F:
      sta  $6B,x
      dex
      bpl  WEC5F
      lda  $30
      and  #$07
      asl
      asl
      asl
      ldx  $11
      cpx  #$03
      beq  WEC73+1
      ora  #$80
WEC73:
      bit  $0A
      tay
      lda  $32
      and  #$07
      tax
      lda  #$08
      sta  $10
WEC7F:
      lda  WF346,y
      sta  $6B,x
      lda  WF34E,y
      sta  $7B,x
      inx
      iny
      dec  $10
      bne  WEC7F
      lda  #$03
      sta  $47
WEC93:
      ldx  $47
      ldy  WF41A,x
      lda  ($0C),y
      cmp  #$38
      bcc  WECC3
      cmp  #$58
      bcs  WECC3
      sbc  #$37
      asl
      asl
      asl
      tax
      lda  $47
      asl
      asl
      asl
      tay
      lda  #$08
      sta  $10
WECB2:
      lda  $006B,y
      eor  #$FF
      and  $01C0,x
      sta  $01C0,x
      inx
      iny
      dec  $10
      bne  WECB2
WECC3:
      dec  $47
      bpl  WEC93
      ldx  $11
      lda  WF7AA,x
      and  $D015
      sta  $D015
      rts
WECD3:
      lda  #$00
      sta  $DC00
      lda  $DC01
      cmp  #$FF
      bne  WED25
      sta  $DC00
      sta  $10
      sta  $DC02
      jsr  WED44
      bne  WED05
      lda  #$00
      sta  $D418
WECF1:
      jsr  WED3A
      beq  WECF1
WECF6:
      jsr  WED3A
      bne  WECF6
WECFB:
      jsr  WED3A
      beq  WECFB
      lda  $96
      sta  $D418
WED05:
      ldx  #$02
WED07:
      lda  WED26,x
      sta  $DC00
      lda  $DC01
      and  WED29,x
      bne  WED1C
      lda  $10
      and  WED2C,x
      sta  $10
WED1C:
      dex
      bpl  WED07
      inx
      stx  $DC02
      lda  $10
WED25:
      rts
WED26:
      .byte $FD, $BF, $DF
WED29:
      .byte $04, $04
      .byte $04
WED2C:
      .byte $EF, $F7, $FB
WED2F:
      .byte $01, $02, $04, $06, $14, $1E, $28, $32
      .byte $33, $08
      .byte $1F
WED3A:
      .byte $AD, $11, $D0, $30, $FB, $AD, $11, $D0
      .byte $10
      .byte $FB
WED44:
      .byte $A9, $7F, $8D, $00, $DC, $AD, $01, $DC
      .byte $29, $80, $60
      lda  #$01
      sta  $62
      lda  $2C
      beq  WEDD0
      ldx  $42
WED59:
      lda  $1C,x
      beq  WED61
      dex
      bpl  WED59
      rts
WED61:
      stx  $11
      ldy  $15
      inc  $15
      lda  WF54D,y
      rol
      adc  WF54D,y
      adc  $8D
      cmp  #$28
      bcs  WEDD0
      tay
      ldx  $91
WED77:
      lda  WF30B,x
      sta  $0C
      lda  WF324,x
      sta  $0D
      lda  ($0C),y
      cmp  #$38
      bcc  WED8F
      cpx  $90
      beq  WEDD0
      dex
      dex
      bne  WED77
WED8F:
      sec
      sbc  #$29
WED92:
      cmp  #$03
      bcc  WED9A
      sbc  #$03
      bpl  WED92
WED9A:
      sta  $10
      dec  $10
      tya
      sec
      sbc  $10
      tay
      lda  $20
      clc
      adc  #$04
      sta  $10
      txa
      ldx  $11
      asl
      asl
      rol
      adc  #$0E
      sta  $1C,x
      tya
      asl
      asl
      rol
      ldy  #$00
      sty  $11
      rol  $11
      adc  $10
      and  #$FE
      sta  $50,x
      lda  #$00
      sta  $58,x
      adc  $11
      sta  $54,x
      lda  #$01
      sta  $4D,x
WEDD0:
      rts
      lda  #$01
      sta  $5C
      lda  #$02
      sta  $12
WEDD9:
      ldx  $12
      lda  $1C,x
      bne  WEDE2
      jmp  WEF32
WEDE2:
      sta  $32
      lda  $50,x
      sta  $30
      lda  $54,x
      sta  $31
      lda  WF7A2,x
      ora  $D015
      sta  $D015
      lda  $58,x
      beq  WEDFC
      jmp  WEF3A
WEDFC:
      lda  $45
      and  WF7A2,x
      bne  WEE5C
      lda  $46
      and  WF7A2,x
      bne  WEE82
WEE0A:
      ldx  $12
      lda  $32
      clc
      adc  $4D,x
      adc  #$01
      sta  $32
      sta  $1C,x
      cmp  #$C1
      bcs  WEE65
      lda  $4D,x
      eor  #$01
      sta  $4D,x
      ldy  WF7B2,x
      lda  $30
      clc
      adc  #$17
      sta  $D000,y
      lda  $31
      adc  #$00
      beq  WEE3A
      lda  WF7A2,x
      ora  $D010
      bne  WEE40
WEE3A:
      lda  WF7AA,x
      and  $D010
WEE40:
      sta  $D010
      lda  $32
      adc  #$32
      sta  $D001,y
      and  #$08
      lsr
      lsr
      lsr
      adc  #$EC
      sta  $10
      tya
      adc  $10
      sta  $07F8,x
      jmp  WEF32
WEE5C:
      lda  $32
      clc
      adc  #$04
      sta  $32
      sta  $1C,x
WEE65:
      ldx  $12
      lda  $30
      sec
      sbc  #$02
      sta  $30
      sta  $50,x
      lda  $31
      sbc  #$00
      sta  $31
      sta  $54,x
      lda  #$09
      sta  $58,x
      jsr  WEC1F
      jmp  WEF32
WEE82:
      lda  $46
      and  #$20
      beq  WEEE2
      ldx  $12
      lda  #$00
      sta  $1C,x
      lda  WF7AA,x
      and  $D015
      sta  $D015
WEE97:
      lda  #$80
      ldx  #$05
WEE9B:
      sta  $5E,x
      dex
      bpl  WEE9B
      sta  $68
      lda  #$00
      sta  $64
      lda  #$0F
      sta  $3E
      lda  #$FF
      sta  $17
      lda  #$F4
      sta  $D400
      lda  #$01
      sta  $D401
      lda  #$FC
      sta  $D406
      lda  #$96
      sta  $D416
      lda  #$F1
      sta  $D417
      lda  $26
      eor  #$1F
      sta  $D418
      sta  $96
      lda  #$81
      sta  $D404
      lda  $26
      bne  WEEDC
      jsr  WE644
WEEDC:
      jmp  WEF32
WEEDF:
      jmp  WEE65
WEEE2:
      lda  $46
      and  #$08
      beq  WEF2F
      lda  $30
      sec
      sbc  $53
      cmp  #$F2
      bcs  WEEF5
      cmp  #$02
      bcs  WEF2F
WEEF5:
      lda  $32
      sec
      sbc  $1F
      cmp  #$0C
      bcc  WEF02
      cmp  #$F9
      bcc  WEF2F
WEF02:
      lda  $5B
      bne  WEF2F
      lda  $15
      tay
      asl
      tya
      rol
      rol
      rol
      cmp  #$55
      bcc  WEEDF
      pha
      lda  $53
      sta  $30
      lda  $1F
      sta  $32
      ldy  #$06
      jsr  WEB3C
      ldx  $12
      lda  $50,x
      sta  $30
      lda  $1C,x
      sta  $32
      pla
      cmp  #$AA
      bcc  WEEDF
WEF2F:
      jmp  WEE0A
WEF32:
      dec  $12
      bmi  WEF39
      jmp  WEDD9
WEF39:
      rts
WEF3A:
      dec  $58,x
      bne  WEF32
      jsr  WEC56
      ldx  $12
      lda  #$00
      sta  $1C,x
      beq  WEF32
      lda  #$7F
      sta  $63
      dec  $38
      bmi  WEF52
      rts
WEF52:
      lda  #$0B
      sta  $38
      lda  $37
      lsr
      lsr
      bcc  WEF68
      lda  #$01
      sta  $39
      lda  #$00
      sta  $3A
      lda  #$02
      bne  WEF72
WEF68:
      lda  #$28
      sta  $39
      lda  #$01
      sta  $3A
      lda  #$FE
WEF72:
      sta  $3B
      lda  #$00
      sta  $3C
      sta  $60
      lda  #$F6
      sta  $07FC
      lda  #$01
      sta  $1A
      lda  #$41
      sta  $D412
      rts
      lda  #$02
      sta  $60
      lda  #$10
      ora  $D015
      sta  $D015
      lda  $3C
      bpl  WEFD4
      cmp  #$FF
      bne  WEFA7
      lda  #$8A
      sta  $3C
      lda  #$F7
      sta  $07FC
      rts
WEFA7:
      dec  $3C
      bpl  WEFAC
      rts
WEFAC:
      ldx  $37
      lda  WF45B,x
      tay
      clc
      adc  #$FB
      sta  $07FC
      lda  $39
      sec
      sbc  #$04
      sta  $39
      tax
      lda  $3A
      sbc  #$00
      sta  $3A
      jsr  WF020
      lda  WF46B,y
      jsr  WF03D
      lda  #$1B
      sta  $3C
      rts
WEFD4:
      beq  WEFDB
      dec  $3C
      beq  WF000
      rts
WEFDB:
      lda  $39
      clc
      adc  $3B
      sta  $39
      tax
      lda  $3B
      bpl  WEFEB
      bcs  WEFF3
      bcc  WEFED
WEFEB:
      bcc  WEFF3
WEFED:
      lda  $3A
      eor  #$01
      sta  $3A
WEFF3:
      lda  $3A
      bne  WEFFC
      txa
      beq  WF000
      bne  WF01B
WEFFC:
      cpx  #$28
      bcc  WF01B
WF000:
      lda  #$80
      sta  $60
      lda  #$EF
      and  $D015
      sta  $D015
      lda  #$00
      sta  $1A
      sta  $D40E
      sta  $D40F
      sta  $39
      sta  $3A
      rts
WF01B:
      lda  #$F6
      sta  $07FC
WF020:
      txa
      clc
      adc  #$18
      sta  $D008
      lda  $3A
      adc  #$00
      beq  WF034
      lda  #$10
      ora  $D010
      bne  WF039
WF034:
      lda  #$EF
      and  $D010
WF039:
      sta  $D010
      rts
WF03D:
      sed
      clc
      adc  $24
      sta  $24
      lda  $25
      adc  #$00
      sta  $25
      cld
      beq  WF05D
      lda  $24
      cmp  #$50
      bcc  WF05D
      ldx  $23
      bne  WF05D
      inc  $3D
      jsr  WE79F
      sta  $23
WF05D:
      lda  $26
      bne  WF088
      ldx  #$0C
      lda  $06
      beq  WF06F
      ldx  #$06
      lda  $28
      beq  WF06F
      ldx  #$21
WF06F:
      lda  $25
      jsr  WF076
      lda  $24
WF076:
      pha
      lsr
      lsr
      lsr
      lsr
      jsr  WF081
      pla
      and  #$0F
WF081:
      clc
      adc  #$76
      sta  $0400,x
      inx
WF088:
      rts
      lda  #$06
      sta  $64
      lda  $3E
      beq  WF095
      dec  $3E
      bpl  WF0A1
WF095:
      lda  $1C
      ora  $1D
      ora  $1E
      beq  WF0AC
      lda  #$02
      sta  $3E
WF0A1:
      lda  $3E
      and  #$01
      clc
      adc  #$F9
      sta  $07FD
      rts
WF0AC:
      lda  #$DF
      and  $D015
      sta  $D015
      lda  $26
      beq  WF0BC
      and  #$01
      sta  $3D
WF0BC:
      lda  $3D			; dec $3D ?Reduce number of lives
      lda  $07
      bne  WF106
WF0C2:
      jsr  WE79F
      ldx  #$09
WF0C7:
      lda  WF410,x
      sta  $5C,x
      dex
      bpl  WF0C7
      lda  $39
      bne  WF0DB
      lda  $3A
      bne  WF0DB
      lda  #$80
      sta  $60
WF0DB:
      ldx  #$01
      stx  $34
      ldx  #$00
      stx  $35
      lda  #$F8
      sta  $07FD
      lda  #$00
      sta  $18
      sta  $19
      lda  #$80
      sta  $D406
      lda  #$F0
      sta  $D417
      jsr  WE5F0
      lda  $2C
      cmp  #$08
      bcs  WF105
      lda  #$80
      sta  $63
WF105:
      rts
WF106:
      ldx  $3D
      beq  WF0C2
      lda  #$00
      sta  $0C
      lda  #$08
      ldy  $28
      beq  WF116
      lda  #$0C
WF116:
      sta  $0D
      ldy  #$0C
WF11A:
      lda  $0000,y
      sta  ($0C),y
      iny
      bne  WF11A
      inc  $0D
WF124:
      lda  $01C0,y
      sta  ($0C),y
      iny
      bne  WF124
      lda  #$05
      sta  $97
      inc  $0D
      ldx  $90
WF134:
      lda  WF30B,x
      sta  $0E
      lda  WF324,x
      sta  $0F
      ldy  #$27
WF140:
      lda  ($0E),y
      sta  ($0C),y
      dey
      bpl  WF140
      inx
      inx
      lda  $0C
      clc
      adc  #$50
      sta  $0C
      bcc  WF154
      inc  $0D
WF154:
      dec  $97
      bne  WF134
WF158:
      lda  $28
      tax
      eor  #$01
      sta  $28
      lda  #$03
      sta  $69
      lda  $24
      sta  $08,x
      lda  $25
      sta  $0A,x
      lda  #$00
      jmp  WE4E2
WF170:
      jsr  WE2BC
      lda  #$00
      sta  $0C
      lda  #$08
      ldy  $28
      beq  WF17F
      lda  #$0C
WF17F:
      sta  $0D
      ldy  #$0C
WF183:
      lda  ($0C),y
      sta  $0000,y
      iny
      bne  WF183
      lda  $27
      bne  WF193
      jsr  WE7EF
      iny
WF193:
      inc  $0D
WF195:
      lda  ($0C),y
      sta  $01C0,y
      iny
      bne  WF195
      lda  #$05
      sta  $97
      inc  $0D
      ldx  $90
WF1A5:
      lda  WF30B,x
      sta  $0E
      lda  WF324,x
      sta  $0F
      ldy  #$27
WF1B1:
      lda  ($0C),y
      sta  ($0E),y
      dey
      bpl  WF1B1
      inx
      inx
      lda  $0C
      clc
      adc  #$50
      sta  $0C
      bcc  WF1C5
      inc  $0D
WF1C5:
      dec  $97
      bne  WF1A5
      jsr  WE0E4
      jsr  WE0F7
      jsr  WE800
      jsr  WF05D
      jsr  WE816
      lda  $39
      bne  WF1E3
      lda  $3A
      bne  WF1E3
      jmp  WF0C2
WF1E3:
      lda  #$41
      sta  $D412
WF1E8:
      jmp  WF0C2
      .byte $00, $00, $01, $07, $07, $03, $01, $03
      .byte $18, $7E, $FF, $99, $FF, $FF, $99, $66
      .byte $00, $00, $80, $E0, $E0, $C0, $80, $C0
      .byte $00, $00, $01, $07, $07, $01, $06, $01
      .byte $18, $7E, $FF, $99, $FF, $99, $00, $81
      .byte $00, $00, $80, $E0, $E0, $80, $60, $80
      .byte $01, $18, $19, $1F, $07, $01, $01, $06
      .byte $80, $41, $FF, $3E, $FF, $FF, $80, $00
      .byte $C0, $0C, $CC, $7C, $F0, $C0, $40, $30
      .byte $01, $00, $01, $07, $1F, $19, $19, $00
      .byte $80, $41, $FF, $3E, $FF, $FF, $80, $C1
      .byte $C0, $00, $C0, $70, $FC, $CC, $4C, $80
      .byte $00, $07, $1F, $1E, $1F, $07, $0E, $07
      .byte $7E, $FF, $FF, $3C, $FF, $C3, $3C, $00
      .byte $00, $E0, $F8, $78, $F8, $E0, $70, $E0
      .byte $00, $0F, $1F, $1E, $1F, $07, $1C, $30
      .byte $7E, $FF, $FF, $3C, $FF, $C3, $3C, $00
      .byte $00, $F0, $F8, $78, $F8, $E0, $38
WF27A:
      .byte $0C, $00, $00, $01, $07, $07, $01, $06
      .byte $01, $18, $7E, $FF, $99, $FF, $99, $00
      .byte $81, $00, $00, $80, $E0, $E0, $80, $60
      .byte $80, $00, $00, $01, $07, $07, $03, $01
      .byte $03, $18, $7E, $FF, $99, $FF, $FF, $99
      .byte $66, $00, $00, $80, $E0, $E0, $C0, $80
      .byte $C0, $01, $00, $01, $07, $1F, $19, $19
      .byte $00, $80, $41, $FF, $3E, $FF, $FF, $80
      .byte $C1, $C0, $00, $C0, $70, $FC, $CC, $4C
      .byte $80, $01, $18, $19, $1F, $07, $01, $01
      .byte $06, $80, $41, $FF, $3E, $FF, $FF, $80
      .byte $00, $C0, $0C, $CC, $7C, $F0, $C0, $40
      .byte $30, $00, $0F, $1F, $1E, $1F, $07, $1C
      .byte $30, $7E, $FF, $FF, $3C, $FF, $C3, $3C
      .byte $00, $00, $F0, $F8, $78, $F8, $E0, $38
      .byte $0C, $00, $07, $1F, $1E, $1F, $07, $0E
      .byte $07, $7E, $FF, $FF, $3C, $FF, $C3, $3C
      .byte $00, $00, $E0, $F8, $78, $F8, $E0, $70
      .byte $E0
WF30B:
      .byte $00, $28, $50, $78, $A0, $C8, $F0, $18
      .byte $40, $68, $90, $B8, $E0, $08, $30, $58
      .byte $80, $A8, $D0, $F8, $20, $48, $70, $98
      .byte $C0
WF324:
      .byte $04, $04, $04, $04, $04, $04, $04, $05
      .byte $05, $05, $05, $05, $05, $06, $06, $06
      .byte $06, $06, $06, $06, $07, $07, $07, $07
      .byte $07
WF33D:
      .byte $02, $04, $06, $08, $09, $0A, $0B, $0B
      .byte $0B
WF346:
      .byte $89, $22, $7E, $FF, $FF, $7E, $24, $91
WF34E:
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $44, $11, $3F, $7F, $7F, $3F, $12, $48
      .byte $80, $00, $00, $80, $80, $00, $00, $80
      .byte $22, $08, $1F, $3F, $3F, $1F, $09, $24
      .byte $40, $80, $80, $C0, $C0, $80, $00, $40
      .byte $11, $04, $0F, $1F, $1F, $0F, $04, $12
      .byte $20, $40, $C0, $E0, $E0, $C0, $80, $20
      .byte $08, $02, $07, $0F, $0F, $07, $02, $09
      .byte $90, $20, $E0, $F0, $F0, $E0, $40, $10
      .byte $04, $01, $03, $07, $07, $03, $01, $04
      .byte $48, $10, $F0, $F8, $F8, $F0, $20, $88
      .byte $02, $00, $01
WF3A9:
      .byte $03, $03, $01, $00, $02, $24, $88, $F8
      .byte $FC, $FC, $F8, $90, $44, $01, $00, $00
      .byte $01, $01, $00, $00, $01, $12, $44, $FC
      .byte $FE, $FE, $FC, $48, $22, $38, $78, $BC
      .byte $78, $B8, $7C, $B8, $54, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $0E, $1E, $2F
      .byte $1E, $2E, $1F, $2E, $15, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $03, $07, $0B
      .byte $07, $0B, $07, $0B, $05, $80, $80, $C0
      .byte $80, $80, $C0, $80, $40, $00, $01, $02
      .byte $01, $02, $01, $02, $01, $E0, $E0, $F0
      .byte $E0, $E0, $F0, $E0, $50
WF406:
      .byte $64, $64, $00, $64, $80, $64, $63, $7F
      .byte $80, $41
WF410:
      .byte $7F, $5B, $58, $5A, $3C, $5A, $59, $61
      .byte $80, $3C
WF41A:
      .byte $00, $28, $01, $29
WF41E:
      .byte $D1, $DD, $38, $22, $89, $4D, $4F, $49
      .byte $89, $0C, $D7, $8A, $08, $6A
WF42C:
      .byte $ED, $E9, $E8, $E9, $EF, $E9, $ED, $EF
      .byte $F0, $E5, $E2, $E3, $E4, $E4, $FF, $FF
WF43C:
      .byte $06, $07, $08, $09, $2E, $2F, $30, $31
      .byte $0E, $0F, $10, $11, $36, $37, $38, $39
      .byte $16, $17, $18, $19, $3E, $3F, $40, $41
      .byte $1E, $1F, $20, $21, $46, $47, $48
WF45B:
      .byte $49, $03, $00, $01, $01, $02, $01, $00
      .byte $00, $01, $01, $02, $00, $00, $01, $01
WF46B:
      .byte $05, $10, $15, $30
WF46F:
      .byte $5F, $59, $65, $5D, $58, $67, $6E, $5D
      .byte $6A, $58, $68, $64, $59, $71, $5D, $6A
      .byte $58
WF480:
      .byte $68, $64, $59, $71, $58, $68, $64, $59
      .byte $71, $5D, $6A, $58, $77
WF48D:
      .byte $1E, $58, $58, $58, $58, $58, $6B, $5B
      .byte $67, $6A, $5D, $58, $76, $76, $76, $76
      .byte $76, $58, $60, $61, $58, $76, $76, $76
      .byte $76, $76, $58, $58, $58, $58, $58, $58
      .byte $58, $58, $58, $58, $58, $58, $58, $58
WF4B5:
      .byte $1E, $58, $58, $1D, $77, $58, $76, $76
      .byte $76, $76, $76, $58, $60, $61, $58, $76
      .byte $76, $76, $76, $76, $58, $58, $58, $58
      .byte $58, $58, $58, $58, $58, $58, $1D, $78
      .byte $58, $76, $76, $76, $76, $76, $58, $58
WF4DD:
      .byte $0D, $0D, $0D, $01, $01, $01, $01, $01
      .byte $01, $01, $01, $01, $07, $07, $07, $07
      .byte $07, $07, $07, $07, $0E, $0E, $0E, $0E
      .byte $0E, $0E, $0E, $0E, $0E, $0E, $01, $01
      .byte $01, $01, $01, $01, $01, $01, $01, $01
WF505:
      .byte $0D, $0D, $0D, $01, $01, $01, $01, $01
      .byte $01, $01, $01, $01, $01, $01, $01, $01
      .byte $01, $01, $07, $07, $07, $07, $07, $07
      .byte $07, $07, $0E, $0E, $0E, $0E, $0E, $0E
      .byte $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
WF52D:
      .byte $01, $01, $08, $08, $08, $04, $04, $04
      .byte $0E, $0E, $0E, $0E, $05, $05, $05, $05
      .byte $07, $07, $07, $07, $02, $02, $02, $02
      .byte $03, $03
WF547:
      .byte $01, $01, $01, $07, $04, $0E
WF54D:
      .byte $05, $05, $0A, $08, $0B
WF552:
      .byte $09, $06
WF554:
      .byte $02, $01, $04, $01, $0B, $09, $09, $0B
      .byte $01, $09, $01, $07, $06, $0A, $01, $09
      .byte $04, $0B, $07, $0A, $06, $01, $06, $01
      .byte $06, $06, $0A, $05, $03, $09, $01, $06
      .byte $02, $09, $0A, $07, $01, $01, $02, $0A
      .byte $01, $01, $02, $0B, $06, $0A, $0B, $0A
      .byte $09, $05, $03, $0B, $05, $08, $01, $0B
      .byte $07, $05, $0B, $05, $01, $08, $0B, $0B
      .byte $01, $07, $02, $06, $01, $0A, $0B, $04
      .byte $02, $01, $09, $0A, $05, $0A, $0B, $01
      .byte $0B, $0A, $04, $01, $06, $0B, $01, $08
      .byte $01, $02, $0B, $0A, $0B, $04, $09, $04
      .byte $0A, $0A, $0B, $0A, $03, $0B, $01, $09
      .byte $0B, $06, $04, $0A, $06, $04, $02, $02
      .byte $09, $0B, $03, $05, $02, $03, $07, $0B
      .byte $02, $05, $0B, $06, $08, $0B, $08, $01
      .byte $0A, $07, $02, $0B, $01, $01, $06, $08
      .byte $01, $08, $09, $0B, $01, $0B, $0A, $0B
      .byte $03, $09, $06, $01, $0A, $0A, $02, $04
      .byte $0A, $0B, $09, $02, $07, $08, $04, $01
      .byte $0B, $06, $02, $0B, $02, $0A, $0A, $0B
      .byte $0B, $08, $07, $0B, $09, $03, $02, $0B
      .byte $01, $0B, $01, $05, $01, $01, $06, $03
      .byte $04, $03, $02, $0B, $0B, $08, $01, $0B
      .byte $01, $06, $0A, $03, $08, $01, $0A, $02
      .byte $07, $07, $06, $01, $05, $05, $09, $01
      .byte $01, $07, $07, $0B, $0A, $04, $08, $01
      .byte $01, $07, $0B, $02, $0B, $0A, $0A, $08
      .byte $06, $02, $08, $06, $0B, $01, $06, $0A
      .byte $0B, $09, $0B, $07, $02, $0A, $0B, $02
      .byte $07, $0B, $02, $0B, $0B, $01, $04, $08
      .byte $0A
WF64D:
      .byte $F0
WF64E:
      .byte $0C
WF64F:
      .byte $04, $FE, $00, $16, $17, $58, $77, $7F
      .byte $7E, $79, $58, $5B, $67, $65, $65, $67
      .byte $5C, $67, $6A, $5D, $F0, $09, $07, $FE
      .byte $00, $73, $58, $6B, $5B, $67, $6A, $5D
      .byte $58, $59, $5C, $6E, $59, $66, $5B, $5D
      .byte $58, $6C, $59, $5A, $64, $5D, $58, $73
      .byte $F0, $0C, $0A, $18, $19, $1A, $F0, $0C
      .byte $0C, $29, $2A, $2B, $F0, $0C, $0E, $2F
      .byte $30, $31, $F0, $0C, $10, $35, $36, $37
      .byte $F0, $10, $0A, $FE, $0A, $74, $58, $58
      .byte $65, $71, $6B, $6C, $5D, $6A, $71, $F0
      .byte $10, $0C, $74, $58, $79, $76, $58, $68
      .byte $67, $61, $66, $6C, $6B, $F0, $10, $0E
      .byte $74, $58, $78, $76, $58, $68, $67, $61
      .byte $66, $6C, $6B, $F0, $10, $10, $74, $58
      .byte $77, $76, $58, $68, $67, $61, $66, $6C
      .byte $6B, $F0, $05, $13, $6C, $67, $68, $58
      .byte $77, $7B, $76, $76, $58, $68, $67, $61
      .byte $66, $6C, $6B, $58, $5E, $67, $6A, $58
      .byte $5D, $70, $6C, $6A, $59, $58, $5A, $59
      .byte $6B, $5D, $75, $FE, $78, $58, $FF
WF6F6:
      .byte $00, $03, $0F, $1F, $3F, $7F, $7F, $FF
      .byte $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF
      .byte $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF
      .byte $00, $C0, $F0, $F8, $FC, $FE, $FE, $FF
      .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
      .byte $FF, $FF, $FF, $F8, $E0, $C0, $C0, $C0
      .byte $FF, $FF, $FF, $1F, $07, $03, $03, $03
      .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
WF736:
      .byte $58, $6B, $6C, $59, $6A, $6C, $58, $5F
      .byte $59, $65, $5D, $58, $58, $58, $58
WF745:
      .byte $67, $66, $5D, $58, $68, $64, $59, $71
      .byte $5D, $6A, $58, $58, $58, $58, $58, $64
      .byte $5D, $6E, $5D, $64, $58, $77, $58, $58
      .byte $58, $58
WF75F:
      .byte $6C, $6F, $67, $58, $68, $64, $59, $71
      .byte $5D, $6A, $6B
WF76A:
      .byte $35
WF76B:
      .byte $07, $6C, $06, $B9, $05, $67, $05
WF772:
      .byte $AC
WF773:
      .byte $39, $1A, $3D, $BC, $40, $95, $44, $A9
      .byte $48, $FC, $4C, $A1, $51, $FC, $4C, $A9
      .byte $48, $95, $44, $BC, $40, $1A, $3D
WF78A:
      .byte $95
WF78B:
      .byte $44, $61, $33, $34, $2B, $4B, $22, $5E
      .byte $20, $D6, $1C, $B1, $19, $E3, $16, $9A
      .byte $15, $3F, $13, $25, $11, $25, $11
WF7A2:
      .byte $01, $02, $04, $08, $10, $20, $40, $80
WF7AA:
      .byte $FE, $FD, $FB, $F7, $EF, $DF, $BF, $7F
WF7B2:
      .byte $00, $02, $04, $06, $08, $10, $20, $40
      .byte $80
WF7BB:
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $38, $6C, $C6, $C6, $FE, $C6, $C6, $00
      .byte $FC, $66, $66, $7C, $66, $66, $FC, $00
      .byte $3C, $66, $C0, $C0, $C0, $66, $3C, $00
      .byte $F8, $64, $66, $66, $66, $64, $F8, $00
      .byte $FE, $60, $60, $7C, $60, $60, $FE, $00
      .byte $FE, $60, $60, $7C, $60, $60, $F0, $00
      .byte $3C, $66, $C0, $DE, $C6, $66, $3C, $00
WF7FB:
      .byte $C6, $C6, $C6, $FE, $C6, $C6, $C6, $00
      .byte $3C, $18, $18, $18, $18, $18, $3C, $00
      .byte $1E, $0C, $0C, $0C, $CC, $CC, $78, $00
      .byte $C6, $CC, $D8, $F0, $D8, $CC, $C6, $00
      .byte $F0, $60, $60, $60, $60, $60, $FE, $00
      .byte $C6, $EE, $FE, $D6, $C6, $C6, $C6, $00
      .byte $C6, $E6, $F6, $DE, $CE, $C6, $C6, $00
      .byte $7C, $EE, $C6, $C6, $C6, $EE, $7C, $00
      .byte $FC, $66, $66, $7C, $60, $60, $F0, $00
      .byte $00, $18, $18, $00, $18, $18, $30, $00
      .byte $FC, $C6, $C6, $FC, $D8, $CC, $C6, $00
      .byte $7C, $C6, $C0, $7C, $06, $C6, $7C, $00
      .byte $7E, $18, $18, $18, $18, $18, $18, $00
      .byte $C6, $C6, $C6, $C6, $C6, $C6, $7C, $00
      .byte $C6, $C6, $C6, $6C, $6C, $38, $38, $00
      .byte $C6, $C6, $C6, $D6, $FE, $EE, $C6, $00
      .byte $C6, $C6, $6C, $38, $6C, $C6, $C6, $00
      .byte $C6, $C6, $6C, $3C, $18, $18, $18, $00
      .byte $C0, $F0, $F8, $FC, $B6, $FF, $1C, $08
      .byte $10, $54, $38, $FE, $38, $54, $10, $00
      .byte $00, $00, $00, $7E, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $18, $18, $00
      .byte $7C, $C6, $C6, $C6, $C6, $C6, $7C, $00
      .byte $18, $38, $18, $18, $18, $18, $3C, $00
      .byte $7C, $C6, $C6, $0C, $38, $E0, $FE, $00
      .byte $7C, $C6, $06, $1C, $06, $C6, $7C, $00
      .byte $0C, $1C, $2C, $4C, $FE, $0C, $0C, $00
      .byte $FE, $C0, $C0, $FC, $06, $C6, $7C, $00
      .byte $1C, $30, $60, $FC, $C6, $C6, $7C, $00
      .byte $7E, $C6, $0C, $18, $18, $18, $18, $00
      .byte $7C, $C6, $C6, $7C, $C6, $C6, $7C, $00
      .byte $7C, $C6, $C6, $7E, $06, $0C, $38, $00
WF8FB:
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $01, $03, $07
      .byte $00, $03, $0F, $3F, $FF, $FF, $FF, $FF
      .byte $7F, $FF, $FF, $FF, $FF, $FF, $FF, $FF
      .byte $E0, $FC, $FF, $FF, $FF, $FF, $FF, $FF
      .byte $0F, $0F, $1F, $1F, $3F, $3F, $7F, $7F
      .byte $FF, $FF, $FF, $FF, $FF, $FE, $FC, $F8
      .byte $FF, $FF, $F8, $C0, $00, $00, $00, $00
      .byte $FF, $FF, $1F, $03, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $FF, $FF, $FF, $FF
      .byte $00, $00, $00, $00, $F0, $E0, $C0, $80
      .byte $7F, $FF, $FF, $FF, $FF, $FF, $FF, $FF
      .byte $F0, $F0, $E0, $E0, $C0, $C0, $C0, $C0
      .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00
      .byte $FF, $FE, $FC, $F8, $F0, $E0, $C0, $00
WF973:
      .byte $1F, $38, $73, $66, $66, $73, $38, $1F
      .byte $F8, $1C, $CE, $06, $06, $CE, $1C, $F8
      .byte $00, $00, $01, $03, $06, $0F, $01, $00
      .byte $3C, $FF, $FF, $FF, $66, $FF, $E7, $C3
      .byte $00, $00, $80, $C0, $60, $F0, $80, $00
      .byte $03, $07, $07, $7F, $FF, $FF, $FF, $FF
      .byte $00, $80, $80, $F8, $FC, $FC, $FC, $FC
      .byte $6C, $FE, $6C, $6C, $6C, $FE, $6C, $00
      .byte $F8, $FE, $FE, $FE, $C7, $C0, $C0, $00
      .byte $01, $00, $41, $00, $01, $FE, $FF, $FE
      .byte $FF, $FE, $FF, $FE, $FF, $66, $FF, $66
      .byte $67, $E6, $67, $FE, $FF, $FE, $FF, $FE
      .byte $FF, $FE, $FF, $FE, $FF, $F6, $77, $66
      .byte $77, $76, $67, $FE, $7F, $00, $01, $00
      .byte $01, $00, $01, $00, $01, $00, $01, $00
      .byte $01, $00, $01, $F6, $01, $00, $01, $00
      .byte $01, $00, $01, $00, $01, $00, $01, $00
      .byte $01, $00, $FF, $76, $F7, $BF, $FE, $FF
      .byte $FF, $FF, $FE, $FF, $FE, $FF, $FE, $FF
      .byte $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF
      .byte $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF
      .byte $FE, $FF, $FE, $FF, $FE, $01, $00, $01
      .byte $00, $01, $00, $01, $00, $01, $00, $01
      .byte $00, $01, $00, $01, $00, $01, $00, $01
      .byte $00, $01, $00, $01, $00, $01, $00, $01
      .byte $00, $01, $40, $01, $01, $08, $00, $00
      .byte $1C, $00, $00, $3E, $00, $00, $77, $00
      .byte $00, $E3, $98, $31, $C1, $98, $33, $C1
      .byte $98, $33, $C1, $98, $33, $FF, $98, $33
      .byte $FF, $98, $33, $C1, $98, $33, $C1, $9C
      .byte $73, $C1, $8E, $E3, $C1, $87, $C3, $C1
      .byte $83, $83, $C1, $81, $01, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $F8, $DC, $0E, $FC, $FE, $1F, $0C
      .byte $E7, $39, $0C, $C3, $30, $0C, $C3, $30
      .byte $FC, $C3, $30, $F8, $C3, $30, $00, $C3
      .byte $30, $00, $C3, $30, $0C, $C3, $39, $FC
      .byte $C3, $1F, $F8, $C3, $0E, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $18, $00, $00
      .byte $1F, $00, $00, $07, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $C7, $E3, $70, $CF, $F3, $F8, $CC
      .byte $33, $8C, $CC, $33, $0C, $CC, $33, $00
      .byte $CF, $F3, $00, $CF, $E3, $00, $CC, $03
      .byte $00, $CC, $03, $00, $CC, $33, $00, $CF
      .byte $E3, $00, $C7, $E0, $00, $C0, $00, $00
      .byte $C0, $00, $00, $C0, $00, $00, $C0, $00
      .byte $00, $00, $00, $00, $00, $30, $00, $00
      .byte $60, $00, $00, $C0, $00, $00, $60, $00
      .byte $00, $30, $00, $00, $60, $00, $00, $C0
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $C0, $00, $00
      .byte $60, $00, $00, $30, $00, $00, $60, $00
      .byte $00, $C0, $00, $00, $60, $00, $00, $30
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $60, $00, $00
      .byte $60, $00, $00, $60, $00, $00, $60, $00
      .byte $00, $60, $00, $00, $F0, $00, $00, $60
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $60, $00, $00
      .byte $F0, $00, $00, $60, $00, $00, $60, $00
      .byte $00, $60, $00, $00, $60, $00, $00, $60
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $60, $00, $00
      .byte $60, $00, $00, $E0, $00, $00, $70, $00
      .byte $00, $60, $00, $00, $60, $00, $00, $60
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $60, $00, $00
      .byte $60, $00, $00, $70, $00, $00, $E0, $00
      .byte $00, $60, $00, $00, $60, $00, $00, $60
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $C0, $00, $00
      .byte $C0, $00, $00, $C0, $00, $00, $C0, $00
      .byte $00, $C0, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $38, $00, $00
      .byte $78, $00, $00, $BC, $00, $00, $78, $00
      .byte $00, $B8, $00, $00, $7C, $00, $00, $B8
      .byte $00, $00, $54, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $89, $00, $00
      .byte $22, $00, $00, $7E, $00, $00, $FF, $00
      .byte $00, $FF, $00, $00, $7E, $00, $00, $24
      .byte $00, $00, $91, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $08, $80, $00
      .byte $45, $10, $00, $20, $20, $00, $10, $40
      .byte $00, $C0, $18, $00, $10, $40, $00, $25
      .byte $20, $00, $48, $90, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $01, $F0, $00
      .byte $03, $F8, $00, $0F, $FE, $00, $1F, $FF
      .byte $00, $3F, $FF, $80, $73, $19, $C0, $FF
      .byte $FF, $E0, $1E, $0F, $00, $0C, $06, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $14, $52, $00
      .byte $49, $84, $00, $07, $E1, $00, $5F, $F0
      .byte $00, $8F, $F6, $00, $57, $E1, $00, $04
      .byte $88, $00, $21, $22, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $03, $00, $00
      .byte $07, $80, $00, $07, $80, $00, $7F, $F8
      .byte $00, $FF, $FC, $00, $FF, $FC, $00, $FF
      .byte $FC, $00, $FF, $FC, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $48, $88, $00
      .byte $12, $50, $00, $45, $00, $00, $11, $40
      .byte $00, $28, $80, $00, $0D, $40, $00, $7B
      .byte $E0, $00, $FF, $F8, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $00, $00, $00
      .byte $01, $00, $00, $08, $40, $00, $04, $00
      .byte $00, $20, $50, $00, $1F, $C0, $00, $7F
      .byte $E0, $00, $FF, $F8, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $0F, $E7, $C0
      .byte $0C, $0C, $60, $0C, $0C, $E0, $0F, $CD
      .byte $60, $00, $6E, $60, $0C, $6C, $60, $07
      .byte $C7, $C0, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $18, $7C, $7C
      .byte $38, $C6, $C6, $18, $CE, $CE, $18, $D6
      .byte $D6, $18, $E6, $E6, $18, $C6, $C6, $3C
      .byte $7C, $7C, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $18, $FE, $7C
      .byte $38, $C0, $C6, $18, $C0, $CE, $18, $FC
      .byte $D6, $18, $06, $E6, $18, $C6, $C6, $3C
      .byte $7C, $7C, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $7C, $7C, $7C
      .byte $C6, $C6, $C6, $06, $CE, $CE, $1C, $D6
      .byte $D6, $06, $E6, $E6, $C6, $C6, $C6, $7C
      .byte $7C, $7C, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AA, $FE, $FF, $FE
      .byte $FF, $FE, $FF, $FE, $FF, $66, $FF, $66
      .byte $67, $66, $67, $FE, $FF, $FE, $FF, $FE
      .byte $FF, $FE, $FF, $FE, $FF, $F6, $77, $76
      .byte $77, $F6, $77, $FE, $7F, $00, $01, $00
      .byte $01, $00, $01, $00, $01, $00, $01, $00
      .byte $01, $00, $01, $F6, $01, $00, $01, $00
      .byte $01, $00, $01, $00, $01, $00, $01, $3C
      .byte $E0, $35, $E0, $00, $E0
