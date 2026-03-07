;=================================================================================
; Gorf (1983, Commodore)
; Source in Dasm format
; To compile
;	a) dasm gorf.asm -ogorf.bin -f3
;	b) cartconv -t normal -i gorf.bin -o gorf.crt
;=================================================================================
      processor 6502
      .org $8000

      .word $8009			; Coldstart
      .word $804B			; Warmstart
       
      .byte $C3, $C2, $CD, "80"		; CBM80
               
      sei                               
      lda  #$57                         
      sta  $01                          ; 6510 I/O register
      lda  #$2F                         
      sta  $00                          
      lda  #$B0                         
      sta  $0314                        ; Vector: Hardware Interrupt (IRQ)
      lda  #$A0                         
      sta  $0315                        ; Vector: Hardware Interrupt (IRQ)
      ldx  #$02                         
W801E:
      lda  W8139,x                      
      sta  $3F47,x                      
      dex                               
      bpl  W801E                        
      lda  #$47                         
      sta  $0318                        ; Vector: Not maskerable Interrupt (NMI)
      lda  #$3F                         
      sta  $0319                        ; Vector: Not maskerable Interrupt (NMI)
      ldx  #$0B                         
      lda  #$00                         
      sta  $0209                        
W8038:
      sta  $B1,x                        
      dex                               
      bpl  W8038                        
      ldx  #$08                         
W803F:
      lda  W8255,x                      
      sta  $0200,x                      
      dex                               
      bpl  W803F                        
      jsr  WA7B0                        
W804B:
      lda  $AB                          
      bne  W8052                        
      jsr  $C003                        
W8052:
      sei                               
      ldx  #$FF                         
      txs                               
      jsr  $FF84                        
      lda  #$7F                         
      sta  $DC0D                        ; Interrupt control register CIA #1
      lda  $DC0D                        ; Interrupt control register CIA #1
      lda  #$92                         
      sta  $DD00                        ; Data port A #2: serial bus, RS-232, VIC memory
      lda  #$53                         
      sta  $01                          ; 6510 I/O register
      ldy  #$00                         
      sty  $DC0E                        ; Control register A of CIA #1
W806F:
      lda  WB7F6,y                      
      sta  $4800,y                      
      lda  WB8F6,y                      
      sta  $4900,y                      
      lda  $D000,y                      ; Position X sprite 0
      sta  $4A00,y                      
      lda  $D100,y                      
      sta  $4B00,y                      
      dey                               
      bne  W806F                        
      tya                               
      ldx  #$07                         
W808D:
      sta  $4A00,x                      
      dex                               
      bpl  W808D                        
      lda  #$57                         
      sta  $01
      jsr  W813C                        
      jmp  WA3F6                      
W809D:
      jsr  W813C                        
      jsr  W8196                      
      lda  #$00                         
      sta  $AC                          
W80A7:
      lda  $D012                        
      cmp  #$F8                         
      bcs  W80BB                        
      ldx  $AB                          
      bne  W80A7                        
      jsr  $C006                        
      bpl  W80A7                        
      cmp  $06                          
      bcs  W80A7                        
W80BB:
      lda  $D01E                        ; Animations contact
      sta  $0F                          
      lda  $D01F                        
      sta  $10                          
      inc  $05                          
      lda  $05                          
      and  #$07                         
      sta  $05                          
      dec  $08                          
      dec  $04                          
      dec  $02                          
      bne  W80EC                        
      dec  $03                          
      lda  $AC                          
      bpl  W80F9                        
      dec  $AD                          
      bne  W80EC                        
      lda  #$05                         
      sta  $AD                          
      lda  $0C                          
      cmp  #$03                         
      bne  W8118                        
      jmp  WA3F6                      
W80EC:
      lda  $AC                          
      bpl  W80F9                        
      jsr  W9B1F                        
      lda  $36                          
      bmi  W809D                        
      bpl  W8104                        
W80F9:
      lda  $C0                          
      bpl  W8104                        
      lda  $09                          
      bpl  W8104                        
      jmp  WA5A4                        
W8104:
      jsr  W926D                        
      jsr  W838C                      
      jsr  W8486                        
      jsr  W811E                        
      lda  $31                          
      bpl  W80A7                        
      lda  $09                          
      bpl  W80A7                        
W8118:
      jsr  W8196                      
      jmp  W80A7                        
W811E:
      ldy  $0C                          
W8120:
      lda  W8129,y                      
      pha                               
      lda  W8131,y                    
      pha                               
      rts                               
W8129:
      .byte $85, $89, $8C, $8E, $84, $88, $8C, $8E
W8131:
      .byte $4B, $24, $B9, $95, $C1, $C4, $77, $42                        
W8139:
      jmp  W804B                        
W813C:
      sei                               
      jsr  W9BA1                        
      jsr  W9A49                    
      stx  $0C                          
      lda  #$05                         
      sta  $C0                          
      inx                               
      stx  $B1                          
      stx  $B2                          
      stx  $B3                          
      stx  $0D                          
      stx  $A4                          
      stx  $EB                          
      stx  $EC                          
      stx  $FF                          
      stx  $FE                          
      stx  $F5                          
      stx  $FA                          
      ldx  #$18                         
W8162:
      sta  $D400,x                      
      dex                               
      bpl  W8162                        
      ldx  #$0F                         
      ldy  #$1F                         
W816C:
      lda  #$00                         
      sta  $00C9,y                      
      dey                               
      lda  W8186,x                      
      sta  $00C9,y                      
      dey                               
      dex                               
      bpl  W816C                        
      lda  #$D4                         
      sta  $C8                          
      lda  #$DF                         
      sta  $D418                        
      rts                               
W8186:                                  
      .byte $C3, $C5, $C4, $C6, $E9, $EA, $EB, $EC
      .byte $ED, $EF, $F1, $F3, $EE, $F0, $F2, $F4
W8196:
      sei                               
W8197:
      lda  $D012                        
      cmp  #$FF                         
      bne  W8197                        
      lda  #$0B                         
      sta  $D011                        
      sed                               
      lda  $0D                          
      clc                               
      adc  #$01                         
      sta  $0D                          
      cld                               
      jsr  W8217                        
      ldy  $0C                          
      iny                               
      cpy  #$04                         
      bne  W81C0                        
      ldy  #$00                         
      lda  $A4                          
      cmp  #$05                         
      beq  W81C0                        
      inc  $A4                          
W81C0:
      sty  $0C                          
      lda  W825E,y                      
      sta  $31                          
      lda  W8262,y                      
      sta  $06                          
      lda  W8266,y                      
      tax                               
      ldy  #$2E                         
W81D2:
      lda  W826A,x                      
      sta  $D000,y                      
      dex                               
      dey                               
      bpl  W81D2                        
      ldx  #$04                         
W81DE:
      sty  $96,x                        
      dex                               
      bpl  W81DE                        
      stx  $09                          
      stx  $0A                          
      stx  $0B                          
      stx  $32                          
      inx                               
      stx  $FE                          
      lda  #$40                         
      sta  $43F8                        
      lda  #$61                         
      sta  $43F9                        
      lda  $0C                          
      clc                               
      adc  #$04                         
      tay                               
      jsr  W8120                        
      jsr  W9CB3                      
      jsr  WA7F2                        
      lda  $D011                        
      ora  #$10                         
      sta  $D011                        
      lda  $D01E                        
      lda  $D01F                        
      cli                               
      rts                               
W8217:
      ldx  #$08                         
      lda  #$58                         
      sta  $1E                          
      lda  #$00                         
      tay                               
      sta  $1D                          
W8222:
      sta  ($1D),y                      
      dey                               
      bne  W8222                        
      dec  $1E                          
      dex                               
      bpl  W8222                        
      clc                               
      inc  $1E                          
      ldx  #$21                         
W8231:
      lda  W8326,x                      
      sta  $1B                          
      lda  W8348,x                      
      sta  $1C                          
      ldy  W836A,x                      
W823E:
      lda  ($1B),y                      
      sta  ($1D),y                      
      dey                               
      bpl  W823E                        
      lda  $1D                          
      adc  #$40                         
      sta  $1D                          
      lda  $1E                          
      adc  #$00                         
      sta  $1E                          
      dex                               
      bpl  W8231                        
      rts                               
W8255:                                  
      .byte $43, $4D, $45, $4D, $42, $43, $42, $4A
      .byte $4D
W825E:
      .byte $17, $09, $10, $00
W8262:                                  
      .byte $0B, $29, $11, $19
W8266:
      .byte $2E, $5D, $8C, $BB
W826A:
      .byte $AA, $DA, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $51, $45
      .byte $80, $0B, $60, $00, $00, $81, $D8, $81
      .byte $02, $00, $01, $00, $F1, $00, $00, $00
      .byte $06, $06, $01, $00, $00, $07, $02, $02
      .byte $01, $01, $01, $06, $00, $00, $00, $40
      .byte $60, $58, $60, $70, $60, $58, $4C, $D8
      .byte $60, $F0, $60, $08, $60, $F0, $4C, $40
      .byte $2B, $60, $00, $00, $FF, $D8, $00, $08
      .byte $00, $01, $00, $FF, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $07, $02, $06, $06
      .byte $06, $06, $06, $06, $06, $06, $AA, $DA
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $AD, $70, $00, $2B
      .byte $60, $00, $00, $81, $D8, $81, $08, $00
      .byte $01, $00, $FD, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $07, $02, $06, $01, $06
      .byte $00, $06, $06, $06, $00, $AA, $DA, $00
      .byte $00, $64, $54, $94, $54, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $0B, $60
      .byte $00, $00, $6D, $D8, $01, $02, $00, $01
      .byte $00, $7D, $0C, $00, $00, $00, $00, $07
      .byte $00, $00, $07, $02, $06, $01, $06, $06
      .byte $06, $06, $06, $07
W8326:
      .byte $49, $36, $23, $E6, $A7, $68, $29, $03
      .byte $E0, $BA, $94, $71, $4B, $15, $E9, $C0
      .byte $96, $73, $59, $3B, $21, $0A, $EA, $CD
      .byte $B3, $8C, $7F, $50, $28, $E9, $CE, $B9
      .byte $92, $6C
W8348:                                  
      .byte $BF, $BF, $BF, $BE, $BE, $BE, $BE, $BE
      .byte $BD, $BD, $BD, $BD, $BD, $BD, $BC, $BC
      .byte $BC, $BC, $BC, $BC, $BC, $BC, $BB, $BB
      .byte $BB, $BB, $BB, $BB, $BB, $BA, $BA, $BA
      .byte $BA, $BA
W836A:                                  
      .byte $15, $12, $12, $3C, $3E, $3E, $3E, $25
      .byte $22, $25, $25, $22, $25, $35, $2B, $28
      .byte $29, $22, $19, $1D, $19, $16, $1F, $1C
      .byte $19, $26, $0C, $2E, $27, $3E, $1A, $14
      .byte $26, $25
W838C:
      lda  $09                          
      bmi  W8393                        
      jmp  W9F71                        
W8393:
      lda  $32                          
      bpl  W839B                        
      lda  $AC                          
      bpl  W839C                        
W839B:
      rts                               
W839C:
      jsr  W9AFE                        
      lda  $36                          
      bpl  W83A6                        
      jsr  W8423                        
W83A6:
      lda  $0C                          
      cmp  #$01                         
      beq  W83F8                        
      lda  $16                          
      beq  W83D2                        
      clc                               
      adc  $16                          
      tax                               
      lda  #$00                         
      jsr  W9AB5                      
      ldy  $D000                        
      lda  $D010                        
      and  #$01                         
      beq  W83C9                        
      cpy  #$3B                         
      bcc  W83CF                        
      ldy  #$3A                         
W83C9:
      cpy  #$1F                         
      bcs  W83CF                        
      ldy  #$1F                         
W83CF:
      sty  $D000                        
W83D2:
      ldy  $17                          
      lda  #$00                         
      jsr  W9AEB                        
      lda  $D001                        
      ldx  $0C                          
      cmp  #$E0                         
      bcc  W83E4                        
      lda  #$DF                         
W83E4:
      cmp  W83F0,x                      
      bne  W83EC                        
      lda  W83F4,x                      
W83EC:
      sta  $D001                        
      rts                               
W83F0:
      dex                               
      brk                               
      lax  $A7                          
W83F4:
      sbx  #$00                         
      tay                               
      tay                               
W83F8:
      ldx  $16                          
      bne  W8400                        
      cpx  $17                          
      beq  W846A                        
W8400:
      jsr  W9909                      
      txa                               
      clc                               
      adc  $4C                          
      cmp  #$04                         
      bcc  W8411                        
      cmp  #$94                         
      bcs  W8411                        
      sta  $4C                          
W8411:
      lda  $17                          
      asl                               
      adc  $4D                          
      cmp  #$78                         
      bcc  W8420                        
      cmp  #$A9                         
      bcs  W8420                        
      sta  $4D                          
W8420:
      jmp  W9906                      
W8423:
      lda  $0C                          
      cmp  #$03                         
      bne  W842D                        
      lda  $0E                          
      bne  W846A                        
W842D:
      lda  #$01                         
      sta  $FA                          
      ldy  $0C                          
      dey                               
      beq  W846B                        
      ldx  #$00                         
      jsr  W9C89                        
      adc  #$0C                         
      sta  $D002                        
      lda  $9E                          
      adc  #$00                         
      beq  W844D                        
      lda  #$02                         
      ora  $D010                        
      bne  W8452                        
W844D:
      lda  #$FD                         
      and  $D010                        
W8452:
      sta  $D010                        
      lda  $D001                        
      clc                               
      adc  #$F9                         
      sta  $D003                        
      lda  #$02                         
      sta  $36                          
      sta  $96                          
      ora  $D015                        
      sta  $D015                        
W846A:
      rts                               
W846B:
      jsr  W9953                      
      lda  $4C                          
      clc                               
      adc  #$05                         
      sta  $4E                          
      sta  $9D                          
      lda  $4D                          
      sec                               
      sbc  #$08                         
      sta  $4F                          
      ldx  #$01                         
      stx  $36                          
      stx  $96                          
      bne  W84A0                        
W8486:
      lda  $96                          
      bmi  W84C1                        
      cmp  #$02                         
      beq  W84AC                        
W848E:
      eor  #$01                         
      sta  $96                          
      bne  W84C1                        
      jsr  W9953                      
      lda  #$F8                         
      clc                               
      adc  $4F                          
      cmp  #$08                         
      bcc  W84A5                        
W84A0:
      sta  $4F                          
      jmp  W9950                        
W84A5:
      lda  #$FF                         
      sta  $96                          
      jmp  W9953                      
W84AC:
      ldy  #$FD                         
      lda  #$01                         
      jsr  W9AEB                        
      bcs  W84C1                        
W84B5:
      lda  #$FD                         
      and  $D015                        
      sta  $D015                        
W84BD:
      lda  #$FF                         
      sta  $96                          
W84C1:
      rts                               
      ldx  $A4                          
      ldy  W8546,x                    
      sty  $3A                          
      ldx  #$07                         
      stx  $45                          
W84CD:
      ldy  $3A                          
      sty  $78,x                        
      lda  #$01                         
      sta  $48,x                        
      iny                               
      iny                               
      sty  $80,x                        
      lda  #$09                         
      sta  $50,x                        
      iny                               
      iny                               
      sty  $88,x                        
      lda  #$11                         
      sta  $58,x                        
      lda  W853E,x                      
      sta  $60,x                        
      sta  $68,x                        
      sta  $70,x                        
      dex                               
      bpl  W84CD                        
      stx  $99                          
      stx  $37                          
      inx                               
      stx  $0E                          
      stx  $92                          
      stx  $99                          
      stx  $38                          
      stx  $35                          
      stx  $33                          
      inx                               
      stx  $91                          
      stx  $BF                          
      ldx  #$18                         
      stx  $34                          
      stx  $47                          
      lda  #$22                         
      sta  $07                          
      lda  #$90                         
      sta  $02                          
      lda  #$FF                         
      ldx  #$11                         
W8519:
      sta  $1F,x                        
      dex                               
      bpl  W8519                        
      lda  #$04                         
      sta  $90                          
      lda  #$5F                         
      sta  $43FA                        
      sta  $43FB                        
      lda  #$41                         
      sta  $43FF                        
      lda  #$A0                         
      sta  $B0                          
      lda  #$FE                         
      sta  $9A                          
      lda  #$0F                         
      sta  $F5                          
      jmp  W9B7F                        
W853E:
      .byte $01, $04, $07, $0A, $0D, $10, $13, $16
W8546:
        .byte $06, $08, $0A, $0C, $0C, $0E, $20, $F8  ; $8546
        .byte $9F, $A5, $35, $30, $4C, $A5, $BF, $F0  ; $854E
        .byte $0E, $30, $1B, $C6, $B0, $D0, $1F, $A9  ; $8556
        .byte $60, $85, $B0, $A9, $02, $D0, $0A, $C6  ; $855E
        .byte $B0, $D0, $13, $A9, $5A, $85, $B0, $A9  ; $8566
        .byte $FE, $85, $9A, $C6, $BF, $60, $C6, $B0  ; $856E
        .byte $D0, $04, $A9, $18, $85, $F5, $AD, $10  ; $8576
        .byte $D0, $29, $80, $D0, $19, $AD, $0E, $D0  ; $857E
        .byte $A2, $07, $DD, $BD, $88, $F0, $05, $CA  ; $8586
        .byte $10, $F8, $30, $0A, $C6, $34, $A4, $34  ; $858E
        .byte $BE, $A5, $88, $20, $49, $86, $4C, $62  ; $8596
        .byte $88, $20, $84, $97, $20, $C2, $96, $20  ; $859E
        .byte $09, $87, $20, $B6, $87, $20, $2D, $88  ; $85A6
        .byte $A5, $09, $10, $04, $A5, $31, $10, $01  ; $85AE
        .byte $60, $A5, $02, $D0, $FB, $A5, $07, $85  ; $85B6
        .byte $02                         
W85BF:
      dec  $47                          
      bmi  W8609                        
      ldx  $47                          
      lda  $48,x                        
      bmi  W85BF                        
      clc                               
      adc  $90                          
      sta  $48,x                        
      lda  $78,x                        
      sta  $95                          
      lda  $60,x                        
      sta  $94                          
      clc                               
      adc  $91                          
      sta  $60,x                        
      cmp  #$01                         
      beq  W85E3                        
      cmp  #$25                         
      bne  W85E5                        
W85E3:
      inc  $92                          
W85E5:
      jsr  W8649                        
      ldy  $0E                          
      lda  $91                          
      bmi  W85FD                        
      lda  $94                          
      sta  $9D                          
      lda  $95                          
      sta  $9F                          
      jsr  W9B48                        
      inc  $9F                          
      bne  W8604                        
W85FD:
      inc  $9D                          
      jsr  W9B48                        
      dec  $9F                          
W8604:
      jsr  W9B48                        
      beq  W85BF                        
W8609:
      lda  $92                          
      beq  W8639                        
      lda  $91                          
      jsr  W9BDA                        
      sta  $91                          
      ldx  #$17                         
W8616:
      inc  $78,x                        
      inc  $78,x                        
      lda  $48,x                        
      bmi  W8621                        
      jsr  W8649                        
W8621:
      dex                               
      bpl  W8616                        
      dec  $9F                          
      dec  $9F                          
      dec  $9F                          
      inx                               
      stx  $9D                          
      ldy  $0E                          
      jsr  W9B48                        
      ldy  #$4F                         
W8634:
      sta  ($1B),y                      
      dey                               
      bpl  W8634                        
W8639:
      lda  #$18                         
      sta  $47                          
      lda  $90                          
      jsr  W9BDA                        
      sta  $90                          
      lda  #$00                         
      sta  $92                          
      rts                               
W8649:
      txa                               
      lsr                               
      lsr                               
      lsr                               
      tay                               
      lda  W8706,y                      
      sta  $44                          
      lda  $60,x                        
      sta  $9D                          
      lda  $78,x                        
      cmp  #$18                         
      bcc  W866A                        
      lda  $33                          
      bne  W8669                        
      dec  $C0                          
      ldy  #$FF                         
      sty  $31                          
      sty  $33                          
W8669:
      rts                               
W866A:
      sta  $9F                          
      ldy  $48,x                        
      jsr  W9B48                        
      inc  $9F                          
      iny                               
      jsr  W9B48                        
      dec  $9F                          
      inc  $9D                          
      iny                               
      jsr  W9B48                        
      inc  $9F                          
      iny                               
      jmp  W9B48                        
W8685:
      dec  $31                          
      dec  $07                          
      lda  $31                          
      bne  W8693                        
      inc  $FE                          
      lda  #$05                         
      bne  W86A1                        
W8693:
      cmp  #$10                         
      bne  W8699                        
      inc  $FE                          
W8699:
      cmp  #$08                         
      bne  W86A3                        
      inc  $FE                          
      lda  #$10                         
W86A1:
      sta  $07                          
W86A3:
      lda  #$FF                         
      sta  $48,x                        
      lda  $60,x                        
      sta  $9D                          
      lda  $78,x                        
      sta  $9F                          
      ldy  $0E                          
      jsr  W9B48                        
      inc  $9F                          
      jsr  W9B48                        
      dec  $9F                          
      inc  $9D                          
      jsr  W9B48                        
      inc  $9F                          
      jsr  W9B48                        
      lda  #$03                         
      sta  $FA                          
      lda  $9F                          
      asl                               
      asl                               
      asl                               
      adc  #$2A                         
      sta  $D009                        
      lda  $9D                          
      asl                               
      asl                               
      asl                               
      ror  $9E                          
      adc  #$12                         
      sta  $D008                        
      lda  $9E                          
      adc  #$00                         
      beq  W86EC                        
      lda  #$10                         
      ora  $D010                        
      bne  W86F1                        
W86EC:
      lda  #$EF                         
      and  $D010                        
W86F1:
      sta  $D010                        
      ldx  #$04                         
      jsr  WA027                        
      lda  #$10                         
      ora  $D015                        
      sta  $D015                        
      ldx  #$01                         
      jmp  W9ECF                        
W8706:                                  
      .byte $07, $05, $02
W8709:                                  
      .byte $A5, $09, $10, $6B, $A0, $02
      lda  $97                          
      bmi  W8718                        
      iny                               
      lda  $98                          
      bpl  W8778                        
W8718:
      tya                               
      sta  $0095,y                      
      sty  $3A                          
      asl                               
      tay                               
      jsr  W9BAB                        
      and  #$07                         
      ora  #$10                         
      tax                               
      lda  $48,x                        
      bpl  W873C                        
      txa                               
      eor  #$18                         
      tax                               
      lda  $48,x                        
      bpl  W873C                        
      txa                               
      and  #$07                         
      tax                               
      lda  $48,x                        
      bmi  W8778                        
W873C:
      lda  #$00                         
      sta  $9E                          
      lda  $78,x                        
      asl                               
      asl                               
      asl                               
      adc  #$3D                         
      sta  $D001,y                      
      lda  $60,x                        
      asl                               
      asl                               
      asl                               
      rol  $9E                          
      adc  #$20                         
      sta  $D000,y                      
      ldy  $3A                          
      lda  $9E                          
      adc  #$00                         
      beq  W8766                        
      lda  W9CA3,y                      
      ora  $D010                        
      bne  W876C                        
W8766:
      lda  W9CAB,y                      
      and  $D010                        
W876C:
      sta  $D010                        
      lda  W9CA3,y                      
      ora  $D015                        
      sta  $D015                        
W8778:
      lda  $04                          
      and  #$03                         
      bne  W878E                        
      lda  $43FA                        
      eor  #$3F                         
      sta  $43FA                        
      lda  $43FB                        
      eor  #$3F                         
      sta  $43FB                        
W878E:
      ldy  #$02                         
      lda  $97                          
      bmi  W879C                        
      jsr  W9AEB                        
      bcs  W879C                        
      jsr  W87A5                        
W879C:
      lda  $98                          
      bmi  W87B5                        
      jsr  W9AEB                        
      bcs  W87B5                        
W87A5:
      txa                               
      lsr                               
W87A7:
      tax                               
      lda  W9CAB,x                      
      and  $D015                        
      sta  $D015                        
      lda  #$FF                         
      sta  $95,x                        
W87B5:
      rts                               
W87B6:
      lda  $99                          
      bmi  W87BB                        
W87BA:
      rts                               
W87BB:
      jsr  W9BAB                        
      bne  W87BA                        
      lda  $02                          
      and  #$01                         
      bne  W87BA                        
      lda  #$80                         
      ora  $D015                        
      sta  $D015                        
      lda  #$80                         
      ora  $D010                        
      sta  $D010                        
      lda  #$7F                         
      and  $D017                        
      sta  $D017                        
      lda  #$45                         
      sta  $D00F                        
W87E3:
      jsr  W9BAB                        
      ldx  #$02                         
      tay                               
      bpl  W87ED                        
      ldx  #$FE                         
W87ED:
      stx  $9A                          
      and  #$03                         
      beq  W87E3                        
      tax                               
      dex                               
      stx  $99                          
      lda  W882A,x                      
      sta  $43FF                        
      lda  #$51                         
      bit  $9A                          
      bmi  W880B                        
      asl  $D010                        
      lsr  $D010                        
      lda  #$18                         
W880B:
      sta  $D00E                        
      dex                               
      bpl  W881F                        
      stx  $37                          
      inx                               
      stx  $38                          
      lda  #$80                         
      ora  $D017                        
      sta  $D017                        
      rts                               
W881F:
      dex                               
      bmi  W8829                        
      dex                               
      stx  $38                          
      lda  #$60                         
      sta  $37                          
W8829:
      rts                               
W882A:                                  
      .byte $41, $43, $42
W882D:                                  
      .byte $A6
      sta  $3030,y                      
      beq  W8862                        
      dex                               
      beq  W8840                        
      lda  $38                          
      beq  W8840                        
      bpl  W885B                        
      dec  $37                          
      beq  W884F                        
W8840:
      lda  #$07                         
      ldx  $9A                          
      jsr  W9AB5                      
      lda  #$07                         
      jsr  W9AD3                        
      bcc  W888E                        
      rts                               
W884F:
      lda  #$03                         
      sta  $38                          
      lda  $9A                          
      jsr  W9BDA                        
      sta  $9A                          
      rts                               
W885B:
      lda  $02                          
      bne  W8861                        
      dec  $38                          
W8861:
      rts                               
W8862:
      inc  $37                          
W8864:
      lda  $37                          
      eor  $38                          
      tay                               
      and  #$10                         
      beq  W8876                        
      lda  $38                          
      eor  #$FF                         
      sta  $38                          
      jmp  W8864                        
W8876:
      tya                               
      and  #$0F                         
      tax                               
      lda  W8895,x                      
      sta  $D00F                        
      lda  #$07                         
      ldx  $9A                          
      jsr  W9AB5                      
      lda  #$07                         
      jsr  W9AD3                        
      bcs  W8861                        
W888E:
      lda  #$FF                         
      sta  $99                          
      sta  $35                          
      rts                               
W8895:                                  
      .byte $32, $32, $33, $33, $34, $35, $35, $36
      .byte $37, $38, $3A, $3B, $3D, $3F, $42, $45
W88A5:
      .byte $00, $01, $02, $03, $04, $05, $06, $07
      .byte $0F, $0E, $0D, $0C, $0B, $0A, $09, $08
      .byte $10, $11, $12, $13, $14, $15, $16, $17
W88BD:
      .byte $21, $39, $51, $69, $81, $99, $B1, $C9
      .byte $A0, $07
W88C7:
      lda  W8916,y                      
      sta  $43F8,y                      
      dey                               
      bpl  W88C7                        
      ldy  #$09                         
      lda  #$00                         
W88D4:
      sta  $0058,y                      
      dey                               
      bpl  W88D4                        
      iny                               
      sty  $60                          
      sty  $61                          
      sty  $7D                          
      lda  #$48                         
      sta  $4C                          
      lda  #$A8                         
      sta  $4D                          
      lda  #$20                         
      sta  $50                          
      lda  #$6C                         
      sta  $51                          
      lda  #$40                         
      sta  $52                          
      sta  $53                          
      jsr  W9883+1                      
      ldy  $A4                          
      lda  W891E,y                      
      sta  $07                          
      lda  #$80                         
      sta  $02                          
      ldx  #$01                         
W8907:
      jsr  W899C                        
      dex                               
      bpl  W8907                        
      jsr  W9906                      
      jsr  W84BD                        
      jmp  W9079                        
W8916:
      lsr  $46                          
      lsr  $54                          
      lsr  $46                          
      lsr  $54                          
W891E:
      rts                               
      pha                               
      bmi  W893A                        
      clc                               
      php                               
      php                               
      jsr  W9663                        
      jsr  W9FF8                        
      lda  $09                          
      bpl  W8932                        
      jsr  W8B5D                        
W8932:
      lda  $A4                          
      cmp  #$03                         
      bcs  W893E                        
      lda  $04                          
W893A:
      and  #$01                         
      bne  W8961                        
W893E:
      lda  #$07                         
      sta  $7C                          
W8942:
      lda  $7C                          
      tay                               
      lsr                               
      lsr                               
      sta  $7D                          
      lda  $0058,y                      
      bmi  W895D                        
      beq  W895D                        
      cmp  #$03                         
      bne  W895A                        
      jsr  W8AB1                        
      jmp  W895D                        
W895A:
      jsr  W8BA0                        
W895D:
      dec  $7C                          
      bpl  W8942                        
W8961:
      lda  $04                          
      and  #$01                         
      sta  $7D                          
      tax                               
      stx  $39                          
      lda  $56,x                        
      bpl  W89C6                        
      lda  $60,x                        
      bmi  W89C5                        
      dec  $54,x                        
      beq  W899C                        
      jsr  W992D+1                      
      lda  $50,x                        
      adc  $6A,x                        
      cmp  #$0E                         
      bcc  W899C                        
      cmp  #$8A                         
      bcs  W899C                        
      tay                               
      lda  $52,x                        
      adc  $74,x                        
      cmp  #$26                         
      bcc  W899C                        
      cmp  #$78                         
      bcs  W899C                        
      sta  $52,x                        
      sty  $50,x                        
      jsr  W992B                        
      jmp  W8A84                        
W899C:
      jsr  W992B                        
      lda  $52,x                        
      clc                               
      adc  #$0E                         
      lsr                               
      lsr                               
      sta  $80,x                        
      sta  $82,x                        
      inc  $82,x                        
      lda  $50,x                        
      clc                               
      adc  #$05                         
      sta  $7E,x                        
      and  #$03                         
      ora  #$80                         
      sta  $84,x                        
      lda  #$00                         
      sta  $56,x                        
      sta  $6A,x                        
      sta  $74,x                        
      lda  #$10                         
      sta  $F5                          
W89C5:
      rts                               
W89C6:
      lda  $60,x                        
      bmi  W89CD                        
      jsr  W992B                        
W89CD:
      stx  $39                          
      inc  $80,x                        
      lda  $80,x                        
      cmp  #$2F                         
      bne  W89EC                        
      lda  $84,x                        
      and  #$03                         
      cmp  $84,x                        
      bne  W89E6                        
      lda  #$FF                         
      sta  $56,x                        
      jmp  W8A43                        
W89E6:
      sta  $84,x                        
      lda  $82,x                        
      sta  $80,x                        
W89EC:
      sta  $9F                          
      ldy  $7E,x                        
      sty  $9D                          
      ldy  #$00                         
      sty  $9E                          
      lsr                               
      tax                               
      and  #$03                         
      tay                               
      lda  $9D                          
      and  #$FC                         
      asl                               
      rol  $9E                          
      adc  W9A23,y                      
      sta  $1B                          
      lda  W9A27,x                      
      adc  $9E                          
      sta  $1C                          
      lda  $9F                          
      asl                               
      asl                               
      and  #$07                         
      adc  $1B                          
      sta  $1B                          
      lda  $1C                          
      adc  #$00                         
      sta  $1C                          
      ldy  #$03                         
      ldx  $39                          
      lda  $84,x                        
      sta  $93                          
      and  #$03                         
      tax                               
      cmp  $93                          
      beq  W8A38                        
W8A2D:
      lda  W98FE,x                      
      ora  ($1B),y                      
      sta  ($1B),y                      
      dey                               
      bpl  W8A2D                        
      rts                               
W8A38:
      lda  W98FA,x                      
      and  ($1B),y                      
      sta  ($1B),y                      
      dey                               
      bpl  W8A38                        
      rts                               
W8A43:
      ldx  $4C                          
      lda  $A4                          
      bne  W8A4B                        
      ldx  #$45                         
W8A4B:
      stx  $95                          
      jsr  W9BAB                        
      and  #$1F                         
      beq  W8A43                        
      ldx  $39                          
      sta  $54,x                        
      and  #$03                         
      asl                               
      ldy  $50,x                        
      cpy  $95                          
      bcc  W8A65                        
      eor  #$FF                         
      adc  #$00                         
W8A65:
      sta  $6A,x                        
W8A67:
      jsr  W9BAB                        
      and  #$03                         
      asl                               
      bne  W8A75                        
      ldx  $39                          
      ldy  $6A,x                        
      beq  W8A67                        
W8A75:
      ldx  $39                          
      ldy  $52,x                        
      cpy  #$42                         
      bcc  W8A81                        
      eor  #$FF                         
      adc  #$00                         
W8A81:
      sta  $74,x                        
      rts                               
W8A84:
      txa                               
      asl                               
      asl                               
      sta  $3A                          
      lda  #$03                         
      sta  $93                          
W8A8D:
      ldx  $39                          
      ldy  $3A                          
      lda  $0058,y                      
      bne  W8AA8                        
      lda  $6A,x                        
      asl                               
      tax                               
      lda  $3A                          
      jsr  W9AB5                      
      ldx  $39                          
      ldy  $74,x                        
      lda  $3A                          
      jsr  W9AEB                        
W8AA8:
      inc  $3A                          
      dec  $93                          
      bpl  W8A8D                        
      ldx  $39                          
      rts                               
W8AB1:
      ldx  $7D                          
      lda  $60,x                        
      bpl  W8ABA                        
      jmp  W8B37                        
W8ABA:
      lda  $7C                          
      asl                               
      tay                               
      lda  #$00                         
      sta  $D001,y                      
      sta  $9E                          
      sty  $3A                          
      jsr  W9BAB                        
      and  #$07                         
      tax                               
      ldy  $7C                          
      lda  W8C64,x                      
      sta  $0062,y                      
      lda  W8C6C,x                      
      sta  $006C,y                      
      ldx  $7D                          
      lda  $50,x                        
      asl                               
      rol  $9E                          
      adc  W8C54,y                      
      ldy  $3A                          
      sta  $D000,y                      
      ldy  $7C                          
      lda  $9E                          
      adc  #$00                         
      beq  W8AFA                        
      lda  W9CA3,y                      
      ora  $D010                        
      bne  W8B00                        
W8AFA:
      lda  W9CAB,y                      
      and  $D010                        
W8B00:
      sta  $D010                        
      lda  $52,x                        
      clc                               
      adc  W8C5C,y                      
      bpl  W8B10                        
      lda  #$00                         
      sta  $0062,y                      
W8B10:
      sta  $93                          
      lda  $0062,y                      
      beq  W8B30                        
      lda  $006C,y                      
      cmp  #$04                         
      bne  W8B20                        
      lsr  $93                          
W8B20:
      lda  $93                          
      ldx  $62,y                        
      bmi  W8B2B                        
      eor  #$FF                         
      sec                               
      adc  #$00                         
W8B2B:
      tax                               
      tya                               
      jsr  W9AB5                      
W8B30:
      ldx  $7C                          
      lda  #$02                         
      sta  $58,x                        
      rts                               
W8B37:
      jsr  W9BAB                        
      and  #$03                         
      tay                               
      ldx  $7C                          
      lda  #$48                         
      sta  $43F8,x                      
      lda  W9CAB,x                      
      and  $D010                        
      sta  $D010                        
      txa                               
      asl                               
      tax                               
      lda  #$1F                         
      sta  $D001,x                      
      lda  W8C74,y                      
      sta  $D000,x                      
      bne  W8B71                        
W8B5D:
      lda  $02                          
      bne  W8B9F                        
      lda  $07                          
      sta  $02                          
      jsr  W9BAB                        
      and  #$07                         
      tax                               
      lda  $58,x                        
      bne  W8B9F                        
      stx  $7C                          
W8B71:
      lda  #$00                         
      sta  $A1                          
      lda  $4C                          
      clc                               
      adc  #$0C                         
      and  #$F8                         
      sta  $A0                          
      lda  $4D                          
      adc  #$32                         
      sta  $A2                          
      ldx  $7C                          
      jsr  W9BF2                        
      ldx  $7C                          
      lda  $37                          
      sta  $62,x                        
      lda  $38                          
      sta  $6C,x                        
      lda  #$01                         
      sta  $58,x                        
      lda  $EB                          
      bne  W8B9F                        
      lda  #$11                         
      sta  $F5                          
W8B9F:
      rts                               
W8BA0:
      cmp  #$01                         
      bne  W8BD6                        
      tya                               
      and  #$03                         
      cmp  #$03                         
      beq  W8BAF                        
      lda  #$46                         
      bne  W8BB1                        
W8BAF:
      lda  #$54                         
W8BB1:
      sta  $43F8,y                      
      tya                               
      ldx  $62,y                        
      jsr  W9AB5                      
      lda  $7C                          
      jsr  W9AD3                        
      bcc  W8BC9                        
      txa                               
      ldy  $6C,x                        
      jsr  W9AEB                        
      bcs  W8BD5                        
W8BC9:
      lda  $A4                          
      cmp  #$05                         
      bcs  W8BD2                        
      jmp  W8AB1                        
W8BD2:
      jmp  W8B37                        
W8BD5:
      rts                               
W8BD6:
      ldx  $7D                          
      lda  $6A,x                        
      ldx  $A4                          
      cpx  #$03                         
      bcs  W8BE1                        
      asl                               
W8BE1:
      clc                               
      adc  $0062,y                      
      tax                               
      tya                               
      jsr  W9AB5                      
      ldy  $7D                          
      ldx  $7C                          
      lda  $0074,y                      
      ldy  $A4                          
      cpy  #$03                         
      bcc  W8BF8                        
      lsr                               
W8BF8:
      adc  $6C,x                        
      tay                               
      txa                               
      jsr  W9AEB                        
      lda  $7C                          
      tay                               
      asl                               
      sta  $93                          
      ldx  $7D                          
      lda  $52,x                        
      clc                               
      adc  W8C5C,y                      
      ldy  $93                          
      cmp  $D001,y                      
      bcc  W8C15                        
      rts                               
W8C15:
      ldy  $7C                          
      lda  #$00                         
      sta  $0058,y                      
      sta  $9E                          
      lda  $50,x                        
      asl                               
      rol  $9E                          
      adc  W8C54,y                      
      sta  $9D                          
      lda  $9E                          
      adc  #$00                         
      beq  W8C36                        
      lda  W9CA3,y                      
      ora  $D010                        
      bne  W8C3C                        
W8C36:
      lda  W9CAB,y                      
      and  $D010                        
W8C3C:
      sta  $D010                        
      lda  $52,x                        
      adc  W8C5C,y                      
      sta  $9F                          
      tya                               
      asl                               
      tay                               
      lda  $9D                          
      sta  $D000,y                      
      lda  $9F                          
      sta  $D001,y                      
      rts                               
W8C54:
      .byte $00, $18, $30, $18, $00, $18, $30, $18
W8C5C:
      .byte $20, $20, $20, $0C, $20, $20, $20, $0C
W8C64:
      .byte $00, $02, $02, $FE, $FE, $02, $00, $FE
W8C6C:
      .byte $02, $02, $04, $02, $04, $02, $04, $04
W8C74:
      .byte $18, $62, $AC, $FF, $A0, $18, $84, $70
      .byte $88
W8C7D:
      jsr  W9844                        
      lda  $023A,y                      
      ora  #$01                         
      sta  $023A,y                      
      dey                               
      bpl  W8C7D                        
      sty  $7B                          
      lda  #$55                         
      sta  $43FF                        
      jsr  W9883+1                      
      lda  #$20                         
      sta  $47                          
      lda  #$12                         
      sta  $F5                          
      ldx  $A4                          
      bne  W8CAD                        
      lda  #$0C                         
      sta  $31                          
      lda  #$AA                         
      sta  $5550                        
      sta  $5556                        
W8CAD:
      lda  W9260+1,x                    
      sta  $AE                          
      lda  W9267,x                      
      sta  $AF                          
      jmp  W9079                        
      jsr  W9663                        
      lda  #$07                         
      sta  $8F                          
W8CC1:
      jsr  W97C3                        
      dec  $8F                          
      bpl  W8CC1                        
      lda  $0A                          
      bpl  W8CDA                        
      lda  $D015                        
      and  #$04                         
      beq  W8CDA                        
      lda  $32                          
      bpl  W8CDA                        
      jsr  W9084                        
W8CDA:
      jsr  W91A2                        
      lda  $31                          
      bpl  W8CE2                        
      rts                               
W8CE2:
      lda  $7B                          
      bmi  W8D36                        
      dec  $75                          
      bpl  W8D1E                        
      lda  $A4                          
      bne  W8CF4                        
      lda  $02                          
      and  #$01                         
      bne  W8D35                        
W8CF4:
      dec  $79                          
      ldy  $79                          
      cpy  #$16                         
      beq  W8D00                        
      cpy  #$0C                         
      bne  W8D03                        
W8D00:
      inc  $43FA                        
W8D03:
      lda  W8E03,y                      
      sta  $75                          
      lda  ($71),y                      
      bit  $7A                          
      bmi  W8D11                        
      jsr  W9BDA                        
W8D11:
      sta  $77                          
      lda  ($73),y                      
      bit  $7A                          
      bvs  W8D1C                        
      jsr  W9BDA                        
W8D1C:
      sta  $78                          
W8D1E:
      lda  #$02                         
      ldx  $77                          
      jsr  W9AB5                      
      lda  #$02                         
      jsr  W9AD3                        
      bcc  W8D36                        
      lda  #$02                         
      ldy  $78                          
      jsr  W9AEB                        
      bcc  W8D36                        
W8D35:
      rts                               
W8D36:
      lda  $0A                          
      bmi  W8D3D                        
      jmp  W9FF8                        
W8D3D:
      dec  $31                          
      bmi  W8D35                        
      ldx  $31                          
      lda  W8E33,x                      
      tay                               
      lda  W8E23,x                      
      eor  $5540,y                      
      sta  $5540,y                      
      jsr  W9BAB                        
      tay                               
      and  #$03                         
      tax                               
      lda  W8DBC,x                      
      sta  $7A                          
W8D5C:
      jsr  W9BAB                        
      and  #$03                         
      beq  W8D5C                        
      sta  $76                          
      tax                               
      lda  W8DBF,x                      
      sta  $43FA                        
      tya                               
      bmi  W8D7F                        
      lda  #$C3                         
      sta  $71                          
      lda  #$8D                         
      sta  $72                          
      lda  #$E3                         
      sta  $73                          
      lda  #$8D                         
      bne  W8D8D                        
W8D7F:
      lda  #$E3                         
      sta  $71                          
      lda  #$8D                         
      sta  $72                          
      lda  #$C3                         
      sta  $73                          
      lda  #$8D                         
W8D8D:
      sta  $74                          
      lda  #$00                         
      sta  $75                          
      lda  #$20                         
      sta  $79                          
      sta  $7B                          
      lda  $09                          
      sta  $32                          
      lda  #$B8                         
      sta  $D004                        
      lda  #$FB                         
      and  $D010                        
      sta  $D010                        
      lda  #$7D                         
      sta  $D005                        
      lda  #$05                         
      ora  $D015                        
      sta  $D015                        
      lda  #$14                         
      sta  $F5                          
      rts                               
W8DBC:
      .byte $00, $40, $80
W8DBF:
      .byte $C0, $4C, $4F, $52, $01, $01, $01, $02
      .byte $02, $03, $04, $02, $04, $02, $02, $01
      .byte $01, $00, $FF, $FE, $FE, $FE, $FE, $FE
      .byte $FF, $00, $01, $03, $02, $01, $01, $FF
      .byte $FF, $FD, $FF, $FF, $04, $03, $02, $02
      .byte $01, $01, $01, $00, $FF, $FF, $FE, $FE
      .byte $FD, $FE, $FD, $FE, $FF, $00, $01, $02
      .byte $03, $02, $02, $01, $00, $FF, $FD, $FD
      .byte $FF, $FF, $01, $03
W8E03:
      .byte $60, $08, $0E, $0E, $09, $08, $07, $0E
      .byte $04, $09, $07, $09, $07, $0C, $08, $06
      .byte $08, $0B, $06, $06, $04, $06, $07, $04
      .byte $06, $07, $03, $02, $05, $02, $03, $02
W8E23:
      .byte $0C, $C0, $30, $30, $C0, $0C, $C0, $0C
      .byte $30, $30, $0C, $C0, $0C, $0C, $C0, $C0
W8E33:                                  
      .byte $07, $0B, $11, $17, $1D, $1F, $1F, $1B
      ora  $0F,x                        ; Flag for DATA/LIST
      ora  #$07                         
      bpl  W8E57                        
      asl  $10,x                        
      ldx  #$11                         
      lda  #$FF                         
W8E47:
      sta  $1F,x                        
      dex                               
      bpl  W8E47                        
      inx                               
      stx  $A3                          
      stx  $0E                          
      inx                               
      stx  $92                          
      inx                               
      stx  $58                          
W8E57:
      lda  #$06                         
      sta  $FA                          
      ldx  #$44                         
      stx  $43FA                        
      inx                               
      stx  $43FB                        
      lda  #$47                         
      sta  $43FF                        
      ldx  $A4                          
      lda  W9260+1,x                    
      sta  $AE                          
      lda  W9267,x                      
      sta  $AF                          
      txa                               
      beq  W8E8A                        
      ldx  #$06                         
      jsr  W9208                        
      ldx  #$05                         
      jsr  W9208                        
      lda  #$54                         
      sta  $43FD                        
      sta  $43FE                        
W8E8A:
      lda  #$07                         
      sta  $45                          
      sta  $03                          
      jsr  W9B7F                        
      jmp  W96DA                        
      jsr  W9FF8                        
      lda  $0E                          
      beq  W8EA0                        
      jmp  W9045                        
W8EA0:
      jsr  W95CC                        
      jsr  W9784                        
      lda  $09                          
      bpl  W8EC0                        
      lda  $03                          
      bne  W8EBA                        
      lda  #$06                         
      sta  $03                          
      lda  $AE                          
      cmp  #$06                         
      beq  W8EBA                        
      inc  $AE                          
W8EBA:
      jsr  W9084                        
      jsr  W9118                        
W8EC0:
      jsr  W91A2                        
      lda  #$02                         
      ldx  $92                          
      jsr  W9AB5                      
      lda  #$03                         
      jsr  W9AB5                      
      lda  $98                          
      cmp  #$F0                         
      bne  W8EDA                        
      lda  #$05                         
      jsr  W9AB5                      
W8EDA:
      lda  $99                          
      cmp  #$F0                         
      bne  W8EE5                        
      lda  #$06                         
      jsr  W9AB5                      
W8EE5:
      lda  $D004                        
      cmp  #$F0                         
      beq  W8EF1                        
      cmp  #$1E                         
      beq  W8EF1                        
      rts                               
W8EF1:
      ldy  #$7E                         
W8EF3:
      lda  $5100,y                      
      beq  W8F10                        
      sta  $94                          
      ldx  #$03                         
W8EFC:
      bit  $94                          
      bvs  W8F03                        
      clc                               
      bcc  W8F04                        
W8F03:
      sec                               
W8F04:
      ror                               
      rol  $94                          
      ror                               
      rol  $94                          
      dex                               
      bpl  W8EFC                        
      sta  $5100,y                      
W8F10:
      dey                               
      bpl  W8EF3                        
      ldx  #$3C                         
W8F15:
      ldy  $5100,x                      
      lda  $5102,x                      
      sta  $5100,x                      
      tya                               
      sta  $5102,x                      
      ldy  $5140,x                      
      lda  $5142,x                      
      sta  $5140,x                      
      tya                               
      sta  $5142,x                      
      dex                               
      dex                               
      dex                               
      bpl  W8F15                        
      lda  $43FA                        
      ldy  $43FB                        
      sta  $43FB                        
      sty  $43FA                        
      lda  $92                          
      jsr  W9BDA                        
      sta  $92                          
      lda  #$02                         
      ldy  $58                          
      jsr  W9AEB                        
      lda  #$03                         
      jsr  W9AEB                        
      lda  $98                          
      cmp  #$F0                         
      bne  W8F5E                        
      lda  #$05                         
      jsr  W9AEB                        
W8F5E:
      lda  $99                          
      cmp  #$F0                         
      bne  W8F69                        
      lda  #$06                         
      jsr  W9AEB                        
W8F69:
      lda  $D005                        
      cmp  #$50                         
      beq  W8F74                        
      cmp  #$6C                         
      bne  W8F7B                        
W8F74:
      lda  $58                          
      jsr  W9BDA                        
      sta  $58                          
W8F7B:
      rts                               
W8F7C:
      cpx  #$02                         
      bne  W8F8C                        
      lda  $92                          
      bmi  W8F90                        
W8F84:
      lda  #$00                         
      sta  $1B                          
      lda  #$51                         
      bne  W8F96                        
W8F8C:
      lda  $92                          
      bmi  W8F84                        
W8F90:
      lda  #$40                         
      sta  $1B                          
      lda  #$51                         
W8F96:
      sta  $1C                          
      jsr  W9C7B                        
      ldx  #$01                         
      jsr  W9C89                        
      sec                               
      sbc  $A0                          
      lsr                               
      tay                               
      lsr                               
      and  #$03                         
      tax                               
      sec                               
      lda  $9F                          
      sbc  $A2                          
      sta  $9F                          
      asl                               
      adc  $9F                          
      sta  $9F                          
      tya                               
      lsr                               
      lsr                               
      lsr                               
      clc                               
      adc  $9F                          
      tay                               
      lda  W98FA,x                      
      sta  $94                          
      and  ($1B),y                      
      cmp  $93                          
      beq  W8FFD                        
      ldx  #$03                         
W8FCA:
      cpy  #$3F                         
      bcs  W8FEE                        
      cpy  #$28                         
      bcs  W8FE2                        
      cpy  #$02                         
      bcc  W8FE2                        
      lda  $94                          
      eor  #$FF                         
      sta  $93                          
      and  ($1B),y                      
      cmp  $93                          
      beq  W8FFD                        
W8FE2:
      lda  $94                          
      and  ($1B),y                      
      sta  ($1B),y                      
      iny                               
      iny                               
      iny                               
      dex                               
      bpl  W8FCA                        
W8FEE:
      ldx  #$00                         
      jsr  W9ECF                        
      lda  #$16                         
      sta  $F5                          
      jsr  W914F+1                      
      jmp  W84B5                        
W8FFD:
      jsr  WA813                        
      ldx  #$07                         
      jsr  W9ECF                        
      lda  $A4                          
      bne  W900B                        
      inc  $C0                          
W900B:
      lda  #$3B                         
      sta  $D011                        
      lda  #$D8                         
      sta  $D016                        
      lda  #$08                         
      sta  $D018                        
      jsr  W9883+1                      
      ldy  #$17                         
W901F:
      jsr  W9844                        
      lda  $023A,y                      
      ora  #$01                         
      sta  $023A,y                      
      dey                               
      bpl  W901F                        
      lda  #$0C                         
      sta  $D01B                        
      lda  #$C0                         
      sta  $92                          
      lda  #$04                         
      sta  $02                          
      lda  #$09                         
      sta  $FA                          
      lda  #$0D                         
      sta  $F5                          
      jmp  W9D21                        
W9045:
      lda  $02                          
      bne  W9070                        
      lda  #$04                         
      sta  $02                          
      jsr  W91A2                        
      dec  $92                          
      beq  W906E                        
      lda  $92                          
      cmp  #$5F                         
      beq  W9071                        
      bcc  W9062                        
      inc  $D021                        
      inc  $D020                        
W9062:
      lda  #$17                         
      sta  $70                          
W9066:
      jsr  W97CB                        
      dec  $70                          
      bpl  W9066                        
      rts                               
W906E:
      dec  $31                          
W9070:
      rts                               
W9071:
      lda  #$00                         
      sta  $D021                        
      sta  $D020                        
W9079:
      ldx  #$1F                         
      stx  $47                          
W907D:
      jsr  W9663                        
      dex                               
      bpl  W907D                        
      rts                               
W9084:
      ldx  $AE                          
W9086:
      lda  $93,x                        
      cmp  #$FF                         
      beq  W9092                        
W908C:
      dex                               
      cpx  #$04                         
      bcs  W9086                        
      rts                               
W9092:
      cpx  $0B                          
      beq  W908C                        
      ldy  $0C                          
      lda  $05                          
      and  $AF                          
      cmp  $AF                          
      beq  W90B6                        
      stx  $39                          
      jsr  W9BAB                        
      and  #$07                         
      tay                               
      ldx  $39                          
      lda  W9192,y                      
      sta  $4C,x                        
      lda  W919A,y                      
      ldy  $0C                          
      bne  W90C5                        
W90B6:
      jsr  W9BE0                        
      lda  $37                          
      bne  W90C1                        
      cmp  $38                          
      beq  W90B6                        
W90C1:
      sta  $4C,x                        
      lda  $38                          
W90C5:
      sta  $50,x                        
      lda  W9CA3,x                      
      ora  $D015                        
      sta  $D015                        
      lda  $D010                        
      and  W9CA3,y                      
      beq  W90E0                        
      lda  W9CA3,x                      
      ora  $D010                        
      bne  W90E6                        
W90E0:
      lda  W9CAB,x                      
      and  $D010                        
W90E6:
      sta  $D010                        
      lda  #$49                         
      sta  $43F8,x                      
      lda  #$01                         
      sta  $93,x                        
      lda  #$18                         
      sta  $48,x                        
      tya                               
      asl                               
      tay                               
      txa                               
      asl                               
      tax                               
      lda  $D001,y                      
      clc                               
      adc  #$0A                         
      sta  $D001,x                      
      lda  $D000,y                      
      sta  $D000,x                      
      ldy  #$15                         
      lda  $0C                          
      cmp  #$03                         
      beq  W9115                        
      ldy  #$13                         
W9115:
      sty  $F5                          
      rts                               
W9118:
      ldy  #$06                         
W911A:
      lda  $0093,y                      
      cmp  #$F0                         
      bne  W912B                        
      jsr  W9BAB                        
      ldx  $A4                          
      cmp  W914B,x                      
      bcc  W9131                        
W912B:
      dey                               
      cpy  #$04                         
      bne  W911A                        
      rts                               
W9131:
      jsr  W9BE0                        
      lda  $37                          
      ldx  $3A                          
      sta  $4C,x                        
      lda  $38                          
      sta  $50,x                        
      lda  #$00                         
      sta  $93,x                        
      lda  #$20                         
      sta  $48,x                        
      lda  #$17                         
      sta  $F5                          
      rts                               
W914B:
      ora  ($04,x)                      
      bpl  W918F                        
W914F:
      isb  W9AA5,x                      
      bpl  W9191                        
      lda  $D002                        ; Position X sprite 1
      sta  $D00E                        ; Position X sprite 7
      lda  $D003                        ; Position Y sprite 1
      sta  $D00F                        ; Position Y sprite 7
      lda  $D010                        ; Position X MSB sprites 0..7
      tax                               
      and  #$02                         
      beq  W916D                        
      txa                               
      ora  #$80                         
      bne  W9170                        
W916D:
      txa                               
      and  #$7F                         
W9170:
      sta  $D010                        ; Position X MSB sprites 0..7
      jsr  W9BAB                        
      and  #$07                         
      tax                               
      lda  W9192,x                      
      sta  $53                          ; Scratch area
      lda  W919A,x                      
      sta  $57                          
      lda  #$80                         
      ora  $D015                        ; Sprites Abilitator
      sta  $D015                        ; Sprites Abilitator
      lda  #$20                         
      sta  $9A                          ; Output device (CMD=3)
W918F:
      sta  $4F                          
W9191:
      rts                               
W9192:
      .byte $00, $00, $01, $FF, $02, $FE, $03, $FC
W919A:
      .byte $02, $02, $03, $03, $02, $02, $01, $01
W91A2:
      .byte $A5, $A4, $D0, $06, $A5, $02, $29, $01
      .byte $D0, $45, $A2, $07
W91AE:
      .byte $B5, $93, $30, $3A, $D0, $06, $A5, $02
      .byte $29, $01, $D0, $32, $D6
      pha                               
      bne  W91D0                        
      lda  $43F8,x                      
      cmp  #$47                         
      beq  W91D0                        
      cmp  #$4B                         
      bcs  W91D0                        
      inc  $43F8,x                      
      lda  #$18                         
      sta  $48,x                        ; Pointer: BASIC current variable data
W91D0:
      stx  $39                          
      txa                               
      tay                               
      ldx  $4C,y                        ; Scratch area BASIC pointer
      jsr  W9AB5                      
      lda  $39                          
      jsr  W9AD3                        
      bcc  W91F2                        
      lda  $39                          
      tax                               
      ldy  $50,x                        
      jsr  W9AEB                        
      bcc  W91F2                        
      ldx  $39                          
      dex                               
      cpx  #$04                         
      bcs  W91AE                        
      rts                               
W91F2:
      ldx  $39                          
      lda  $93,x                        
      beq  W9208                        
W91F8:
      lda  W9CA3,x                      
      eor  #$FF                         
      and  $D015                        ; Sprites Abilitator
      sta  $D015                        ; Sprites Abilitator
W9203:
      lda  #$FF                         
      sta  $93,x
      rts                               
W9208:
      cpx  #$05                         
      bne  W9227                        
      lda  $99                          
      cmp  #$FF                         
      bne  W9227                        
      lda  #$FF                         
      sta  $98                          
      lda  #$DF                         
      and  $D015                        
      ora  #$40                         
      sta  $D015                        
      lda  #$54                         
      sta  $43FE                        
      ldx  #$06                         
W9227:
      stx  $39                          
      dex                               
      dex                               
      dex                               
      jsr  W9C89                        
      lda  $39                          
      tax                               
      asl                               
      tay                               
      lda  $9D                          
      adc  W925A,x                      
      sta  $D000,y                      ; Position X sprite 0
      lda  $9E                          
      adc  #$00                         
      beq  W924A                        
      lda  W9CA3,x                      
      ora  $D010                        ; Position X MSB sprites 0..7
      bne  W9250                        
W924A:
      lda  W9CAB,x                      
      and  $D010                        ; Position X MSB sprites 0..7
W9250:
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  $9F                          ; Tape pass 2 error register
      adc  #$ED                         
      sta  $D001,y                      ; Position Y sprite 0
W925A:
      lda  #$F0                         
      sta  $93,x                        
      rts                               
      brk                               
W9260:
      asl  $0404,x                      ; Video matrix (25*40)
      ora  $05                          ; Jump Vector: integer-real conversion
      asl  $06                          
W9267:
      slo  $07                          
      slo  ($03,x)                      
      ora  ($00,x)                      
W926D:
      ldy  $0C                          
      beq  W9280                        
      dey                               
      bne  W9277                        
      jmp  W9362                        
W9277:
      dey                               
      bne  W927D                        
      jmp  W943B                        
W927D:
      jmp  W948D                        
W9280:
      lda  $AB                          ; RS-232 input parity/Cassette short counter
      bne  W928E                        
      lda  $A4                          
      cmp  #$05                         
      bcs  W928E                        
      lda  $35                          
      bpl  W929F                        
W928E:
      lda  $09                          
      bpl  W929F                        
      lda  $10                          
      and  #$01                         
      beq  W929F                        
      jsr  W933F                        
      lda  #$FF                         
      sta  $31                          
W929F:
      ldy  #$01                         
      jsr  W956B                        
      bcs  W92C4                        
      sty  $18                          
      ldx  #$17                         
W92AA:
      lda  $48,x                        
      bmi  W92B9                        
      ldy  $60,x                        
      cpy  $18                          
      beq  W92BE                        
      iny                               
      cpy  $18                          
      beq  W92BE                        
W92B9:
      dex                               
      bpl  W92AA                        
      bmi  W92C4                        
W92BE:
      jsr  W8685                        
      jsr  W84B5                        
W92C4:
      ldy  #$02                         
      jsr  W956B                        
      bcs  W92D3                        
      jsr  W97A5+1                      
      lda  #$02                         
      jsr  W87A7                        
W92D3:
      ldy  #$03                         
      jsr  W956B                        
      bcs  W92E2                        
      jsr  W97A5+1                      
      lda  #$03                         
      jsr  W87A7                        
W92E2:
      lda  $09                          ; Screen column after last TAB
      bpl  W9300                        
      lda  #$18                         
      sta  $3B                          
      lda  #$15                         
      sta  $3C                          
      ldx  #$00                         
      jsr  W9513                        
      ldy  $94                          ; Flag: Serail Bus - Bufferized char in out
      beq  W9300                        
      lda  $003C,y                      ; BASIC precedent line number
      jsr  W87A7                        
      jsr  W933F                        
W9300:
      ldx  #$01                         
      jsr  W9513                        
      ldy  $94                          ; Flag: Serail Bus - Bufferized char in out
      beq  W933E                        
W9309:
      lda  $003C,y                      
      cmp  #$04                         
      bcc  W9319                        
      cmp  #$07                         
      beq  W9321                        
      dey                               
      bne  W9309                        
      beq  W933E                        
W9319:
      jsr  W87A7                        
      jsr  W84B5                        
      bne  W933E                        
W9321:
      ldy  $99                          ; Input device (default=0)
      ldx  W935F,y                      
      lda  $35                          
      bmi  W932B                        
      dex                               
W932B:
      jsr  W9ECF                        
      ldx  #$07                         
      jsr  WA027                        
      lda  #$FF                         
      sta  $99                          
      jsr  W84B5                        
      lda  #$05                         
      sta  $FA                          ; RS-232 output buffer pointer
W933E:
      rts                               
W933F:
      lda  #$56                         
      sta  $43F8                        
W9344:
      lda  #$05                         
      sta  $09                          ; Screen column after last TAB
      dec  $C0                          
      jsr  W9E78+1                      
      lda  #$08                         
      sta  $FA                          
      lda  #$0C                         
      sta  $F5                          
      lda  $C0                          
      bpl  W935C                        
      jmp  WA808                        
W935C:
      jmp  WA7FD                        
W935F:
      .byte $06, $02, $04
W9362:
      .byte $A5, $09, $10, $32, $A2, $01
W9368:                                  
      .byte $B5, $56, $30, $24, $B5, $80
      asl                               
      asl                               
      sta  $95                          
      lda  $4C                          
      cmp  $7E,x                        
      bcs  W9390                        
      adc  #$0B                         
      cmp  $7E,x                        
      bcc  W9390                        
      lda  $4D                          
      ldy  $84,x                        
      bpl  W938A                        
      cmp  $95                          
      bcc  W9395                        
      bcs  W9390                        
W938A:
      adc  #$16                         
      cmp  $95                          ; Bufferized cahr for serial bus
      bcs  W9395                        
W9390:
      dex                               
      bpl  W9368                        
      bmi  W9398                        
W9395:
      jsr  WA040                        
W9398:
      ldx  #$07                         
W939A:
      lda  $58,x                        
      bmi  W93F1                        
      lda  $10                          
      and  W9CA3,x                      
      beq  W93F1                        
      jsr  W9C89                        
      lsr  $9E                          
      ror                               
      sec                               
      sbc  #$0C                         
      sta  $9D                          
      sec                               
      lda  $9F                          
      sbc  #$32                         
      sta  $9F                          
      lda  $96                          
      bmi  W93D7                        
      lda  $4F                          
      sta  $A2                          
      lda  $4E                          
      jsr  W95B1                        
      bcs  W93D7                        
      jsr  W84A5                        
      jsr  WA01F                        
W93CC:
      lda  #$FF                         
      sta  $58,x                        
      dec  $31                          
      ldx  #$02                         
      jmp  W9ECF                        
W93D7:
      lda  $4D                          
      sta  $A2                          
      lda  $4C                          
      jsr  W95B1                        
      bcs  W93F1                        
      lda  W9CAB,x                      
      and  $D015                        
      sta  $D015                        
      jsr  W93CC                        
      jmp  WA040                        
W93F1:
      dex                               
      bpl  W939A                        
      lda  $96                          ; Number (EOT) of cassette sincronism
      bmi  W9413                        
      ldx  #$01                         
W93FA:
      lda  $60,x                        
      bmi  W9410                        
      sec                               
      lda  $4E                          
      sbc  $50,x                        
      cmp  #$0C                         
      bcs  W9410                        
      sec                               
      lda  $4F                          
      sbc  $52,x                        
      cmp  #$0E                         
      bcc  W9414                        
W9410:
      dex                               
      bpl  W93FA                        
W9413:
      rts                               
W9414:
      jsr  W84A5                        
      dec  $31                          
      lda  #$FF                         
      sta  $60,x                        
      jsr  W992D+1                      
      txa                               
      asl                               
      asl                               
      tax                               
      ldy  #$03                         
      sty  $95                          
W9428:
      lda  $58,x                        
      bne  W9431                        
      stx  $7C                          
      jsr  W8B71                        
W9431:
      inx                               
      dec  $95                          
      bpl  W9428                        
      ldx  #$06                         
      jmp  W9ECF                        
W943B:
      lda  #$18                         
      sta  $3B                          
      lda  #$15                         
      sta  $3C                          
      lda  $09                          
      bpl  W9463                        
      ldx  #$00                         
      jsr  W9513                        
      ldy  $94                          
      beq  W9463                        
      ldx  $3C,y                        
      cpx  #$02                         
      bne  W945B                        
      jsr  W9483                        
      bne  W945E                        
W945B:
      jsr  W91F8                        
W945E:
      jsr  W933F                        
      sta  $32                          
W9463:
      lda  $0A                          
      bpl  W947A                        
      ldx  #$01                         
      jsr  W9513                        
      ldy  $94                          
      beq  W947A                        
W9470:
      lda  $003C,y                      
      cmp  #$02                         
      beq  W947B                        
      dey                               
      bne  W9470                        
W947A:
      rts                               
W947B:
      jsr  W84B5                        
      ldx  #$02                         
      jsr  WA01F                        
W9483:
      ldx  #$05                         
      jsr  W9ECF                        
      lda  #$FF                         
      sta  $7B                          
      rts                               
W948D:
      lda  $0E                          
      bne  W9500                        
      lda  $09                          
      bpl  W94BC                        
      ldx  #$00                         
      jsr  W9513                        
      ldy  $94                          
      beq  W94BC                        
      ldx  $3C,y                        
      lda  $93,x                        
      bne  W94AD                        
      stx  $39                          
      ldx  #$02                         
      jsr  W9ECF                        
      ldx  $39                          
W94AD:
      cpx  #$07                         
      bne  W94B6                        
      jsr  W94E6                        
      bne  W94B9                        
W94B6:
      jsr  W91F8                        
W94B9:
      jsr  W933F                        
W94BC:
      lda  #$30                         
      sta  $3B                          
      lda  #$15                         
      sta  $3C                          
      ldx  #$01                         
      jsr  W9513                        
      ldy  $94                          
      beq  W94F0                        
W94CD:
      ldx  $3C,y                        
      cpx  #$04                         
      bcc  W94E0                        
      cpx  #$07                         
      beq  W94E3                        
      cpx  #$05                         
      bcs  W9501                        
      dey                               
      bne  W94CD                        
      beq  W94F0                        
W94E0:
      jmp  W8F7C                        
W94E3:
      jsr  W84B5                        
W94E6:
      ldx  #$03                         
      jsr  W9ECF                        
      ldx  #$07                         
      jmp  W91F8                        
W94F0:
      ldy  #$01                         
      jsr  W956B                        
      bcs  W9500                        
      jsr  W97A5+1                      
      jsr  W96DA                        
      jmp  W84B5                        
W9500:
      rts                               
W9501:
      lda  $93,x                        
      bne  W9500                        
      jsr  W84B5                        
      jsr  W9203                        
      jsr  WA01F                        
      ldx  #$02                         
      jmp  W9ECF                        
W9513:
      lda  #$00                         
      sta  $94                          
      stx  $95                          
      lda  W9CA3,x                      
      and  $0F                          
      beq  W956A                        
      jsr  W9C7B                        
      ldx  #$07                         
W9525:
      cpx  $95                          
      beq  W9567                        
      lda  W9CA3,x                      
      and  $0F                          
      beq  W9567                        
      jsr  W9C89                        
      sec                               
      sbc  $A0                          
      tay                               
      lda  $9E                          
      sbc  $A1                          
      bcs  W954B                        
      sta  $93                          
      tya                               
      eor  #$FF                         
      adc  #$01                         
      tay                               
      lda  $93                          
      eor  #$FF                         
      adc  #$00                         
W954B:
      bne  W9567                        
      tya                               
      cmp  $3B                          
      bcs  W9567                        
      sec                               
      lda  $9F                          
      sbc  $A2                          
      bcs  W955D                        
      eor  #$FF                         
      adc  #$01                         
W955D:
      cmp  $3C                          
      bcs  W9567                        
      inc  $94                          
      ldy  $94                          
      stx  $3C,y                        
W9567:
      dex                               
      bpl  W9525                        
W956A:
      rts                               
W956B:
      lda  $10                          
      and  W9CA3,y                      
      beq  W95AF                        
      tya                               
      asl                               
      tax                               
      sec                               
      lda  $D000,x                      ; Position X sprite 0
      sbc  #$18                         
      sta  $9D                          
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9CA3,y                      
      beq  W9587                        
      lda  #$01                         
W9587:
      sbc  #$00                         
      sta  $9E                          
      bcc  W95AF                        
      beq  W9595                        
      lda  $9D                          
      cmp  #$56                         
      bcs  W95AF                        
W9595:
      lsr  $9E                          
      lda  $9D                          ; Flag: 80=direct mode 00=program mode
      ror                               
      lsr                               
      lsr                               
      tay                               
      sec                               
      lda  $D001,x                      ; Position Y sprite 0
      sbc  #$35                         
      bcc  W95AF                        
      cmp  #$C8                         
      bcs  W95AF                        
      lsr                               
      lsr                               
      lsr                               
      tax                               
      clc                               
      rts                               
W95AF:
      sec                               
      rts                               
W95B1:
      sec                               
      sbc  $9D                          ; Flag: 80=direct mode 00=program mode
      bcs  W95BA                        
      eor  #$FF                         
      adc  #$01                         
W95BA:
      cmp  #$0B                         
      bcs  W95CB                        
      sec                               
      lda  $A2                          ; Real time clock HMS (1/60 sec)
      sbc  $9F                          
      bcs  W95C9                        
      eor  #$FF                         
      adc  #$01                         
W95C9:
      cmp  #$10                         
W95CB:
      rts                               
W95CC:
      lda  #$09                         
      sta  $44                          
      inc  $47                          
      lda  $47                          
      cmp  #$06                         
      bcc  W95DC                        
      lda  #$00                         
      sta  $47                          
W95DC:
      tax                               
      and  #$01                         
      sta  $93                          
      txa                               
      lsr                               
      tax                               
      lda  W961D,x                      
      tax                               
W95E8:
      lda  W9642,x                      
      beq  W961C                        
      tay                               
      lda  W9690,y                      
      sta  $1B                          
      lda  W96A9,y                      
      sta  $1C                          
      lda  W9621,x                      
      tay                               
      lda  $93                          
      bne  W960C                        
      lda  ($1B),y                      
      cmp  #$1E                         
      bne  W9619                        
      lda  $0E                          
      sta  ($1B),y                      
      beq  W9619                        
W960C:
      lda  ($1B),y                      
      cmp  $0E                          
      bne  W9619                        
      lda  #$1E                         
      sta  ($1B),y                      
      jsr  W9B70                        
W9619:
      inx                               
      bne  W95E8                        
W961C:
      rts                               
W961D:
      brk                               
      .byte $0B, $16, $21
W9621:
      .byte $0A, $24, $02, $13, $03, $1B, $0C, $13
      .byte $18, $22, $00, $05, $1E, $14, $12, $03
      .byte $1F, $06, $1A, $0D, $22, $00, $1D, $14
      .byte $0E, $0A, $24, $0B, $1D, $12, $02, $16
      .byte $00
W9642:                                  
      .byte $02, $04, $02, $0A, $08, $0A, $0F, $14
      .byte $10, $12, $00, $04, $06, $07, $0B, $0D
      .byte $0D, $12, $13, $16, $16, $00, $02, $02
      .byte $03, $06, $07, $0A, $0D, $10, $16, $17
      brk                               
W9663:
      dec  $47                          
      bpl  W966B                        
      lda  #$1F                         
      sta  $47                          
W966B:
      ldy  $47                          
      lda  #$01                         
      sta  $46                          
      sta  $95                          
      lda  W9621,y                      
      beq  W9663                        
      asl                               
      asl                               
      sta  $9D                          
      lda  W9642,y                      
      asl                               
      asl                               
      asl                               
      sta  $9F                          
      lda  $0C                          
      cmp  #$01                         
      bne  W968D                        
      jmp  W98AC                        
W968D:
      jmp  W98A8                        
W9690:
      brk                               
      .byte $28, $50, $78, $A0, $C8, $F0, $18, $40
      .byte $68, $90, $B8, $E0, $08, $30, $58, $80
      .byte $A8, $D0, $F8, $20, $48, $70, $98, $C0
W96A9:
      .byte $40, $40, $40, $40, $40, $40, $40, $41
      .byte $41, $41, $41, $41, $41, $42, $42, $42
      .byte $42, $42, $42, $42, $43, $43, $43, $43
      .byte $43
W96C2:                                  
      ldy  #$00                         
      lda  $96                          
      bmi  W96D0                        
      lda  $D003                        ; Position Y sprite 1
      cmp  #$A0                         
      bcc  W96D0                        
      dey                               
W96D0:
      sty  $A3                          
      ldy  #$01                         
      ldx  #$12                         
      lda  #$FF                         
      bne  W96E0                        
W96DA:
      ldy  #$02                         
      ldx  #$0A                         
      lda  #$01                         
W96E0:
      sty  $44                          ; Vector: INPUT routine
      stx  $19                          
      sta  $1A                          
      lda  #$F0                         
      sta  $18                          
      lda  #$02                         
      sta  $9D                          
      lda  $19                          
      sta  $9F                          
      ldx  #$11                         
W96F4:
      jsr  W9713                        
      inc  $9D                          
      dex                               
      bpl  W96F4                        
      lda  #$0F                         
      sta  $18                          
      lda  #$25                         
      sta  $9D                          
      lda  $19                          
      sta  $9F                          
      ldx  #$11                         
W970A:
      jsr  W9713                        
      dec  $9D                          
      dex                               
      bpl  W970A                        
      rts                               
W9713:
      lda  W9760,x                      
      bpl  W971F                        
      clc                               
      lda  $9F                          
      adc  $1A                          
      sta  $9F                          
W971F:
      ldy  $0E                          
      lda  $A3                          
      bne  W973A                        
      lda  $1F,x                        
      and  $18                          
      beq  W973A                        
      lda  $1A                          
      bpl  W9734                        
      lda  W9760,x                      
      bne  W9737                        
W9734:
      lda  W9772,x                      
W9737:
      and  #$7F                         
      tay                               
W973A:
      jsr  W9B4B                        
      cpy  $0E                          
      beq  W974C                        
      iny                               
      cpy  #$1D                         
      beq  W974C                        
      cpy  #$1E                         
      bne  W975F                        
      ldy  #$1C                         
W974C:
      lda  $1A                          
      eor  #$FF                         
      sec                               
      adc  $9F                          
      sta  $9F                          
      jsr  W9B4B                        
      clc                               
      lda  $9F                          
      adc  $1A                          
      sta  $9F                          
W975F:
      rts                               
W9760:                                  
      .byte $1A, $1B, $1B, $1B, $1C, $9C, $19, $19
      .byte $1A, $1A, $1B, $1B, $9C, $19, $1A, $9B
      .byte $19, $1B
W9772:
      .byte $1A, $19, $19, $19, $1D, $9D, $1B, $1B
      .byte $1A, $1A, $19, $19, $9D, $1B, $1A, $99
      .byte $1B, $19
W9784:
      .byte $A5, $04, $29, $01, $D0, $17, $A0, $21
      .byte $A2, $03, $B9, $C8, $48, $F0, $0B, $5D
      .byte $A2, $97, $99, $C8, $48, $CA, $10, $02
      .byte $A2, $03, $88, $10, $ED, $60, $CC
      dcp  ($66,x)                      ; Floating point accumulator #1: Sign
W97A5:
      ror  $98                          
      cpy  #$14                         
      bcs  W97B8                        
      eor  #$FF                         
      clc                               
      adc  #$14                         
      tax                               
      lda  $1F,x                        
      and  #$0F                         
      sta  $1F,x                        
      rts                               
W97B8:
      sec                               
      sbc  #$14                         
      tax                               
      lda  $1F,x                        
      and  #$F0                         
      sta  $1F,x                        
      rts                               
W97C3:
      dec  $70                          
      bpl  W97CB                        
      lda  #$17                         
      sta  $70                          
W97CB:
      ldy  $70                          
      ldx  #$03                         
      lda  $023A,y                      
      sta  $95                          
      lsr                               
      bcs  W97D9                        
      ldx  #$00                         
W97D9:
      stx  $46                          
      and  #$04                         
      beq  W97F4                        
      tya                               
      tax                               
      dec  $58,x                        
      bpl  W97EE                        
      jsr  W9835                        
      lda  $0252,y                      
      sta  $0058,y                      
W97EE:
      jsr  W9826                        
      jmp  W9806                        
W97F4:
      tya                               
      tax                               
      dec  $58,x                        
      bpl  W9803                        
      jsr  W9826                        
      lda  $0252,y                      
      sta  $0058,y                      
W9803:
      jsr  W9835                        
W9806:
      lda  $020A,y                      
      beq  W9823                        
      cmp  #$A0                         
      bcs  W9823                        
      sta  $9D                          
      lda  $0222,y                      
      beq  W9823                        
      cmp  #$BE                         
      bcs  W9823                        
      cmp  #$09                         
      bcc  W9823                        
      sta  $9F                          
      jmp  W98A8                        
W9823:
      jmp  W9844                        
W9826:
      ldx  $020A,y                      
      inx                               
      bit  $95                          
      bmi  W9830                        
      dex                               
      dex                               
W9830:
      txa                               
      sta  $020A,y                      
      rts                               
W9835:
      ldx  $0222,y                      
      inx                               
      bit  $95                          
      bvs  W983F                        
      dex                               
      dex                               
W983F:
      txa                               
      sta  $0222,y                      
      rts                               
W9844:
      lda  $0C                          
      cmp  #$03                         
      beq  W9853                        
      lda  #$50                         
      sta  $020A,y                      
      lda  #$4B                         
      bne  W9863                        
W9853:
      lda  $D004                        ; Position X sprite 2
      lsr                               
      clc                               
      adc  #$0C                         
      sta  $020A,y                      ; INPUT buffer of BASIC
      lda  $D005                        ; Position Y sprite 2
      sec                               
      sbc  #$2C                         
W9863:
      sta  $0222,y                      ; INPUT buffer of BASIC
      jsr  W9BAB                        
      sta  $023A,y                      
      jsr  W9BAB                        
      and  #$07                         
      tax                               
      lda  W987C,x                      
      sta  $0252,y                      
      sta  $0058,y                      
      rts                               
W987C:
      .byte $00, $01, $02, $03, $05, $06, $07
W9883:                                  
      .byte $7F
      lda  #$00                         
      sta  $1B                          
      lda  #$60                         
      sta  $1C                          
      ldy  #$00                         
W988E:
      tya                               
W988F:
      sta  ($1B),y                      
      dey                               
      bne  W988F                        
      inc  $1C                          
      lda  $1C                          
      cmp  #$80                         
      bne  W988E                        
      lda  #$76                         
      sta  $0E                          
      lda  #$02                         
      sta  $45                          
      jsr  W9B7F                        
      rts                               
W98A8:
      lda  #$FF                         
      sta  $95                          
W98AC:
      sty  $3A                          
      stx  $39                          
      lda  #$00                         
      sta  $9E                          
      lda  $9F                          
      lsr                               
      lsr                               
      lsr                               
      tax                               
      and  #$03                         
      tay                               
      lda  $9D                          
      and  #$FC                         
      asl                               
      rol  $9E                          
      adc  W9A23,y                      
      sta  $1B                          
      lda  W9A27,x                      
      adc  $9E                          
      sta  $1C                          
      lda  $9F                          
      and  #$07                         
      tay                               
      lda  $9D                          
      and  #$03                         
      tax                               
      lda  ($1B),y                      
      beq  W98E2                        
      bit  $95                          
      bpl  W98F9                        
W98E2:
      and  W98FA,x                      
      sta  $93                          
      lda  W98FA,x                      
      eor  #$FF                         
      ldx  $46                          
      and  W9902,x                      
      ora  $93                          
      sta  ($1B),y                      
      ldy  $3A                          
      ldx  $39                          
W98F9:
      rts                               
W98FA:                                  
      .byte $3F, $CF, $F3, $FC
W98FE:
      .byte $40, $10, $04, $01
W9902:
      .byte $00, $55, $AA, $FF
W9906:                                  
      .byte $A9, $00, $2C
W9909:
      lda  #$ff                        
      sta  $7B                          
      lda  $4C                          
      sta  $9D                          
      lda  $4D                          
      sta  $9F                          
      stx  $39                          
      lda  #$00                         
      ldx  #$03                         
      ldy  #$18                         
      jsr  W9967                        
      lda  $9D                          
      adc  #$08                         
      sta  $9D                          
      lda  #$06                         
      jmp  W996D                        
W992B:
      lda  #$00                         
W992D:
      bit  $FFA9                        
      sta  $7B                          
      lda  $50,x                        
      sta  $9D                          
      lda  $52,x                        
      sta  $9F                          
      stx  $39                          
      lda  #$0F                         
      ldx  #$02                         
      ldy  #$10                         
      jsr  W9967                        
      lda  $9D                          
      adc  #$08                         
      sta  $9D                          
      lda  #$15                         
      jmp  W996D                        
W9950:
      ldy  #$00
      .byte $2C                        
W9953:
      ldy #$FF                        
      sty  $7B                          
      ldy  $4E                          
      sty  $9D                          
      ldy  $4F                          
      sty  $9F                          
      stx  $39                          
      lda  #$1E                         
      ldx  #$01                         
      ldy  #$08                         
W9967:
      stx  $7A                          
      sty  $78                          
      sty  $79                          
W996D:
      ldy  $79                          
      sty  $78                          
      tax                               
      lda  $9D                          
      and  #$03                         
      tay                               
      txa                               
      asl                               
      asl                               
      asl                               
      adc  W9A41,y                      
      sta  $1F                          
      lda  W9A45,y                      
      adc  #$00                         
      sta  $20                          
      lda  $1F                          
      adc  #$18                         
      sta  $21                          
      lda  #$00                         
      sta  $9E                          
      adc  $20                          
      sta  $22                          
      lda  $9F                          
      and  #$07                         
      sta  $77                          
      lda  $9F                          
      lsr                               
      lsr                               
      lsr                               
      clc                               
      adc  $7A                          
      tax                               
      and  #$03                         
      tay                               
      lda  $9D                          
      and  #$FC                         
      asl                               
      rol  $9E                          
      adc  W9A23,y                      
      sta  $1B                          
      lda  W9A27,x                      
      adc  $9E                          
      sta  $1C                          
      lda  $1B                          
      adc  #$08                         
      sta  $1D                          
      lda  $1C                          
      adc  #$00                         
      sta  $1E                          
      lda  $77                          
      beq  W99FE                        
      dec  $78                          
      dec  $77                          
W99CE:
      ldy  $78                          
      lda  ($1F),y                      
      beq  W99E6                        
      ldy  $77                          
      bit  $7B                          
      bmi  W99DE                        
      ora  ($1B),y                      
      bne  W99E2                        
W99DE:
      eor  #$FF                         
      and  ($1B),y                      
W99E2:
      sta  ($1B),y                      
      ldy  $78                          
W99E6:
      lda  ($21),y                      
      beq  W99FA                        
      ldy  $77                          
      bit  $7B                          
      bmi  W99F4                        
      ora  ($1D),y                      
      bne  W99F8                        
W99F4:
      eor  #$FF                         
      and  ($1D),y                      
W99F8:
      sta  ($1D),y                      
W99FA:
      dec  $77                          
      bpl  W9A1C                        
W99FE:
      lda  $1B                          
      sec                               
      sbc  #$40                         
      sta  $1B                          
      lda  $1C                          
      sbc  #$01                         
      sta  $1C                          
      lda  $1B                          
      clc                               
      adc  #$08                         
      sta  $1D                          
      lda  $1C                          
      adc  #$00                         
      sta  $1E                          
      lda  #$07                         
      sta  $77                          
W9A1C:
      dec  $78                          
      bpl  W99CE                        
      ldx  $39                          
      rts                               
W9A23:
      .byte $00, $40, $80, $C0
W9A27:
      .byte $60, $61, $62, $63, $65, $66, $67, $68
      .byte $6A, $6B, $6C, $6D, $6F, $70, $71, $72
      .byte $74, $75, $76, $77, $79, $7A, $7B, $7C
      .byte $7E, $7F
W9A41:
      .byte $00, $38, $70, $A8
W9A45:
      .byte $18, $19, $1A, $1B
W9A49:
      lda  #$18                         
      sta  $1C                          
      lda  #$00                         
      sta  $1B                          
      tay                               
      ldx  #$04                         
W9A54:
      sta  ($1B),y                      
      dey                               
      bne  W9A54                        
      inc  $1C                          
      dex                               
      bpl  W9A54                        
      ldy  #$41                         
W9A60:
      lda  WB9EE,y                      
      sta  $1804,y                      
      dey                               
      bpl  W9A60                        
      ldy  #$3B                         
W9A6B:
      lda  WBA30,y                      
      sta  $187A,y                      
      dey                               
      bpl  W9A6B                        
      ldy  #$07                         
      lda  #$60                         
W9A78:
      sta  $18F0,y                      
      dey                               
      bpl  W9A78                        
      ldx  #$05                         
W9A80:
      lda  W9AAF,x                      
      sta  $1B,x                        
      dex                               
      bpl  W9A80                        
      ldx  #$04                         
      ldy  #$00                         
W9A8C:
      lda  #$00                         
      sta  $93                          
      lda  ($1B),y                      
      lsr                               
      ror  $93                          
      lsr                               
      ror  $93                          
      ora  ($1D),y                      
      sta  ($1D),y                      
      lda  $93                          
      ora  ($1F),y                      
      sta  ($1F),y                      
      iny                               
      bne  W9A8C                        
W9AA5:
      inc  $1C                          
      inc  $1E                          
      inc  $20                          
      dex                               
      bpl  W9A8C                        
      rts                               
W9AAF:
      .byte $00, $18, $38, $19, $50, $19
W9AB5:
      asl                               
      tay                               
      txa                               
      adc  $D000,y                      ; Position X sprite 0
      sta  $D000,y                      ; Position X sprite 0
      txa                               
      bmi  W9AD0                        
      bcc  W9ACF                        
W9AC3:
      tya                               
      lsr                               
      tay                               
      lda  $D010                        ; Position X MSB sprites 0..7
      eor  W9CA3,y                      
      sta  $D010                        ; Position X MSB sprites 0..7
W9ACF:
      rts                               
W9AD0:
      bcc  W9AC3                        
      rts                               
W9AD3:
      tax                               
      asl                               
      tay                               
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9CA3,x                      
      bne  W9AE5                        
      lda  $D000,y                      ; Position X sprite 0
      beq  W9AE4                        
      sec                               
W9AE4:
      rts                               
W9AE5:
      lda  #$57                         
      cmp  $D000,y                      ; Position X sprite 0
      rts                               
W9AEB:
      asl                               
      tax                               
      tya                               
      adc  $D001,x                      ; Position Y sprite 0
      sta  $D001,x                      ; Position Y sprite 0
      cmp  #$1D                         
      bcc  W9AFD                        
      lda  #$F9                         
      cmp  $D001,x                      ; Position Y sprite 0
W9AFD:
      rts                               
W9AFE:
      lda  #$7F                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cmp  #$7F                         
      bne  W9B1F                        
      sei                               
      lda  #$00                         
      sta  $D418                        ; Select volume and filter mode
W9B10:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      and  #$1F                         
      cmp  #$1F                         
      beq  W9B10                        
      lda  #$DF                         
      sta  $D418                        ; Select volume and filter mode
      cli                               
W9B1F:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      ldy  #$00                         
      ldx  #$00                         
      lsr                               
      bcs  W9B2A                        
      dey                               
W9B2A:
      lsr                               
      bcs  W9B2E                        
      iny                               
W9B2E:
      lsr                               
      bcs  W9B32                        
      dex                               
W9B32:
      lsr                               
      bcs  W9B36                        
      inx                               
W9B36:
      lsr                               
      stx  $16                          
      sty  $17                          
      ldx  #$00                         
      bcs  W9B45                        
      ldx  $36                          
      bne  W9B47                        
      ldx  #$80                         
W9B45:
      stx  $36                          
W9B47:
      rts                               
W9B48:
      sec                               
      bcs  W9B4C                        
W9B4B:
      clc                               
W9B4C:
      sty  $93                          
      ldy  $9F                          
      lda  W9690,y                      
      sta  $1B                          
      lda  W96A9,y                      
      sta  $1C                          
      ldy  $9D                          
      bcs  W9B66                        
      lda  ($1B),y                      
      beq  W9B66                        
      cmp  #$19                         
      bcc  W9B6D                        
W9B66:
      jsr  W9B70                        
      lda  $93                          
      sta  ($1B),y                      
W9B6D:
      ldy  $93                          
      rts                               
W9B70:
      lda  $1C                          
      eor  #$98                         
      sta  $1E                          
      lda  $1B                          
      sta  $1D                          
      lda  $44                          
      sta  ($1D),y                      
      rts                               
W9B7F:
      ldx  #$00                         
W9B81:
      lda  $45                          
      sta  $D800,x                      ; Color RAM
      sta  $D900,x                      ; Color RAM
      sta  $DA00,x                      ; Color RAM
      sta  $DAE8,x                      ; Color RAM
      lda  $0E                          ; Data type: case 0x80=Intero, case 0x00=Reale
      sta  $4000,x                      
      sta  $4100,x                      
      sta  $4200,x                      
      sta  $42E8,x                      
      dex                               
      bne  W9B81                        
      rts                               
W9BA1:
      lda  $D012                        
      ldx  #$04                         
W9BA6:
      sta  $11,x                        
      dex                               
      bpl  W9BA6                        
W9BAB:
      lda  #$E0                         
      and  $15                          
      ora  #$20                         
      sta  $15                          
      clc                               
      ldx  #$04                         
W9BB6:
      lda  $11,x                        
      adc  $11,x                        
      sta  $16,x                        
      dex                               
      bpl  W9BB6                        
      clc                               
      ldx  #$04                         
W9BC2:
      lda  $11,x                        
      adc  $16,x                        
      sta  $11,x                        
      dex                               
      bpl  W9BC2                        
      clc                               
      ldx  #$02                         
W9BCE:
      lda  $11,x                        
      adc  $18,x                        
      sta  $11,x                        
      dex                               
      bpl  W9BCE                        
      lda  $11                          
      rts                               
W9BDA:
      eor  #$FF                         
      clc                               
      adc  #$01                         
      rts                               
W9BE0:
      sty  $3A                          
      stx  $39                          
      jsr  W9C79                        
      ldx  $3A                          
      lda  $A0                          
      lsr  $A1                          
      ror                               
      and  #$F8                         
      sta  $A0                          
W9BF2:
      jsr  W9C89                        
      lda  $9D                          
      lsr  $9E                          
      ror                               
      and  #$F8                         
      sta  $9D                          
      lda  $9F                          
      lsr                               
      and  #$F8                         
      sta  $9F                          
      lda  $A2                          
      lsr                               
      and  #$F8                         
      sta  $A2                          
      sec                               
      ldy  #$00                         
      lda  $A0                          
      sbc  $9D                          
      sta  $8B                          
      beq  W9C1C                        
      iny                               
      bcs  W9C1C                        
      ldy  #$FF                         
W9C1C:
      sty  $8D                          
      sec                               
      ldy  #$00                         
      lda  $A2                          
      sbc  $9F                          
      sta  $8C                          
      beq  W9C2E                        
      iny                               
      bcs  W9C2E                        
      ldy  #$FF                         
W9C2E:
      sty  $8E                          
      beq  W9C5B                        
      bpl  W9C3B                        
      eor  #$FF                         
      clc                               
      adc  #$01                         
      sta  $8C                          
W9C3B:
      lda  $8B                          
      beq  W9C5B                        
      bpl  W9C48                        
      eor  #$FF                         
      clc                               
      adc  #$01                         
      sta  $8B                          
W9C48:
      cmp  $8C                          
      beq  W9C5B                        
      bcs  W9C6A                        
      lda  $8D                          
      sta  $37                          
      lda  $8E                          
      asl                               
      clc                               
      adc  $8E                          
      jmp  W9C63                        
W9C5B:
      lda  $8D                          
      asl                               
      sta  $37                          
      lda  $8E                          
      asl                               
W9C63:
      sta  $38                          
W9C65:
      ldy  $3A                          
      ldx  $39                          
      rts                               
W9C6A:
      lda  $8E                          
      sta  $38                          
      lda  $8D                          
      asl                               
      clc                               
      adc  $8D                          
      sta  $37                          
      jmp  W9C65                        
W9C79:
      ldx  #$00                         
W9C7B:
      jsr  W9C89                        
      sta  $A0                          
      lda  $9E                          
      sta  $A1                          
      lda  $9F                          
      sta  $A2                          
      rts                               
W9C89:
      txa                               
      asl                               
      tay                               
      lda  $D001,y                      ; Position Y sprite 0
      sta  $9F                          
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9CA3,x                      
      beq  W9C9B                        
      lda  #$01                         
W9C9B:
      sta  $9E                          
      lda  $D000,y                      ; Position X sprite 0
      sta  $9D                          ; Flag: 80=direct mode 00=program mode
      rts                               
W9CA3:
      .byte $01, $02, $04, $08, $10, $20, $40, $80
W9CAB:
      .byte $FE, $FD, $FB, $F7, $EF, $DF, $BF, $7F
W9CB3:
      lda  $0C                      
      beq  W9CBB                        
      cmp  #$03                         
      bne  W9D21                        
W9CBB:
      ldy  #$27                         
      lda  #$0F                         
W9CBF:
      sta  $D800,y                      ; Color RAM
      sta  $DBC0,y                      ; Color RAM
      dey                               
      bpl  W9CBF                        
      ldx  $A4                          
      ldy  W9DF5,x                      
      ldx  #$06                         
W9CCF:
      lda  W9E1B,y                      
      sta  $43C7,x                      
      lda  W9DFF,x                      
      sta  $4000,x                      
      lda  W9E06,x                      
      sta  $401B,x                      
      lda  W9E0D,x                      
      sta  $43D2,x                      
      lda  W9E14,x                      
      sta  $43C0,x                      
      dey                               
      dex                               
      bpl  W9CCF                        
      ldx  $0C                          ; Flag: default dimension for DIM
      ldy  W9DFB,x                      
      ldx  #$0C                         
W9CF8:
      lda  W9E45,y                      
      sta  $43DB,x                      
      dey                               
      dex                               
      bpl  W9CF8                        
      lda  $0D                          
      and  #$F0                         
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      adc  #$33                         
      sta  $43D5                        
      lda  $0D                          
      and  #$0F                         
      adc  #$33                         
      sta  $43D6                        
      jsr  W9EF2                        
      jsr  W9F48+1                      
      jmp  W9E81                        
W9D21:
      lda  #$30                         
      sta  $1B                          
      lda  #$60                         
      sta  $1C                          
      ldx  #$06                         
W9D2B:
      lda  W9DFF,x                      
      jsr  W9DC7                        
      dex                               
      bpl  W9D2B                        
      lda  #$08                         
      sta  $1B                          
      lda  #$61                         
      sta  $1C                          
      ldx  #$06                         
W9D3E:
      lda  W9E06,x                      
      jsr  W9DC7                        
      dex                               
      bpl  W9D3E                        
      lda  #$A0                         
      sta  $1B                          
      lda  #$7E                         
      sta  $1C                          
      ldx  #$02                         
W9D51:
      lda  W9E0D,x                      
      jsr  W9DC7                        
      dex                               
      bpl  W9D51                        
      lda  #$68                         
      sta  $1B                          
      lda  #$7E                         
      sta  $1C                          
      ldx  $A4                          
      ldy  W9DF5,x                      
      ldx  #$06                         
W9D69:
      lda  W9E1B,y                      
      jsr  W9DC7                        
      dey                               
      dex                               
      bpl  W9D69                        
      lda  #$28                         
      sta  $1B                          
      lda  #$7E                         
      sta  $1C                          
      ldx  #$05                         
W9D7D:
      lda  W9E14,x                      
      jsr  W9DC7                        
      dex                               
      bpl  W9D7D                        
      lda  #$38                         
      sta  $1B                          
      lda  #$7F                         
      sta  $1C                          
      ldx  $0C                          
      ldy  W9DFB,x                      
      ldx  #$0C                         
W9D95:
      lda  W9E45,y                      
      jsr  W9DC7                        
      dey                               
      dex                               
      bpl  W9D95                        
      lda  #$B0                         
      sta  $1B                          
      lda  #$7E                         
      sta  $1C                          
      lda  $0D                          
      and  #$0F                         
      clc                               
      adc  #$33                         
      jsr  W9DC7                        
      lda  $0D                          
      and  #$F0                         
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      adc  #$33                         
      jsr  W9DC7                        
      jsr  W9F12                        
      jsr  W9F53                        
      jmp  W9E9E                        
W9DC7:
      sty  $3A                          
      ldy  #$00                         
      sty  $1E                          
      asl                               
      asl                               
      asl                               
      rol  $1E                          
      adc  #$F6                         
      sta  $1D                          
      lda  #$B7                         
      adc  $1E                          
      sta  $1E                          
      ldy  #$07                         
W9DDE:
      lda  ($1D),y                      
      sta  ($1B),y                      
      dey                               
      bpl  W9DDE                        
      lda  $1B                          
      sec                               
      sbc  #$08                         
      sta  $1B                          
      lda  $1C                          
      sbc  #$00                         
      sta  $1C                          
      ldy  $3A                          
      rts                               
W9DF5:                                  
      .byte $06, $0D, $14, $1B, $22, $29
W9DFB:
      .byte $0C, $19, $26, $33
W9DFF:
      .byte $00, $2F, $21, $2C, $2E, $23, $3D
W9E06:                                  
      .byte $26, $2F, $21, $2C, $2E, $23, $3D
W9E0D:
      .byte $2A, $2F, $3D, $00, $00, $00, $00
W9E14:
      .byte $00, $2F, $2D, $1F, $21, $23, $00
W9E1B:
      .byte $21, $1F, $22, $23, $30, $00, $00, $21
      .byte $1F, $2D, $30, $1F, $27, $2B, $21, $2C
      .byte $29, $2C, $2B, $23, $29, $25, $23, $2B
      .byte $23, $2E, $1F, $29, $32, $1F, $2E, $2E
      .byte $27, $2C, $2E, $1F, $31, $23, $2B, $25
      .byte $23, $2E
W9E45:
      .byte $1F, $2F, $30, $2E, $2C, $00, $20, $1F
      .byte $30, $30, $29, $23, $2F, $00, $29, $1F
      .byte $2F, $23, $2E, $00, $1F, $30, $30, $1F
      .byte $21, $28, $00, $00, $00, $2F, $2D, $1F
      .byte $21, $23, $00, $32, $1F, $2E, $2D, $00
      .byte $00, $00, $00, $24, $29, $1F, $25, $00
      .byte $2F, $26, $27
W9E78:
      .byte $2D
      lda  $0C                          
      beq  W9E81                        
      cmp  #$03                         
      bne  W9E9E                        
W9E81:
      ldy  #$05                         
      lda  $0E                          
W9E85:
      sta  $4011,y                      
      dey                               
      bpl  W9E85                        
      lda  $C0                          
      bmi  W9E9D                        
      and  #$07                         
      tax                               
      dex                               
      bmi  W9E9D                        
      lda  #$3E                         
W9E97:
      sta  $4011,x                      
      dex                               
      bpl  W9E97                        
W9E9D:
      rts                               
W9E9E:
      ldy  #$2F                         
      lda  #$00                         
W9EA2:
      sta  $6088,y                      
      dey                               
      bpl  W9EA2                        
      lda  $C0                          
      bmi  W9E9D                        
      and  #$07                         
      tax                               
      dex                               
      bmi  W9E9D                        
      lda  #$88                         
      sta  $1B                          
      lda  #$60                         
      sta  $1C                          
      clc                               
W9EBB:
      ldy  #$06                         
W9EBD:
      lda  WB9E6,y                      
      sta  ($1B),y                      
      dey                               
      bpl  W9EBD                        
      lda  $1B                          
      adc  #$08                         
      sta  $1B                          
      dex                               
      bpl  W9EBB                        
      rts                               
W9ECF:
      lda  $AC                          
      bmi  W9F38                        
      sed                               
      clc                               
      lda  W9F39,x                      
      adc  $B1                          
      sta  $B1                          
      lda  W9F41,x                      
      adc  $B2                          
      sta  $B2                          
      lda  $B3                          
      adc  #$00                         
      sta  $B3                          
      cld                               
      lda  $0C                          
      beq  W9EF2                        
      cmp  #$03                         
      bne  W9F12                        
W9EF2:
      ldy  #$00                         
W9EF4:
      ldx  #$02                         
W9EF6:
      lda  $B1,x                        
      and  #$F0                         
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      adc  #$33                         
      sta  $4007,y                      
      iny                               
      lda  $B1,x                        
      and  #$0F                         
      adc  #$33                         
      sta  $4007,y                      
      iny                               
      dex                               
      bpl  W9EF6                        
      rts                               
W9F12:
      lda  #$60                         
      sta  $1B                          
      sta  $1C                          
W9F18:
      ldy  #$00                         
W9F1A:
      lda  $00B1,y                      
      and  #$0F                         
      clc                               
      adc  #$33                         
      jsr  W9DC7                        
      lda  $00B1,y                      
      and  #$F0                         
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      adc  #$33                         
      jsr  W9DC7                        
      iny                               
      cpy  #$03                         
      bne  W9F1A                        
W9F38:
      rts                               
W9F39:                                  
      .byte $20, $50, $00, $50, $00, $50, $00, $00
W9F41:
      .byte $00, $00, $01, $01, $02, $02, $03
W9F48:
      .byte $10
      jsr  W9F63                        
      ldy  #$1B                         
      jsr  W9EF4                        
      bmi  W9F63                        
W9F53:
      jsr  W9F63                        
      lda  #$38                         
      sta  $1B                          
      lda  #$61                         
      sta  $1C                          
      ldx  #$06                         
      jsr  W9F18                        
W9F63:
      ldx  #$02                         
W9F65:
      lda  $B1,x                        
      ldy  $B4,x                        
      sta  $B4,x                        
      sty  $B1,x                        
      dex                               
      bpl  W9F65                        
      rts                               
W9F71:
      lda  $08                          
      and  #$0F                         
      bne  W9F89                        
      lda  $0C                          
      cmp  #$01                         
      beq  W9FC0                        
      dec  $09                          
      bmi  W9F8A                        
      ldy  $09                          
      lda  WA0A7,y                      
      sta  $43F8                        
W9F89:
      rts                               
W9F8A:
      lda  $0C                          
      bne  W9F94                        
      lda  #$18                         
      sta  $F5                          
      bne  W9FA0                        
W9F94:
      cmp  #$02                         
      bne  W9FA0                        
      lda  #$FE                         
      and  $D015                        
      sta  $D015                        
W9FA0:
      lda  #$40                         
      sta  $43F8                        
      lda  $AC                          
      bmi  W9FBF                        
      lda  #$AA                         
      sta  $D000                        ; Position X sprite 0
      lda  #$DA                         
      sta  $D001                        ; Position Y sprite 0
      lda  #$FE                         
      and  $D010                        ; Position X MSB sprites 0..7
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  $07                          ; Search char
      sta  $02                          
W9FBF:
      rts                               
W9FC0:
      ldx  $86                          
      dec  $09                          
      bmi  W9FCF                        
      ldy  $09                          
      lda  WA0A7,y                      
      sta  $43F8,x                      
      rts                               
W9FCF:
      lda  $87                          
      bmi  W9FE8                        
      lda  W9CAB,x                      
      and  $D015                        
      sta  $D015                        
W9FDC:
      lda  #$48                         
      sta  $4C                          
      lda  #$A8                         
      sta  $4D                          
      jsr  W9906                      
      rts                               
W9FE8:
      lda  #$00                         
      sta  $D017                        
      lda  #$46                         
      sta  $43F8                        
      lda  #$03                         
      sta  $58                          
      bne  W9FDC                        
W9FF8:
      lda  $0A                          
      bmi  WA010                        
      lda  $08                          
      and  #$03                         
      bne  WA010                        
      ldx  $0B                          
      dec  $0A                          
      bmi  WA011                        
      ldy  $0A                          
      lda  WA0AC,y                      
      sta  $43F8,x                      
WA010:
      rts                               
WA011:
      lda  #$FF                         
      sta  $0B                          
      lda  W9CAB,x                      
      and  $D015                        
      sta  $D015                        
      rts                               
WA01F:
      lda  #$08                         
      sta  $FA                          
      lda  #$0C                         
      sta  $F5                          
WA027:
      ldy  $0B                          
      bmi  WA034                        
      lda  W9CAB,y                      
      and  $D015                        
      sta  $D015                        
WA034:
      stx  $0B                          
      lda  #$56                         
      sta  $43F8,x                      
      lda  #$04                         
      sta  $0A                          
      rts                               
WA040:
      lda  $09                          
      bpl  WA0A6                        
      jsr  W9909                      
      ldx  #$07                         
      stx  $87                          
WA04B:
      lda  $58,x                        
      bmi  WA055                        
      dex                               
      bpl  WA04B                        
      stx  $87                          
      inx                               
WA055:
      stx  $86                          
      lda  #$00                         
      sta  $9E                          
      txa                               
      asl                               
      tay                               
      lda  $4C                          
      asl                               
      rol  $9E                          
      adc  #$18                         
      sta  $D000,y                      
      lda  $9E                          
      adc  #$00                         
      beq  WA076                        
      lda  W9CA3,x                      
      ora  $D010                        ; Position X MSB sprites 0..7
      bne  WA07C                        
WA076:
      lda  W9CAB,x                      
      and  $D010                        ; Position X MSB sprites 0..7
WA07C:
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  $4D                          
      adc  #$32                         
      sta  $D001,y                      ; Position Y sprite 0
      lda  W9CA3,x                      
      sta  $D017                        ; (2X) vertical expansion (Y) sprite 0..7
      ora  $D015                        ; Sprites Abilitator
      sta  $D015                        ; Sprites Abilitator
      lda  #$56                         
      sta  $43F8,x                      
      lda  #$FF                         
      sta  $58,x                        ; Scratch for numeric operation
      cpx  $0B                          
      bne  WA0A3                        
      lda  #$FF                         
      sta  $0A                          
WA0A3:
      jmp  W9344                        
WA0A6:
      rts                               
WA0A7:                                  
      .byte $5A, $59, $58, $57, $56
WA0AC:
      .byte $5A, $59, $57, $56, $AD, $19, $D0, $10
      .byte $06, $8D, $19, $D0, $20, $C1, $A0, $68
      .byte $A8, $68, $AA, $68, $40
      ldx  #$02                         
      ldy  $F5                          
      bne  WA0EB                        
      lda  $EB                          
      bne  WA0CE                        
      jmp  WA15E                        
WA0CE:
      lda  $D41C                        
      bne  WA127                        
      sta  $D412                        
      lda  #$11                         
      sta  $D412                        
      lda  $EB                          
      cmp  #$0F                         
      beq  WA127                        
      dec  $EB                          
      bne  WA127                        
      jsr  WA259                        
      jmp  WA15E                        
WA0EB:
      jsr  WA1FF                        
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $F5                          ; Vector: keyboard decode table
      sta  $D413                        ; Generator 3: Attack/Decay
      sta  $EB                          
      sta  $D412                        ; Voice 3: Control registers
      sta  $D414                        ; Generator 3: Sustain/Release
      ldy  #$0A                         
      lda  ($C3),y                      ; Transient tape load
      sec                               
      sbc  $FE                          
      sta  $D413                        
      jsr  WA1F8                        
      sta  $F2                          
      jsr  WA1F8                        
      sta  $F1                          
      lda  #$11                         
      sta  $D412                        
      jsr  WA1D3                        
      jsr  WA1DC                        ; BASIC ROM
      dey                               
      lda  ($C3),y                      
      and  #$7F                         
      jsr  WA22C+1                      
WA127:
      clc                               
      lda  $D41C                        
      sta  $F6                          
      ldy  #$00                         
      lda  ($C3),y                      
      bpl  WA13A                        
      lda  $D41B                        ; Random numbers generator oscillator 3
      adc  $F6                          ; Vector: keyboard decode table
      sta  $F6                          
WA13A:
      lda  #$00                         
      rol                               
      jsr  WA23C                        
      jsr  WA24E                        
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      sty  $D400                        ; Voice 1: Frequency control (lo byte)
      lda  $D41C                        ; Generator output
      sta  $F6                          
      lda  #$00                         
      jsr  WA23C                        
      ldx  #$06                         
      jsr  WA24E                        
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      sty  $D40E                        ; Voice 3: Frequency control (lo byte)
WA15E:
      ldx  #$04                         
      ldy  $FA                          ; RS-232 output buffer pointer
      bne  WA16D                        
      lda  $EC                          
      bne  WA1A5                        
      lda  $FF                          
      bne  WA1A5                        
      rts                               
WA16D:
      jsr  WA1FF                        
      lda  WA2FB,y                      
      sta  $F9                          
      lda  #$00                         
      sta  $D40B                        ; Voice 2: Control registers
      sta  $EC                          ; Table of screen line/Transient editor
      sta  $FA                          
      lda  #$01                         
      sta  $F8                          
      lda  WA305,y                      
      sta  $FF                          
      ldy  #$0C                         
      jsr  WA1F1                        ; BASIC ROM
      jsr  WA1F1                        
      jsr  WA1F1                        
      sta  $F4                          
      jsr  WA1F1                        
      sta  $F3                          
      jsr  WA1D3                        
      jsr  WA1DC                        
      dey                               
      lda  ($C1),y                      
      jsr  WA22C+1                      
WA1A5:
      lda  $FF                          
      sta  $F6                          
      lda  #$00                         
      jsr  WA23C                        
      jsr  WA24E                        
      sta  $D408                        ; Voice 2: Frequency control (hi byte)
      sty  $D407                        ; Voice 2: Frequency control (lo byte)
      lda  $FF                          ; Transient data area of BASIC
      sta  $F6                          
      lda  #$00                         
      jsr  WA23C                        
      ldx  #$08                         
      jsr  WA24E                        
      sta  $D416                        
      sty  $D415                        
      lda  $FF                          
      jsr  WA20E                        
      sta  $FF                          
      rts                               
WA1D3:
      txa                               
      lsr                               
      tay                               
      lda  WA228,y                      
      sta  $C7                          
      rts                               
WA1DC:
      ldy  #$07                         
WA1DE:
      lda  ($C1),y                      
      dey                               
      sta  ($C7),y                      ; Flag: Write inverse chars: 1=yes 0=not used
      cpy  #$02                         
      bne  WA1DE                        
      lda  ($C1),y                      
      sta  ($DF,x)                      
      dey                               
      lda  ($C1),y                      
      sta  ($D7,x)                      
      rts                               
WA1F1:
      dey                               
      lda  ($C5),y                      
      sta  $D40D,y                      
      rts                               
WA1F8:
      dey                               
      lda  ($C3),y                      
      sta  $D406,y                      
      rts                               
WA1FF:
      lda  WA3C3,y                      
      sta  ($C7,x)                      
      sta  $C1                          
      lda  WA3DC,y                      
      sta  ($CB,x)                      
      sta  $C2                          
      rts                               
WA20E:
      lsr  $F8                          
      bcs  WA21C                        
      adc  $F9                          
      bcc  WA226                        
      dec  $EC                          
      beq  WA26E                        
      lda  #$FF                         
WA21C:
      sbc  $F9                          
      bcs  WA226                        
      dec  $EC                          
      beq  WA26E                        
      lda  #$01                         
WA226:
      rol  $F8                          
WA228:
      rts                               
      brk                               
      slo  $0E                          
WA22C:
      ora  $A8,x                        
      and  #$F0                         
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      sta  ($CF,x)                      
      tya                               
      and  #$0F                         
      sta  ($D3,x)                      
      rts                               
WA23C:
      sta  $F7                          
      lda  ($CF,x)                      
      tay                               
      bne  WA246                        
      sty  $F6                          
      rts                               
WA246:
      asl  $F6                          
      rol  $F7                          
      dey                               
      bne  WA246                        
      rts                               
WA24E:
      lda  ($D7,x)                      
      clc                               
      adc  $F6                          
      tay                               
      lda  ($DF,x)                      
      adc  $F7                          
      rts                               
WA259:
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D412                        ; Voice 3: Control registers
      sta  $D413                        ; Generator 3: Attack/Decay
      sta  $D414                        ; Generator 3: Sustain/Release
      ldy  #$0B                         
      lda  ($C3),y                      
      sta  $F5                          
      rts                               
WA26E:
      lda  #$00                         
      sta  $D40B                        
      ldy  #$0C                         
      lda  ($C5),y                      
      sta  $FA                          
      rts                               
      .byte $42, $00, $04, $00, $00, $81, $0C, $00
      .byte $00, $A8, $B2, $BF, $02, $61, $00, $0C
      .byte $00, $00, $11, $00, $A0, $00, $78, $F2
      .byte $CF, $00, $92, $00, $00, $00, $0C, $41
      .byte $00, $70, $00, $00, $00, $0F, $04, $11
      .byte $00, $02, $00, $00, $81, $00, $F0, $00
      .byte $7A, $82, $EF, $00, $52, $00, $14, $77
      .byte $08, $43, $00, $A0, $00, $8A, $F2, $AF
      .byte $00, $11, $00, $04, $00, $08, $41, $0D
      .byte $00, $00, $28, $F2, $EF, $00, $61, $00
      .byte $00, $00, $00, $81, $07, $40, $00, $00
      .byte $00, $0F, $00, $21, $00, $01, $00, $00
      .byte $81, $0B, $00, $00, $D0, $02, $9F, $00
      .byte $62, $00, $03, $00, $00, $15, $00, $F0
      .byte $00, $A0, $0A, $0A, $0A, $61, $00, $00
      .byte $00, $00, $81, $0B, $30, $00, $80, $02
      .byte $0A
WA2FB:
      .byte $00, $09, $08, $30, $08, $20, $01, $03
      .byte $04, $04
WA305:                                  
      .byte $01, $55, $FF, $01, $FF, $01, $FF, $FF
      .byte $FF, $01, $FF, $11, $55, $01, $00, $00
      .byte $81, $0C, $00, $00, $00, $0A, $00, $91
      .byte $00, $02, $00, $00, $81, $0B, $00, $00
      .byte $10, $0A, $00, $71, $00, $06, $00, $00
      .byte $15, $0C, $00, $00, $02, $C0, $0E, $91
      .byte $00, $02, $00, $00, $81, $0F, $00, $00
      .byte $02, $0F, $00, $1F, $00, $18, $00, $08
      .byte $43, $00, $20, $00, $0A, $87, $00, $51
      .byte $00, $1D, $00, $07, $43, $00, $20, $00
      .byte $08, $C0, $00, $D1, $00, $20, $00, $08
      .byte $41, $00, $30, $00, $01, $8B, $00, $41
      .byte $00, $04, $00, $00, $15, $00, $50, $55
      .byte $02, $B0, $00, $51, $00, $07, $00, $00
      .byte $15, $00, $60, $40, $04, $9A, $00, $71
      .byte $00, $06, $00, $00, $13, $00, $40, $00
      .byte $00, $80, $00, $61, $80, $0D, $00, $08
      .byte $43, $00, $20, $00, $03, $0A, $00, $61
      .byte $00, $16, $00, $00, $13, $00, $40, $40
      .byte $00, $80, $00, $D1, $80, $02, $00, $00
      .byte $13, $00, $60, $30, $01, $0A, $00, $01
      .byte $00, $01, $00, $08, $41, $08, $00, $00
      .byte $00, $08, $19, $01, $25, $01, $00, $08
      .byte $41, $08, $00, $00, $00, $08
WA3C3:
      .byte $18, $7A, $87, $94, $A1, $AE, $BB, $C8
      .byte $D5, $E2, $EF, $10, $1C, $28, $34, $40
      .byte $4C, $58, $64, $70, $7C, $88, $94, $A0
      .byte $AC
WA3DC:
      .byte $B8, $A2, $A2, $A2, $A2, $A2, $A2, $A2
      .byte $A2, $A2, $A2, $A3, $A3, $A3, $A3, $A3
      .byte $A3, $A3, $A3, $A3, $A3, $A3, $A3, $A3
      .byte $A3, $A3
WA3F6:
      sei
      lda  #$00                         
      sta  $D418                        
      ldy  #$2D                         
WA3FE:
      lda  WA524,y                      
      sta  $D000,y                      
      dey                               
      bpl  WA3FE                        
      ldy  #$04                         
      ldx  #$05                         
WA40B:
      lda  #$10                         
      sta  $0052,y                      
      lda  WA557,y                      
      sta  $004D,y                      
      lda  #$FF                         
      sta  $0048,y                      
      lda  WA552,y                      
      sta  $43F8,y                      
      stx  $57,y                        
      dex                               
      dey                               
      bpl  WA40B                        
      sty  $AC                          
      stx  $0E                          
      stx  $0C                          
      stx  $A4                          
      stx  $0D                          
      stx  $C0                          
      inx                               
      stx  $45                          
      jsr  W9B7F                        
      jsr  W8217                        
      jsr  W9CBB                        
      lda  #$04                         
      sta  $AD                          
      sta  $4C                          
      sta  $5D                          
      lda  #$17                         
      sta  $5C                          
      tay                               
WA44C:
      lda  WA55C,y                      
      sta  $42B0,y                      
      lda  WA58C,y                      
      sta  $4351,y                      
      lda  WA574,y                      
      sta  $4329,y                      
      dey                               
      bpl  WA44C                        
      lda  $0209                        
      beq  WA471                        
      ldy  #$1B                         
WA468:
      lda  WA764,y                      
      sta  $425E,y                      
      dey                               
      bpl  WA468                        
WA471:
      lda  #$02                         
      sta  $02                          
WA475:
      lda  $AB                          
      bne  WA47E                        
      jsr  $C006                        
      bne  WA475                        
WA47E:
      lda  $D012                        
      cmp  #$F0                         
      bne  WA47E                        
      jsr  W95CC                        
      jsr  W9B1F                        
      lda  $36                          
      bpl  WA492                        
      jmp  W809D                        
WA492:
      lda  $57                          
      bmi  WA4B9                        
      lda  #$7D                         
      sta  $DC00                        
      lda  $DC01                        
      cmp  #$5B                         
      bne  WA4A7                        
      lda  #$FF                         
      sta  $0209                        
WA4A7:
      jsr  WA4D6                        
      lda  $57                          
      bpl  WA47E                        
      ldy  #$00                         
      jsr  WA81C                        
      lda  #$FF                         
      sta  $02                          
      bne  WA47E                        
WA4B9:
      dec  $02                          
      bne  WA47E                        
WA4BD:
      lda  $AB                          
      bne  WA4C6                        
      jsr  $C006                        
      bmi  WA4BD                        
WA4C6:
      jsr  WA66A                        
      dec  $0C                          
      jsr  W8196                      
      lda  #$DF                         
      sta  $D418                        
      jmp  W80A7                        
WA4D6:
      dec  $5C                          
      bpl  WA4E6                        
      lda  #$17                         
      sta  $5C                          
      dec  $5D                          
      bmi  WA4E6                        
      ldx  $5D                          
      sta  $48,x                        
WA4E6:
      ldx  #$04                         
WA4E8:
      stx  $39                          
      txa                               
      asl                               
      sta  $3A                          
      lda  $48,x                        
      bmi  WA51E                        
      lda  $57,x                        
      bmi  WA51E                        
      dec  $52,x                        
      bpl  WA506                        
      lda  $4D,x                        
      eor  #$FF                         
      sta  $4D,x                        
      lda  #$0F                         
      sta  $52,x                        
      dec  $57,x                        
WA506:
      lda  $52,x                        
      eor  $4D,x                        
      and  #$0F                         
      tay                               
      lda  W8895,y                      
      ldy  $3A                          
      clc                               
      adc  #$28                         
      sta  $D001,y                      ; Position Y sprite 0
      txa                               
      ldx  #$FD                         
      jsr  W9AB5                      
WA51E:
      ldx  $39                          
      dex                               
      bpl  WA4E8                        
      rts                               
WA524:
      rts                               
      .byte $58, $60, $58, $60, $58, $60, $58, $60
      .byte $58, $38, $80, $20, $80, $00, $00, $5F
      .byte $1B, $64, $00, $00, $1F, $D8, $FF, $02
      .byte $00, $01, $00, $F0, $0F, $00, $00, $00
      .byte $00, $07, $00, $00, $07, $02, $02, $02
      .byte $02, $02, $06, $06, $06
WA552:
      .byte $5E, $5D, $5C, $5B, $41
WA557:
      .byte $00, $FF, $00, $FF, $00
WA55C:
      .byte $50, $55, $53, $48, $00, $54, $48, $45
      .byte $00, $4A, $4F, $59, $53, $54, $49, $43
      .byte $4B, $00, $42, $55, $54, $54, $4F, $4E
WA574:
      .byte $00, $68, $43, $69, $00, $71, $79, $78
      .byte $73, $00, $43, $4F, $4D, $4D, $4F, $44
      .byte $4F, $52, $45, $00, $00, $00, $00, $00
WA58C:
      .byte $68, $43, $69, $00, $71, $79, $78, $70
      .byte $00, $42, $41, $4C, $4C
      eor  $4D6F,y                      
      eor  #$44                         
      sre  $41,x                        ; Pointer: DATA current element address
      eor  $0000,y                      
      brk                               
WA5A4:
      sed                               
      ldx  #$06                         
      ldy  #$03                         
WA5A9:
      lda  $B1                          ; Constant of tape time misure
      sbc  $B4,x                        
      lda  $B2                          
      sbc  $B5,x                        
      lda  $B3                          
      sbc  $B6,x                        
      bcc  WA5BD                        
      dex                               
      dex                               
      dex                               
      dey                               
      bne  WA5A9                        
WA5BD:
      cld                               
      sty  $3A                          
      cpy  #$03                         
      bne  WA5C7                        
      jmp  WA3F6                      
WA5C7:
      cpy  #$02                         
      beq  WA5E1                        
      lda  WA745+1,y                    
      sta  $95                          
      ldx  #$08                         
WA5D2:
      lda  $B1,x                        
      sta  $B4,x                        
      lda  $01FD,x                      
      sta  $0200,x                      
      dex                               
      cpx  $95                          
      bne  WA5D2                        
WA5E1:
      ldy  $3A                          
      lda  WA745+1,y                    
      tax                               
      ldy  #$02                         
WA5E9:
      lda  $00B1,y                      
      sta  $B4,x                        
      lda  #$40                         
      sta  $0200,x                      
      dex                               
      dey                               
      bpl  WA5E9                        
      jsr  WA68D                        
      ldy  $3A                          
      lda  WA743,y                      
      sta  $9F                          
      lda  #$0C                         
      sta  $9D                          
      jsr  WA65F                        
WA608:
      ldx  $94                          
      lda  #$02                         
      sta  $03                          
      ldy  #$7F                         
      jsr  W9B48                        
WA613:
      ldy  #$40                         
WA615:
      lda  $D012                        
      cmp  #$FF                         
      bne  WA615                        
      dey                               
      bne  WA615                        
      jsr  W9B1F                        
      lda  $36                          
      bmi  WA64E                        
      dec  $02                          
      bne  WA62E                        
      dec  $03                          
      beq  WA65C                        
WA62E:
      clc                               
      ldx  $94                          
      lda  $16                          
      beq  WA613                        
      adc  $0200,x                      
      cmp  #$3F                         
      bne  WA63E                        
      lda  #$5A                         
WA63E:
      cmp  #$5B                         
      bcc  WA644                        
      lda  #$40                         
WA644:
      sta  $0200,x                      
      tay                               
      jsr  W9B48                        
      jmp  WA613                        
WA64E:
      lda  #$02                         
      sta  $36                          
      dec  $94                          
      inc  $9D                          
      lda  $94                          
      cmp  $95                          
      bne  WA608                        
WA65C:
      jmp  WA3F6                      
WA65F:
      lda  WA745+1,y                    
      sta  $94                          
      sec                               
      sbc  #$03                         
      sta  $95                          
      rts                               
WA66A:
      jsr  WA68D                        
      jsr  WA7E5                        
      lda  #$1E                         
      sta  $39                          
WA674:
      jsr  W9B1F                        
      lda  $36                          
      bpl  WA67E                        
      jmp  W809D                        
WA67E:
      ldx  #$FF                         
WA680:
      ldy  #$FF                         
WA682:
      dey                               
      bne  WA682                        
      dex                               
      bne  WA680                        
      dec  $39                          
      bne  WA674                        
      rts                               
WA68D:
      lda  #$00                         
      lda  $D012                        
      cmp  #$FA                         
      bne  WA68D                        
      sta  $D418                        
      lda  #$41                         
      sta  $43FD                        
      sta  $43FE                        
      ldx  #$2B                         
WA6A3:
      lda  WA524,x                      
      sta  $D000,x                      
      dex                               
      bpl  WA6A3                        
      inx                               
      stx  $0E                          
      lda  #$60                         
      sta  $D015                        
      jsr  W9B7F                        
      jsr  W9CBB                        
      jsr  WA749                        
      lda  #$07                         
      sta  $44                          
      lda  $0209                        
      beq  WA6DF                        
      ldy  #$1B                         
WA6C8:
      lda  WA764,y                      
      sta  $42D6,y                      
      lda  WA780,y                      
      sta  $4326,y                      
      lda  #$01                         
      sta  $DAD6,y                      
      sta  $DB26,y                      
      dey                               
      bpl  WA6C8                        
WA6DF:
      ldx  #$13                         
WA6E1:
      lda  WA79C,x                      
      sta  $40FA,x                      
      lda  #$01                         
      sta  $D8FA,x                      
      dex                               
      bpl  WA6E1                        
      ldy  #$02                         
      sty  $8F                          
WA6F3:
      ldy  $8F                          
      lda  WA743,y                      
      sta  $9F                          
      lda  #$0C                         
      sta  $9D                          
      jsr  WA65F                        
      ldx  $94                          
WA703:
      ldy  $0200,x                      
      jsr  W9B48                        
      inc  $9D                          
      dex                               
      cpx  $95                          
      bne  WA703                        
      lda  #$16                         
      sta  $9D                          
WA714:
      ldx  $94                          
      lda  $B4,x                        
      jsr  WA72A                        
      inc  $9D                          
      dec  $94                          
      lda  $94                          
      cmp  $95                          
      bne  WA714                        
      dec  $8F                          
      bpl  WA6F3                        
      rts                               
WA72A:
      tax                               
      and  #$F0                         
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      adc  #$70                         
      tay                               
      jsr  W9B48                        
      txa                               
      and  #$0F                         
      clc                               
      adc  #$70                         
      tay                               
      inc  $9D                          
      jmp  W9B48                        
WA743:
      ora  #$0B                         
WA745:
      ora  $0502                        
      php                               
WA749:
      lda  #$09                         
      sta  $44                          ; Vector: INPUT routine
      ldx  #$20                         
WA74F:
      lda  W9621,x                      
      beq  WA760                        ; BASIC ROM
      sta  $9D                          ; Flag: 80=direct mode 00=program mode
      lda  W9642,x                      
      sta  $9F                          ; Tape pass 2 error register
      ldy  #$1E                         
      jsr  W9B48                        
WA760:
      dex                               
      bpl  WA74F                        ; BASIC ROM
      rts                               
WA764:
      .byte $43, $76, $74, $00, $56, $45, $52, $53
      .byte $49, $4F, $4E, $00, $42, $59, $00, $45
      .byte $52, $49, $43, $00, $4D, $00, $43, $4F
      .byte $54, $54, $4F, $4E
WA780:
      .byte $00, $00, $68, $53, $4F, $55, $4E, $44
      .byte $53, $00, $42, $59, $00, $44, $41, $56
      .byte $45, $00, $48, $4F, $4C, $4D, $45, $53
      .byte $69, $00, $00, $00
WA79C:
      .byte $47, $4F, $52, $46, $49, $41, $4E, $00
      .byte $48, $41, $4C, $4C, $00, $4F, $46, $00
      .byte $46, $41, $4D, $45
WA7B0:
      ldx  #$03                         
WA7B2:
      lda  $C017,x                      
      cmp  WA7DE,x                      
      bne  WA7BD                        
      dex                               
      bne  WA7B2                        
WA7BD:
      stx  $AB                          
      bne  WA7DE                        
      jsr  $C003                        
      ldx  #$A9                         
      lda  #$4E                         
      jsr  $C012                        
      lda  #$01                         
      jsr  $C00F                        
      ldx  #$02                         
WA7D2:
      lda  WA7E2,x                      
      sta  $C018,x                      
      dex                               
      bpl  WA7D2                        
      inx                               
      stx  $A9                          
WA7DE:
      rts                               
      nop                               
      nop                               
      rts                               
WA7E2:
      jmp  WA849                        
WA7E5:
      jsr  W9BAB                        
      and  #$03                         
      beq  WA7E5                        
      tax                               
      ldy  WA932,x                      
      bne  WA81C                        
WA7F2:
      jsr  W9BAB                        
      and  #$07                         
      tax                               
      ldy  WA936,x                      
      bne  WA81C                        
WA7FD:
      jsr  W9BAB                        
      and  #$07                         
      tax                               
      ldy  WA93E,x                      
      bne  WA81C                        
WA808:
      jsr  W9BAB                        
      and  #$03                         
      tax                               
      ldy  WA946,x                      
      bne  WA81C                        
WA813:
      jsr  W9BAB                        
      and  #$03                         
      tax                               
      ldy  WA94A,x                      
WA81C:
      lda  $AB                          
      bne  WA848                        
      sty  $AA                          
      jsr  $C006                        
      bne  WA848                        
      ldy  $AA                          
      lda  WA8FB,y                      
      sta  $A6                          
      lda  WA917,y                      
      sta  $A5                          
      ldy  #$00                         
      lda  ($A5),y                      
      sta  $A9                          
      tay                               
      tax                               
WA83B:
      jsr  $C015                        
      dex                               
      bne  WA83B                        
      lda  ($A5),y                      
      ldx  #$81                         
      jsr  $C009                        
WA848:
      rts                               
WA849:
      dec  $A9                          
      ldy  $A9                          
      ldx  $A4                          
      lda  ($A5),y                      
      bpl  WA864                        
      cmp  #$80                         
      bne  WA85E                        
      inx                               
      cpx  #$06                         
      bne  WA85E                        
      ldx  #$05                         
WA85E:
      txa                               
      clc                               
      adc  #$23                         
      bne  WA878                        
WA864:
      cmp  #$46                         
      bne  WA878                        
      ldx  $0209                        
      bne  WA870                        
      jmp  $C003                        
WA870:
      jsr  $C003                        
      ldy  #$02                         
      jmp  WA81C                        
WA878:
      ldx  #$81                         
      jmp  $C009                        
      .byte $04, $46, $02, $01, $00, $02, $2C, $2B
      .byte $03, $1C, $29, $03, $03, $01, $05, $04
      .byte $01, $06, $04, $08, $08, $07, $29, $05
      .byte $FF, $2A, $0A, $29, $09, $03, $FF, $2A
      .byte $2E, $03, $FF, $2A, $0B, $06, $FF, $2A
      .byte $0D, $07, $29, $0C, $03, $FF, $2A, $0E
      .byte $02, $0F, $19, $07, $11, $11, $11, $07
      .byte $29, $0C, $10, $03, $11, $11, $11, $04
      .byte $FF, $2A, $13, $12, $03, $FF, $2A, $14
      .byte $04, $11, $11, $11, $15, $03, $FF, $2A
      .byte $16, $03, $FF, $2A, $17, $04, $FF, $2A
      .byte $12, $18, $03, $FF, $2A, $2D, $05, $11
      .byte $11, $11, $1A, $19, $03, $1C, $29, $1B
      .byte $04, $80, $2A, $22, $1D, $04, $80, $2A
      .byte $22, $1E, $06, $80, $2A, $22, $20, $29
      .byte $1F, $04, $80, $2A, $22, $21
WA8FB:
      .byte $A8, $A8, $A8, $A8, $A8, $A8, $A8, $A8
      .byte $A8, $A8, $A8, $A8, $A8, $A8, $A8, $A8
      .byte $A8, $A8, $A8, $A8, $A8, $A8, $A8, $A8
      .byte $A8, $A8, $A8, $A8
WA917:
      .byte $7D, $82, $82, $85
; A4=424 HZ (PAL) | A4=441 HZ (NTSC)
      .byte $89
; A4=424 HZ (PAL) | A4=441 HZ (NTSC)
      .byte $8D, $8F, $94, $9A, $9E, $A2, $A9, $AD
      .byte $B0, $B8, $BC, $C1, $C5, $CA, $CE, $D2
      .byte $D7, $DB, $E1, $E5, $EA, $EF
WA932:
      .byte $F6, $03, $04, $05
WA936:
      .byte $06, $07, $08, $09, $0A, $0B, $0C, $0D
WA93E:
      .byte $0E, $0F, $10, $11, $12, $13, $0F, $10
WA946:
      .byte $14, $15, $16, $17
WA94A:
      .byte $18, $19, $1A, $1B, $00, $62, $FF, $00
      .byte $00, $64, $00, $C9, $00, $EA, $01, $5D
      .byte $01, $A3, $01, $C9, $01, $F0, $02, $6F
      .byte $02, $9C, $02, $C6, $03, $26, $03, $3D
      .byte $03, $FC, $04, $19, $04, $65, $05, $1C
      .byte $05, $73, $05, $D9, $05, $F4, $06, $0F
      .byte $06, $2E, $06, $66, $06, $FD, $07, $7B
      .byte $08, $2E, $08, $48, $08, $7C, $09, $03
      .byte $09, $65, $09, $98, $09, $D4, $0A, $8D
      .byte $0A, $BF, $0A, $EF, $0B, $76, $0B, $F9
      .byte $0C, $21, $0C, $4C, $0C, $7A, $0C, $AE
      .byte $0C, $D6, $0D, $09, $0D, $3B, $0D, $5D
      .byte $0D, $78, $0D, $BD, $0E, $0D, $00, $00
      .byte $4A, $2B, $C7, $E4, $8B, $FA, $F9, $99
      .byte $62, $13, $AA, $E8, $50, $46, $5D, $B6
      .byte $14, $A7, $26, $4D, $22, $24, $8D, $D9
      .byte $DF, $4E, $FA, $3A, $A7, $A0, $12, $A1
      .byte $26, $24, $20, $1C, $04, $6D, $E7, $B0
      .byte $D9, $2A, $5D, $F6, $F3, $52, $00, $B0
      .byte $96, $D5, $F9, $F8, $DF, $FC, $F1, $4A
      .byte $FC, $BC, $86, $83, $D3, $19, $39, $42
      .byte $D7, $68, $2D, $3A, $F6, $BE, $29, $78
      .byte $DB, $E5, $88, $11, $35, $0A, $94, $94
      .byte $6B, $0C, $1D, $44, $62, $AD, $B1, $E9
      .byte $18, $66, $DD, $35, $12, $5F, $49, $92
      .byte $28, $0B, $65, $B2, $FC, $4A, $C3, $EB
      .byte $E7, $1A, $0A, $56, $2F, $3C, $08, $D2
      .byte $4A, $82, $AB, $42, $A2, $9C, $13, $24
      .byte $A4, $AC, $8C, $85, $E8, $73, $7F, $8F
      .byte $02, $00, $70, $91, $62, $F9, $4A, $03
      .byte $EA, $E9, $60, $DE, $2B, $49, $81, $44
      .byte $91, $80, $E9, $28, $B4, $E6, $5B, $7A
      .byte $03, $80, $D7, $72, $C6, $2B, $1D, $00
      .byte $30, $33, $A5, $12, $27, $C5, $E8, $24
      .byte $AC, $00, $23, $07, $AD, $0D, $D1, $B9
      .byte $EB, $68, $00, $58, $9F, $D6, $5B, $27
      .byte $C5, $D1, $75, $DC, $4A, $12, $94, $81
      .byte $6C, $FA, $A3, $49, $63, $91, $A4, $BA
      .byte $74, $7B, $41, $12, $07, $09, $1D, $0B
      .byte $03, $30, $72, $95, $C6, $E6, $62, $EE
      .byte $AD, $03, $FE, $8B, $34, $FB, $FC, $76
      .byte $DC, $4A, $93, $02, $48, $18, $94, $02
      .byte $84, $6E, $A4, $5A, $EB, $90, $C8, $12
      .byte $89, $85, $58, $79, $CC, $B9, $AD, $C1
      .byte $F2, $4A, $03, $E3, $F9, $3E, $B6, $52
      .byte $00, $80, $04, $40, $D4, $00, $42, $57
      .byte $60, $E1, $68, $EC, $EC, $58, $E5, $A3
      .byte $00, $5C, $7D, $D2, $9D, $9A, $00, $00
      .byte $28, $E7, $51, $CA, $48, $B1, $A5, $02
      .byte $80, $B2, $DD, $25, $4E, $E3, $47, $17
      .byte $00, $F8, $2E, $47, $27, $7D, $D2, $48
      .byte $4C, $18, $49, $02, $80, $92, $98, $32
      .byte $DF, $B6, $F2, $65, $BF, $67, $F9, $4A
      .byte $C3, $3F, $CF, $CE, $E3, $5D, $F5, $23
      .byte $E9, $F8, $54, $51, $A0, $50, $D8, $23
      .byte $F6, $6F, $BC, $8A, $7D, $5E, $36, $C2
      .byte $EE, $B1, $AD, $4A, $91, $D7, $46, $A1
      .byte $14, $EE, $1C, $CD, $F2, $4A, $C3, $D7
      .byte $27, $03, $67, $3B, $25, $71, $F4, $72
      .byte $7A, $01, $40, $48, $28, $65, $68, $B6
      .byte $34, $4A, $03, $4A, $23, $18, $D3, $73
      .byte $71, $CC, $C5, $35, $5C, $0C, $CB, $5B
      .byte $F7, $8A, $48, $2D, $4A, $AB, $E6, $4B
      .byte $E3, $B3, $07, $EF, $C6, $39, $4D, $DC
      .byte $0C, $21, $69, $04, $6D, $F3, $BD, $F7
      .byte $52, $2A, $D1, $68, $35, $06, $05, $00
      .byte $EB, $04, $2F, $3C, $FE, $70, $39, $75
      .byte $52, $13, $33, $73, $12, $94, $45, $63
      .byte $96, $DB, $EC, $4B, $44, $3E, $7F, $D2
      .byte $F1, $F3, $5A, $88, $73, $E2, $05, $C4
      .byte $2C, $54, $9C, $44, $62, $42, $32, $3A
      .byte $8D, $1E, $BF, $E1, $9E, $CB, $B7, $5A
      .byte $AD, $27, $AE, $BD, $22, $EE, $04, $89
      .byte $22, $08, $A3, $BB, $CF, $AF, $16, $9C
      .byte $28, $91, $02, $00, $56, $EA, $37, $6D
      .byte $37, $43, $62, $08, $C9, $C0, $EF, $2F
      .byte $5B, $79, $86, $35, $FA, $76, $12, $40
      .byte $99, $E5, $60, $13, $C0, $5A, $D9, $6E
      .byte $B5, $DA, $E5, $4A, $C3, $DF, $CF, $3C
      .byte $26, $25, $D5, $67, $8F, $87, $88, $D4
      .byte $55, $C0, $A6, $28, $8D, $49, $B7, $3D
      .byte $38, $EE, $5D, $1E, $BC, $52, $9D, $21
      .byte $11, $1F, $20, $31, $65, $6D, $73, $AF
      .byte $B7, $C2, $A1, $C0, $97, $44, $76, $F9
      .byte $4A, $03, $E3, $39, $83, $79, $1F, $67
      .byte $24, $41, $78, $CA, $F8, $EF, $BB, $46
      .byte $E1, $A9, $AB, $2B, $E2, $E3, $E5, $5C
      .byte $1D, $84, $07, $88, $5A, $78, $CA, $E8
      .byte $2C, $DC, $5F, $DE, $0A, $7C, $24, $26
      .byte $32, $CB, $4A, $03, $E2, $D9, $43, $CF
      .byte $38, $6E, $A5, $A4, $80, $83, $01, $A5
      .byte $10, $34, $80, $71, $A0, $C0, $BC, $51
      .byte $68, $F4, $06, $00, $FC, $81, $14, $97
      .byte $DE, $5E, $10, $47, $37, $49, $00, $D3
      .byte $05, $05, $36, $05, $A5, $D1, $B1, $EB
      .byte $A3, $05, $6F, $A9, $B7, $AE, $44, $5A
      .byte $1C, $3D, $8E, $9B, $C4, $C3, $00, $EC
      .byte $8A, $52, $4A, $D9, $D0, $D1, $87, $15
      .byte $9E, $1A, $55, $00, $B0, $22, $DE, $69
      .byte $5C, $2D, $41, $C2, $80, $4A, $50, $46
      .byte $06, $D8, $15, $7B, $71, $EC, $CD, $B1
      .byte $B3, $2C, $4A, $43, $DE, $E3, $31, $0E
      .byte $FE, $05, $61, $2B, $2B, $84, $70, $14
      .byte $28, $5F, $02, $68, $14, $24, $A0, $D5
      .byte $2E, $4A, $C3, $DF, $8F, $C7, $E2, $B3
      .byte $3B, $8D, $87, $E2, $AA, $CA, $11, $A2
      .byte $52, $3A, $E6, $7D, $2C, $2F, $4E, $7D
      .byte $A5, $02, $88, $4E, $62, $CA, $D0, $8F
      .byte $49, $9E, $EF, $47, $0B, $EB, $83, $78
      .byte $EE, $78, $64, $5C, $35, $29, $49, $22
      .byte $41, $0B, $B1, $59, $2A, $C1, $CF, $2B
      .byte $74, $01, $0D, $17, $0F, $73, $90, $5C
      .byte $60, $8F, $03, $80, $97, $D3, $58, $8C
      .byte $45, $63, $EF, $73, $BF, $97, $2F, $95
      .byte $68, $01, $00, $20, $49, $12, $48, $59
      .byte $11, $1F, $A7, $13, $32, $00, $58, $78
      .byte $EE, $FA, $2A, $7C, $A4, $5A, $AA, $00
      .byte $56, $F5, $27, $35, $25, $25, $05, $14
      .byte $28, $E1, $61, $A4, $98, $65, $61, $13
      .byte $94, $89, $62, $AF, $46, $0B, $78, $3F
      .byte $E5, $F3, $8F, $D3, $C7, $D9, $23, $74
      .byte $27, $31, $90, $45, $F7, $7D, $AB, $12
      .byte $6B, $36, $59, $DF, $3D, $3E, $2B, $35
      .byte $91, $90, $73, $24, $42, $4D, $C4, $0C
      .byte $4E, $02, $42, $57, $CA, $A2, $AC, $8D
      .byte $45, $47, $2F, $2D, $3E, $11, $47, $8F
      .byte $47, $B7, $93, $26, $49, $00, $90, $98
      .byte $C6, $DA, $6A, $CE, $63, $BF, $E9, $2C
      .byte $4A, $43, $CB, $D3, $C7, $62, $79, $DC
      .byte $FC, $75, $5D, $13, $00, $10, $1E, $80
      .byte $A8, $41, $E8, $12, $56, $1A, $7B, $B1
      .byte $EC, $6C, $B4, $9A, $E5, $4A, $83, $EE
      .byte $F9, $1D, $CC, $93, $92, $00, $00, $00
      .byte $00, $42, $15, $8E, $5D, $C0, $1E, $57
      .byte $63, $FF, $2F, $BD, $00, $F7, $BD, $DC
      .byte $3C, $29, $09, $42, $52, $1A, $6B, $3D
      .byte $58, $0B, $85, $35, $C5, $9A, $EB, $E0
      .byte $CB, $C9, $41, $25, $18, $6E, $1C, $8C
      .byte $B7, $55, $63, $DE, $8F, $D5, $2E, $F7
      .byte $C6, $A5, $1F, $79, $E4, $53, $00, $F0
      .byte $23, $80, $B2, $A9, $5A, $E3, $D1, $6A
      .byte $96, $4A, $AB, $E2, $95, $2F, $7F, $3F
      .byte $1D, $FE, $DF, $F6, $C7, $75, $74, $C4
      .byte $AC, $31, $CE, $B2, $BC, $8F, $82, $74
      .byte $BB, $73, $BC, $6D, $E1, $68, $82, $00
      .byte $61, $0B, $4F, $D8, $D8, $05, $00, $85
      .byte $B2, $B2, $28, $7B, $7C, $CC, $40, $37
      .byte $78, $FB, $0D, $9E, $33, $29, $CE, $AE
      .byte $A0, $8D, $23, $01, $12, $65, $21, $F6
      .byte $38, $18, $7F, $DD, $F7, $A4, $68, $52
      .byte $50, $6B, $DB, $2B, $91, $98, $90, $8C
      .byte $8A, $04, $D3, $B1, $A9, $80, $3D, $8A
      .byte $4D, $B1, $C6, $CB, $C5, $B9, $6B, $29
      .byte $50, $00, $00, $6E, $6B, $F0, $F6, $A9
      .byte $95, $88, $8A, $04, $24, $68, $F9, $94
      .byte $5F, $93, $0E, $29, $53, $28, $3D, $7A
      .byte $01, $B8, $F0, $A4, $78, $C5, $76, $75
      .byte $52, $01, $43, $1F, $9B, $2E, $DE, $76
      .byte $9C, $57, $84, $81, $F0, $40, $D4, $C2
      .byte $43, $62, $CA, $38, $D5, $28, $A7, $8E
      .byte $93, $2A, $51, $A1, $DB, $1C, $41, $D8
      .byte $5C, $0C, $97, $7B, $B6, $F7, $4A, $CC
      .byte $7B, $45, $DC, $1E, $25, $24, $B4, $B6
      .byte $BB, $50, $68, $6C, $61, $89, $73, $F9
      .byte $4A, $AB, $FB, $45, $FF, $9C, $01, $B1
      .byte $5B, $D8, $89, $D0, $01, $B0, $39, $46
      .byte $5E, $76, $75, $E9, $62, $1D, $2E, $4A
      .byte $C1, $DA, $BA, $53, $52, $12, $07, $8F
      .byte $17, $46, $CC, $C6, $01, $2A, $01, $65
      .byte $C1, $A0, $2C, $32, $F7, $BA, $15, $80
      .byte $AB, $EB, $EC, $4E, $E3, $E8, $49, $8C
      .byte $44, $C7, $F4, $49, $52, $3C, $1A, $43
      .byte $57, $A5, $F1, $C2, $24, $18, $1B, $E0
      .byte $68, $76, $01, $47, $C3, $A2, $F4, $DC
      .byte $EF, $47, $36, $41, $61, $58, $FE, $4A
      .byte $43, $F1, $B3, $A6, $F6, $79, $CE, $49
      .byte $49, $71, $5C, $84, $EC, $60, $10, $B6
      .byte $02, $2B, $64, $05, $40, $61, $5E, $58
      .byte $7E, $C4, $AB, $B1, $D2, $A5, $A3, $00
      .byte $60, $75, $35, $6B, $F8, $ED, $EA, $49
      .byte $10, $9E, $91, $C6, $A6, $0F, $B8, $A5
      .byte $CE, $3B, $09, $A2, $03, $E1, $01, $12
      .byte $D3, $B9, $EB, $47, $25, $0A, $20, $59
      .byte $11, $BF, $AE, $96, $22, $74, $21, $29
      .byte $6B, $3B, $F7, $FB, $B1, $48, $00, $1C
      .byte $36, $59, $C3, $9F, $74, $9C, $4E, $C2
      .byte $A0, $9C, $0E, $65, $73, $04, $71, $D7
      .byte $57, $17, $90, $B0, $FC, $4A, $2B, $BE
      .byte $74, $3F, $D7, $80, $5A, $9D, $11, $1F
      .byte $84, $FB, $E2, $0C, $09, $00, $00, $28
      .byte $94, $65, $1E, $FB, $1D, $AD, $AE, $E5
      .byte $4A, $AB, $F2, $05, $FD, $FC, $0C, $6D
      .byte $AB, $A8, $01, $00, $00, $00, $10, $84
      .byte $D2, $D8, $C4, $D7, $F2, $EA, $D1, $6D
      .byte $67, $74, $2D, $4A, $43, $EB, $B3, $87
      .byte $A6, $F1, $96, $95, $B8, $74, $01, $E2
      .byte $B5, $FC, $24, $00, $A0, $50, $4A, $AB
      .byte $01, $BC, $11, $A6, $67, $2E, $CA, $E6
      .byte $D7, $F2, $4A, $C3, $F8, $D3, $E1, $62
      .byte $8F, $AB, $9F, $44, $62, $88, $0F, $90
      .byte $18, $D2, $66, $6F, $FF, $6A, $60, $4D
      .byte $FD, $32, $57, $9E, $02, $80, $B5, $3D
      .byte $9E, $73, $79, $3B, $E5, $E4, $49, $71
      .byte $90, $B1, $01, $82, $B6, $82, $00, $0A
      .byte $25, $52, $65, $8F, $6A, $A5, $A3, $D1
      .byte $B0, $FC, $4A, $03, $EF, $79, $0D, $EA
      .byte $AD, $14, $61, $20, $3C, $8C, $54, $9B
      .byte $3E, $E0, $AD, $9C, $B7, $13, $90, $98
      .byte $32, $5E, $CD, $B2, $1D, $5D, $6F, $DB
      .byte $12, $15, $B6, $5C, $00, $A0, $EC, $71
      .byte $AD, $61, $6B, $74, $34, $00, $1E, $7E
      .byte $A7, $A6, $24, $88, $5A, $99, $64, $3B
      .byte $86, $93, $96, $D0, $9D, $C4, $D0, $CB
      .byte $2C, $B1, $56, $8E, $1E, $A7, $8F, $E1
      .byte $80, $87, $01, $76, $35, $F6, $62, $DB
      .byte $9B, $A5, $05, $58, $1D, $6F, $A9, $A9
      .byte $AB, $F0, $68, $3C, $1C, $07, $9B, $E0
      .byte $6A, $0A, $43, $D7, $F2, $DE, $1A, $00
      .byte $00, $00, $F0, $F7, $DB, $C1, $27, $D5
      .byte $D5, $51, $28, $7B, $7F, $DD, $B7, $24
      .byte $D6, $74, $7C, $B2, $CE, $EE, $34, $89
      .byte $87, $38, $27, $4E, $85, $98, $01, $10
      .byte $12, $82, $00, $A1, $2B, $AD, $D5, $BE
      .byte $9C, $36, $DE, $16, $9B, $5E, $F7, $EA
      .byte $F2, $4A, $43, $F4, $39, $43, $FB, $EA
      .byte $39, $E3, $B8, $49, $1C, $E4, $68, $56
      .byte $C8, $CC, $84, $03, $38, $15, $80, $92
      .byte $10, $56, $16, $2B, $AF, $F9, $1F, $5D
      .byte $00, $1E, $7E, $A5, $49, $92, $44, $D4
      .byte $00, $0A, $65, $D3, $D5, $02, $32, $61
      .byte $2D, $EC, $29, $FB, $35, $16, $8F, $EB
      .byte $B7, $47, $6B, $CE, $AD, $47, $01, $80
      .byte $37, $71, $C9, $71, $F1, $F2, $72, $3E
      .byte $9B, $04, $97, $C6, $A9, $12, $00, $40
      .byte $21, $24, $AD, $C6, $A2, $31, $0B, $7B
      .byte $D8, $FB, $5B, $AE, $28, $AB, $2A, $00
      .byte $58, $7F, $F1, $26, $FE, $66, $A5, $E0
      .byte $F4, $9D, $22, $64, $C1, $91, $00, $02
      .byte $22, $17, $80, $C2, $1E, $D7, $1A, $B6
      .byte $39, $C7, $1A, $A2, $44, $B2, $FC, $4A
      .byte $EB, $92, $7C, $89, $3E, $F7, $63, $DB
      .byte $63, $48, $C4, $AC, $44, $87, $51, $63
      .byte $4B, $03, $00, $89, $32, $6F, $EF, $B5
      .byte $E5, $D8, $44, $01, $AC, $DA, $E3, $88
      .byte $27, $8D, $A3, $63, $66, $42, $15, $B3
      .byte $51, $A3, $51, $6E, $8E, $33, $06, $84
      .byte $27, $6A, $B0, $C7, $63, $67, $6F, $A3
      .byte $51, $B8, $E6, $72, $C4, $4E, $49, $B8
      .byte $6B, $D6, $30, $7B, $F1, $D6, $B0, $4E
      .byte $44, $4A, $01, $B0, $8A, $6F, $07, $B7
      .byte $D3, $83, $B0, $85, $64, $6D, $E7, $97
      .byte $0F, $E2, $DF, $3E, $1E, $5B, $AE, $46
      .byte $A2, $94, $4D, $6F, $B0, $37, $91, $16
      .byte $8D, $AB, $3F, $8E, $20, $17, $F6, $38
      .byte $E0, $17, $51, $28, $75, $AF, $7B, $35
      .byte $54, $2F, $00, $6F, $BF, $25, $27, $4D
      .byte $8A, $72, $5C, $C0, $41, $C6, $A6, $94
      .byte $14, $68, $C0, $BC, $EC, $3A, $E6, $AD
      .byte $6E, $70, $DF, $D7, $19, $75, $73, $9D
      .byte $01, $12, $95, $88, $0F, $61, $00, $C2
      .byte $51, $20, $21, $FC, $02, $F6, $38, $4A
      .byte $C7, $1A, $96, $B2, $CB, $DA, $E3, $D8
      .byte $A5, $E5, $4A, $6B, $96, $3B, $5F, $F8
      .byte $CF, $1E, $C0, $1D, $10, $36, $A0, $90
      .byte $42, $04, $6D, $05, $51, $98, $B7, $96
      .byte $3F, $56, $BA, $96, $4A, $C3, $F8, $D3
      .byte $E1, $E1, $B6, $17, $EC, $14, $E1, $24
      .byte $22, $95, $90, $B2, $B2, $D8, $EC, $31
      .byte $71, $84, $EF, $EA, $93, $2A, $61, $70
      .byte $04, $B0, $0B, $12, $95, $36, $2B, $8F
      .byte $B5, $16, $C4, $82, $B5, $42, $D9, $7F
      .byte $EB, $7E, $C7, $97, $B2, $50, $38, $96
      .byte $4A, $EB, $2C, $57, $BF, $94, $3F, $9F
      .byte $21, $36, $42, $15, $1D, $60, $24, $16
      .byte $3D, $D6, $B2, $EF, $67, $F9, $CC, $EA
      .byte $19, $37, $1C, $BF, $48, $82, $95, $F1
      .byte $0B, $58, $59, $00, $6B, $A8, $8E, $1E
      .byte $8D, $02, $F0, $6D, $6E, $FE, $49, $15
      .byte $9D, $94, $5B, $8C, $91, $C6, $9E, $2E
      .byte $A4, $C5, $49, $97, $F3, $22, $0C, $89
      .byte $A1, $31, $D2, $E3, $D1, $ED, $6D, $15
      .byte $B4, $5D, $00, $00, $2B, $8B, $3D, $A6
      .byte $B5, $86, $A3, $47, $01, $00, $F8, $FC
      .byte $E5, $ED, $E3, $B8, $F1, $70, $5C, $0D
      .byte $89, $89, $4F, $97, $0D, $12, $9F, $C7
      .byte $8E, $F0, $84, $6E, $B8, $6D, $73, $9F
      .byte $FF, $3A, $B1, $48, $7C, $B3, $B6, $3D
      .byte $1E, $8D, $D3, $6B, $E4, $90, $28, $94
      .byte $5D, $41, $D9, $9B, $AD, $D5, $2C, $4A
      .byte $83, $EA, $79, $3F, $96, $24, $49, $40
      .byte $56, $01, $00, $6C, $0A, $F8, $11, $85
      .byte $52, $5A, $6B, $5C, $3A, $77, $55, $86
      .byte $14, $56, $F5, $4F, $92, $00, $80, $F1
      .byte $60, $54, $20, $47, $28, $50, $36, $75
      .byte $B4, $D6, $38, $1A, $05, $00, $B8, $37
      .byte $5E, $78, $1C, $7D, $79, $2C, $6E, $86
      .byte $90, $94, $F6, $7E, $5F, $B2, $24, $A8
      .byte $15, $FD, $4D, $41, $63, $05, $4B, $6F
      .byte $C0, $77, $3F, $32, $9B, $9A, $82, $9F
      .byte $57, $D4, $86, $03, $12, $06, $50, $C6
      .byte $66, $4B, $03, $80, $C6, $9C, $A3, $B3
      .byte $FC, $4A, $83, $E4, $C9, $A0, $DE, $2B
      .byte $25, $C5, $78, $12, $4C, $17, $E3, $C4
      .byte $96, $AA, $B0, $96, $63, $79, $E3, $62
      .byte $DF, $D7, $FA, $FB, $F6, $C1, $71, $5F
      .byte $9D, $41, $62, $08, $0F, $C0, $2E, $00
      .byte $0A, $2B, $8B, $3D, $8E, $C6, $1A, $46
      .byte $E9, $68, $58, $FE, $4A, $C3, $AF, $C7
      .byte $D0, $B4, $7A, $4B, $9D, $F4, $38, $6F
      .byte $99, $8F, $30, $44, $E7, $0C, $C2, $43
      .byte $D4, $60, $E1, $28, $43, $C4, $DE, $AE
      .byte $FB, $BB, $7C, $A9, $04, $A5, $00, $00
      .byte $BC, $27, $35, $49, $58, $D1, $97, $C7
      .byte $82, $31, $24, $00, $12, $53, $D6, $96
      .byte $7B, $FD, $2A, $C0, $A9, $BD, $48, $2D
      .byte $4A, $43, $D3, $E3, $B1, $A4, $78, $CB
      .byte $38, $FD, $B8, $7A, $01, $18, $E2, $DC
      .byte $F5, $12, $DC, $3C, $12, $DF, $68, $B5
      .byte $78, $CE, $DA, $76, $A7, $48, $2C, $71
      .byte $1D, $10, $1E, $60, $6A, $A8, $C4, $78
      .byte $6C, $69, $83, $58, $94, $5C, $DB, $EC
      .byte $D6, $02, $F8, $83, $B8, $F4, $F2, $82
      .byte $78, $61, $9D, $CD, $D1, $84, $64, $54
      .byte $CA, $82, $4C, $CA, $BC, $DB, $4E, $0E
      .byte $8E, $7E, $39, $BD, $89, $91, $01, $28
      .byte $24, $6C, $92, $58, $F9, $88, $F6, $7E
      .byte $2E, $57, $D4, $3A, $F8, $75, $FF, $24
      .byte $1E, $02, $CA, $2F, $28, $7B, $1C, $FB
      .byte $FF, $25, $BB, $AE, $FE, $A6, $DA, $85
      .byte $44, $01, $F6, $38, $A0, $34, $D6, $50
      .byte $AD, $8E, $16, $00, $00, $00, $7C, $E9
      .byte $E5, $D4, $E5, $E6, $80, $50, $25, $66
      .byte $A4, $FE, $F2, $63, $43, $39, $80, $55
      .byte $33, $1E, $BC, $5C, $15, $AC, $84, $4B
      .byte $23, $21, $B0, $C7, $EC, $BC, $D6, $32
      .byte $AE, $BE, $12, $E7, $01, $00, $4C, $87
      .byte $04, $85, $50, $6D, $2A, $12, $D4, $D8
      .byte $F5, $D2, $5A, $DE, $92, $6B, $9B, $B1
      .byte $FC, $4A, $03, $F9, $F9, $79, $2C, $1E
      .byte $4E, $02, $88, $5A, $19, $8F, $4D, $1F
      .byte $A4, $D5, $2D, $80, $44, $89, $DE, $66
      .byte $A2, $1F, $70, $42, $2C, $8F, $63, $E2
      .byte $E8, $E5, $A4, $2B, $11, $2A, $1E, $93
      .byte $00, $46, $E5, $24, $58, $34, $E8, $B1
      .byte $67, $D7, $F2, $4A, $EB, $48, $A3, $BE
      .byte $CC, $3E, $F7, $63, $E3, $9C, $88, $0E
      .byte $CC, $C7, $18, $93, $EA, $6D, $B1, $72
      .byte $F6, $F8, $A3, $0F, $AB, $66, $2D, $F8
      .byte $CA, $51, $22, $2A, $6C, $0A, $24, $0A
      .byte $3F, $A2, $D0, $6A, $EE, $F7, $C8, $2A
      .byte $65, $C9, $F2, $4A, $83, $E6, $E9, $B0
      .byte $BA, $9D, $8E, $0C, $F8, $6A, $00, $09
      .byte $A2, $3C, $04, $C0, $CF, $D9, $E3, $65
      .byte $92, $CA, $BC, $8E, $0C, $F9, $D9, $B8
      .byte $E4, $92, $30, $A6, $5E, $36, $FD, $D2
      .byte $AC, $96, $AC, $88, $9F, $14, $57, $93
      .byte $30, $1A, $BB, $8A, $B5, $16, $90, $25
      .byte $65, $7B, $EB, $FE, $3B, $52, $F2, $5B
      .byte $F3, $E2, $DE, $95, $B8, $6E, $BB, $2F
      .byte $90, $00, $80, $F3, $80, $A8, $95, $20
      .byte $34, $36, $14, $8B, $8E, $61, $9E, $3B
      .byte $11, $89, $1D, $6B, $E1, $F6, $23, $CE
      .byte $A9, $53, $C7, $75, $F1, $18, $10, $9E
      .byte $A8, $05, $81, $CD, $31, $72, $ED, $EC
      .byte $36, $FB, $FC, $B6, $DC, $9C, $78, $03
      .byte $56, $F0, $38, $3D, $0E, $12, $BA, $20
      .byte $90, $A8, $71, $BE, $FA, $00, $AC, $E2
      .byte $3F, $CB, $4A, $43, $CE, $73, $3D, $B6
      .byte $92, $C4, $71, $01, $03, $83, $B0, $0D
      .byte $CD, $38, $00, $CB, $AF, $D5, $54, $1E
      .byte $CA, $6F, $AF, $48, $E2, $EA, $C7, $2B
      .byte $C8, $B9, $A8, $91, $98, $32, $CE, $36
      .byte $F4, $98, $7E, $19, $8D, $06, $C0, $8B
      .byte $38, $F8, $EB, $E1, $A0, $12, $44, $8D
      .byte $21, $62, $D3, $8B, $C4, $D1, $51, $D8
      .byte $52, $94, $ED, $8E, $34, $DA, $C3, $D1
      .byte $02, $B8, $F3, $F6, $D9, $A4, $7A, $88
      .byte $73, $D8, $12, $9D, $04, $A7, $C6, $CD
      .byte $21, $C1, $0A, $E0, $4B, $4C, $F2, $38
      .byte $B8, $D2, $20, $74, $CB, $FB, $A3, $61
      .byte $65, $59, $55, $29, $00, $EF, $DB, $6C
      .byte $15, $D7, $C1, $A3, $84, $0D, $38, $9A
      .byte $15, $D4, $2D, $CC, $4B, $A1, $50, $56
      .byte $BA, $74, $94, $39, $2D, $4A, $EB, $F8
      .byte $D2, $FD, $FC, $04, $DA, $38, $22, $CE
      .byte $8E, $D0, $91, $A8, $D1, $63, $79, $3F
      .byte $62, $77, $DA, $E5, $F4, $4B, $10, $A2
      .byte $06, $10, $04, $60, $D1, $18, $FF, $A5
      .byte $0B, $56, $62, $B6, $FC, $4A, $AB, $EB
      .byte $53, $93, $2F, $E1, $E7, $35, $A8, $17
      .byte $00, $B0, $F2, $1F, $5D, $00, $FC, $B6
      .byte $57, $FA, $27, $49, $84, $04, $C6, $A3
      .byte $8C, $14, $9B, $1E, $95, $28, $5F, $62
      .byte $D3, $5C, $C2, $F4, $31, $E7, $68, $96
      .byte $4A, $2B, $FB, $8B, $F6, $39, $C3, $F9
      .byte $EA, $E5, $63, $65, $F1, $8B, $00, $F6
      .byte $38, $36, $CB, $26, $EA, $6D, $E3, $A4
      .byte $88, $4E, $A8, $0A, $00, $FC, $08, $CA
      .byte $A6, $C6, $1E, $2D, $6B, $8C, $FD, $73
      .byte $BC, $91, $FD, $66, $8D, $96, $4A, $C3
      .byte $AF, $C7, $D4, $34, $7C, $FE, $4E, $23
      .byte $39, $0E, $2E, $A1, $0B, $0F, $41, $28
      .byte $6B, $BA, $BD, $25, $DE, $76, $9C, $17
      .byte $F3, $41, $42, $36, $4B, $D9, $DF, $C5
      .byte $67, $C7, $7D, $41, $82, $20, $53, $A0
      .byte $14, $76, $CD, $BA, $6A, $8D, $D5, $EA
      .byte $52, $CB, $4A, $43, $EE, $E3, $B1, $A4
      .byte $7A, $C9, $4A, $49, $49, $12, $57, $15
      .byte $93, $B2, $10, $9B, $05, $F8, $79, $0D
      .byte $C1, $E8, $24, $4C, $22, $74, $BF, $00
      .byte $00, $CA, $CA, $A0, $34, $D6, $B0, $95
      .byte $AE, $E5, $4A, $43, $EC, $F9, $19, $A8
      .byte $AB, $9B, $03, $42, $D5, $65, $85, $C7
      .byte $2C, $11, $74, $FA, $78, $2C, $C2, $13
      .byte $35, $28, $43, $8C, $4D, $47, $5A, $51
      .byte $D6, $12, $91, $DC, $DD, $75, $FE, $76
      .byte $90, $5F, $04, $00, $14, $60, $8F, $B7
      .byte $35, $54, $AB, $A3, $96, $4A, $03, $FF
      .byte $99, $E1, $E1, $B6, $7B, $97, $4A, $5C
      .byte $9A, $44, $BC, $1E, $02, $68, $74, $DF
      .byte $F5, $88, $D5, $2A, $B9, $5C, $FD, $08
      .byte $98, $18, $8E, $C2, $E9, $51, $20, $51
      .byte $21, $59, $CB, $C1, $27, $48, $2B, $F6
      .byte $F4, $C8, $84, $C6, $9C, $D1, $2C, $4A
      .byte $EB, $4A, $FC, $8B, $0E, $B8, $F2, $85
      .byte $F4, $FC, $99, $78, $13, $04, $24, $20
      .byte $74, $0B, $4B, $50, $08, $DD, $10, $D1
      .byte $63, $37, $D6, $7D, $9B, $68, $C0, $62
      .byte $F9, $4A, $03, $E7, $F9, $3B, $31, $96
      .byte $24, $20, $3E, $14, $5E, $0E, $05, $4A
      .byte $25, $82, $70, $35, $A9, $D0, $31, $C9
      .byte $E8, $E8, $68, $96, $4A, $03, $FD, $F9
      .byte $1D, $D4, $8B, $23, $A8, $44, $D4, $D8
      .byte $E3, $28, $99, $F5, $C7, $12, $57, $4B
      .byte $C0, $C2, $C7, $0C, $5F, $E3, $53, $AC
      .byte $D4, $44, $D0, $00, $00, $F8, $48, $75
      .byte $AC, $6D, $5F, $2F, $8F, $F8, $3C, $46
      .byte $7C, $20, $E5, $DA, $7B, $FD, $2A, $58
      .byte $6B, $EB, $4F, $8F, $B7, $00, $64, $17
      .byte $6C, $9A, $ED, $46, $AB, $55, $B8, $D8
      .byte $F2, $4A, $03, $E7, $F9, $1D, $7C, $8B
      .byte $E8, $12, $F1, $81, $C7, $88, $1A, $41
      .byte $60, $61, $76, $C5, $A6, $3F, $D6, $7F
      .byte $14, $AC, $8A, $52, $00, $EB, $6E, $DC
      .byte $16, $47, $DF, $69, $24, $26, $0C, $10
      .byte $33, $C2, $90, $98, $F9, $B6, $95, $47
      .byte $2F, $FC, $E5, $71, $F6, $4B, $62, $52
      .byte $6E, $3E, $89, $C7, $88, $0F, $89, $21
      .byte $E5, $D6, $C6, $7E, $9F, $7B, $3E, $B2
      .byte $12, $5F, $F6, $D1, $78, $F8, $D6, $BA
      .byte $CB, $4A, $EB, $4A, $49, $BE, $58, $9E
      .byte $CF, $30, $39, $52, $46, $02, $A0, $B4
      .byte $F6, $F0, $D8, $2E, $8F, $5D, $4E, $5D
      .byte $48, $0C, $CC, $07, $8F, $51, $60, $4B
      .byte $97, $ED, $D6, $1B, $C7, $39, $CB, $A9
      .byte $C1, $A6, $00, $80, $42, $29, $65, $8F
      .byte $96, $3D, $5F, $7E, $1D, $5D, $00, $E0
      .byte $43, $B7, $CF, $1D, $A7, $87, $44, $10
      .byte $0A, $14, $CA, $DB, $28, $8D, $4D, $8C
      .byte $BD, $65, $EF, $73, $CF, $41, $A4, $00
      .byte $58, $AF, $6E, $1F, $8A, $CF, $8D, $5D
      .byte $C1, $E9, $11, $84, $44, $0D, $1D, $B3
      .byte $04, $B0, $56, $D6, $32, $B6, $94, $7B
      .byte $2D, $57, $D6, $BD, $CB, $07, $4F, $8A
      .byte $F8, $00, $89, $D9, $B7, $75, $F7, $4B
      .byte $F9, $92, $AC, $6D, $2F, $A7, $C6, $A6
      .byte $6A, $79, $B7, $15, $C5, $09, $CB, $A7
      .byte $6E, $40, $25, $0A, $EC, $11, $85, $4C
      .byte $E9, $D8, $B3, $58, $63, $ED, $F9, $C8
      .byte $F8, $F2, $00, $FF
WB7F6:
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $01, $03, $07, $0F, $1F, $3F, $73, $73
      .byte $3F, $0F, $18, $18, $0C, $00, $00, $00
      .byte $80, $C0, $E0, $F0, $F8, $FC, $CE, $CE
      .byte $FC, $F0, $18, $18, $30, $00, $00, $00
      .byte $01, $03, $07, $0F, $1F, $3F, $73, $73
      .byte $3F, $0C, $1B, $28, $44, $00, $00, $00
      .byte $80, $C0, $E0, $F0, $F8, $FC, $CE, $CE
      .byte $FC, $30, $D8, $14, $22, $00, $00, $00
      .byte $00, $00, $00, $08, $0C, $8E, $9F, $B3
      .byte $F3, $7F, $3F, $18, $10, $20, $00, $00
      .byte $00, $00, $00, $10, $30, $71, $F9, $CD
      .byte $CF, $FE, $FC, $18, $08, $04, $00, $00
      .byte $00, $00, $00, $08, $0C, $06, $1F, $73
      .byte $F3, $DF, $9F, $88, $86, $00, $00, $00
      .byte $00, $00, $00, $10, $30, $60, $F8, $CE
      .byte $CF, $FB, $F9, $11, $61, $00, $00, $00
      .byte $00, $00, $00, $07, $7F, $F3, $F3, $FF
      .byte $1C, $17, $30, $60, $C0, $00, $00, $00
      .byte $00, $00, $00, $E0, $FE, $CF, $CF, $FF
      .byte $38, $E8, $0C, $06, $03, $00, $00, $00
      .byte $00, $00, $00, $07, $7F, $F3, $F3, $FF
      .byte $1C, $17, $30, $60, $30, $00, $00, $00
      .byte $00, $00, $00, $E0, $FE, $CF, $CF, $FF
      .byte $38, $E8, $0C, $06, $0C, $00, $00, $00
      .byte $C0, $03, $60, $06, $00, $00, $00, $00
      .byte $00, $00, $C0, $03, $60, $06, $00, $00
      .byte $00, $00, $00, $00, $C0, $03, $60, $06
      .byte $00, $00, $00, $00, $00, $00, $C0, $03
      .byte $60, $06, $00, $00, $00, $00, $00, $00
      .byte $40, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $10, $54, $44, $54, $44, $44, $44
WB8F6:
      .byte $00, $54, $44, $44, $50, $44, $44, $54
      .byte $00, $54, $44, $40, $40, $40, $44, $54
      .byte $00, $50, $44, $44, $44, $44, $44, $50
      .byte $00, $54, $40, $40, $50, $40, $40, $54
      .byte $00, $54, $40, $40, $50, $40, $40, $40
      .byte $00, $54, $40, $40, $44, $44, $44, $54
      .byte $00, $44, $44, $44, $54, $44, $44, $44
      .byte $00, $54, $10, $10, $10, $10, $10, $54
      .byte $00, $44, $44, $50, $50, $44, $44, $44
      .byte $00, $40, $40, $40, $40, $40, $40, $54
      .byte $00, $44, $54, $54, $44, $44, $44, $44
      .byte $00, $44, $54, $54, $54, $54, $44, $44
      .byte $00, $54, $44, $44, $44, $44, $44, $54
      .byte $00, $54, $44, $44, $54, $40, $40, $40
      .byte $00, $54, $44, $44, $50, $44, $44, $44
      .byte $00, $54, $44, $40, $54, $04, $44, $54
      .byte $00, $54, $10, $10, $10, $10, $10, $10
      .byte $00, $44, $44, $44, $44, $44, $54, $10
      .byte $00, $44, $44, $44, $44, $54, $54, $44
      .byte $00, $54, $44, $44, $44, $44, $44, $54
      .byte $00, $10, $10, $50, $10, $10, $10, $54
      .byte $00, $54, $44, $04, $54, $40, $40, $54
      .byte $00, $54, $44, $04, $10, $04, $44, $54
      .byte $00, $04, $44, $44, $44, $54, $04, $04
      .byte $00, $54, $40, $40, $54, $04, $44, $54
      .byte $00, $54, $44, $40, $54, $44, $44, $54
      .byte $00, $54, $44, $04, $10, $10, $10, $10
      .byte $00, $54, $44, $44, $54, $44, $44, $54
      .byte $00, $54, $44, $44, $54, $04, $44, $54
      .byte $00, $00, $00, $10, $00, $00, $10, $00
WB9E6:
      .byte $10, $54, $54, $10, $10, $10, $10, $00
WB9EE:
      .byte $02, $02, $02, $02, $00, $00, $50, $50
      .byte $A1, $A1, $A5, $A5, $A5, $A5, $A4, $A4
      .byte $A0, $A0, $00, $00, $28, $28, $AA, $AA
      .byte $AA, $AA, $AA, $AA, $28, $28, $69, $69
      .byte $69, $69, $69, $69, $69, $69, $69, $69
      .byte $69, $69, $41, $41, $00, $00, $00, $00
      .byte $80, $80, $80, $80, $00, $00, $05, $05
      .byte $4A, $4A, $5A, $5A, $5A, $5A, $1A, $1A
      .byte $0A, $0A
WBA30:
      .byte $FC, $FC, $30, $30, $3A, $3A, $3A, $3A
      .byte $30, $30, $30, $30, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $A8, $A8
      .byte $A8, $A8, $20, $20, $AA, $AA, $AA, $AA
      .byte $A8, $A8, $10, $10, $10, $10, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $FC, $FC, $30, $30, $B0, $B0, $B0, $B0
      .byte $30, $30, $30, $30, $00, $28, $00, $00
      .byte $AA, $00, $02, $AA, $80, $02, $AA, $80
      .byte $00, $28, $00, $50, $69, $05, $A1, $69
      .byte $4A, $A5, $69, $5A, $A5, $69, $5A, $A4
      .byte $69, $1A, $A0, $69, $0A, $A0, $69, $0A
      .byte $00, $41, $40, $FF, $01, $13, $FF, $C4
      .byte $0F, $FF, $F0, $0F, $FF, $F0, $3F, $FF
      .byte $FC, $3D, $75, $FC, $FE, $79, $FF, $FF
      .byte $FF, $FF, $FF, $FF, $FF, $FF, $55, $FF
      .byte $3F, $FF, $FC, $04, $00, $10, $05, $00
      .byte $50, $00, $FF, $00, $0F, $FF, $F0, $FD
      .byte $7D, $7F, $FD, $7D, $7F, $0F, $FF, $F0
      .byte $04, $FF, $40, $10, $00, $10, $00, $3C
      .byte $00, $03, $FF, $C0, $0F, $FF, $F0, $3F
      .byte $FF, $FC, $FD, $7D, $7F, $FD, $7D, $7F
      .byte $FF, $FF, $FF, $15, $3C, $54, $04, $3C
      .byte $10, $00, $00, $CC, $00, $55, $55, $01
      .byte $55, $55, $00, $5A, $AA, $0A, $5A, $AF
      .byte $00, $5A, $BF, $0A, $5A, $BF, $00, $5A
      .byte $BF, $0A, $5A, $AF, $00, $56, $AA, $01
      .byte $55, $55, $00, $55, $55, $00, $00, $2A
      .byte $00, $00, $2A, $00, $00, $AA, $00, $00
      .byte $AA, $00, $02, $A8, $00, $02, $A8, $AA
      .byte $AA, $AA, $BB, $EF, $BE, $AA, $AA, $AA
      .byte $CC, $00, $00, $55, $00, $00, $55, $40
      .byte $00, $A9, $50, $00, $AA, $54, $00, $EA
      .byte $95, $51, $EA, $A5, $55, $EA, $95, $51
      .byte $AA, $54, $00, $A9, $50, $00, $15, $40
      .byte $00, $15, $00, $00, $20, $00, $00, $20
      .byte $54, $10, $54, $54, $10, $54, $18, $54
      .byte $90, $18, $54, $90, $0A, $56, $80, $0A
      .byte $56, $80, $02, $56, $00, $02, $56, $00
      .byte $00, $54, $00, $00, $54, $00, $00, $10
      .byte $00, $00, $10, $00, $00, $CC, $00, $00
      .byte $CC, $00, $00, $FC, $00, $00, $FC, $F0
      .byte $00, $00, $F0, $00, $00, $F0, $00, $00
      .byte $F0, $00, $00, $F0, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $03, $40, $00, $07, $F0, $00, $0F
      .byte $F0, $00, $0D, $50, $00, $05, $D0, $00
      .byte $07, $70, $00, $03, $C0, $00, $00, $00
      .byte $01, $C0, $00, $07, $F0, $00, $3F, $7C
      .byte $00, $17, $FC, $00, $3F, $DC, $00, $3D
      .byte $D4, $00, $15, $7C, $00, $07, $70, $00
      .byte $01, $40, $03, $C0, $00, $05, $F0, $00
      .byte $1F, $F4, $00, $3F, $7C, $00, $57, $FF
      .byte $00, $7D, $D7, $00, $7D, $D4, $00, $17
      .byte $74, $00, $17, $7C, $00, $07, $70, $00
      .byte $01, $C0, $00, $00, $00, $00, $00, $00
      .byte $04, $04, $00, $04, $A4, $00, $06, $F4
      .byte $00, $06, $F4, $00, $04, $A4, $00, $04
      .byte $04, $00, $00, $00, $10, $01, $00, $10
      .byte $81, $00, $12, $A1, $00, $1B, $F9, $00
      .byte $1B, $F9, $00, $12, $A1, $00, $10, $81
      .byte $00, $10, $01, $40, $00, $40, $44, $04
      .byte $40, $42, $A0, $40, $4A, $A8, $40, $6B
      .byte $FA, $40, $6B, $FA, $40, $4A, $A8, $40
      .byte $42, $A0, $40, $44, $04, $40, $40, $00
      .byte $40, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $00, $08, $88, $00, $00, $40, $00
      .byte $01, $50, $00, $01, $50, $00, $00, $40
      .byte $00, $08, $88, $00, $00, $00, $20, $82
      .byte $00, $20, $82, $00, $04, $44, $00, $01
      .byte $50, $00, $01, $50, $00, $05, $D4, $00
      .byte $01, $50, $00, $01, $50, $00, $04, $44
      .byte $00, $20, $82, $00, $20, $82, $A0, $02
      .byte $80, $A0, $82, $80, $A0, $82, $80, $04
      .byte $44, $00, $01, $50, $00, $01, $50, $00
      .byte $05, $D4, $00, $05, $D4, $00, $01, $50
      .byte $00, $01, $50, $00, $04, $44, $00, $A0
      .byte $82, $80, $A0, $82, $80, $A0, $02, $80
      .byte $00, $00, $00, $00, $00, $00, $00, $00
      .byte $00, $01, $31, $00, $00, $FC, $00, $00
      .byte $FC, $00, $00, $FC, $00, $03, $77, $00
      .byte $03, $FF, $00, $03, $FF, $00, $03, $DF
      .byte $00, $00, $FC, $00, $00, $30, $00, $00
      .byte $88, $00, $00, $00, $00, $00, $00, $01
      .byte $31, $00, $00, $FC, $00, $03, $FF, $00
      .byte $03, $77, $00, $03, $77, $00, $03, $FF
      .byte $00, $0F, $FF, $C0, $0F, $FF, $C0, $0F
      .byte $DF, $C0, $0F, $FF, $C0, $03, $FF, $00
      .byte $00, $88, $00, $02, $8A, $00, $FC, $00
      .byte $10, $FC, $10, $07, $FF, $40, $03, $FF
      .byte $00, $0F, $FF, $C0, $0F, $77, $C0, $0F
      .byte $77, $C0, $0F, $BB, $C0, $3F, $FF, $F0
      .byte $3F, $FF, $F0, $3F, $57, $F0, $3F, $57
      .byte $F0, $0F, $FF, $C0, $0F, $FF, $C0, $02
      .byte $02, $00, $02, $02, $00, $0A, $02, $80
      .byte $0A, $02, $80, $00, $A8, $00, $0A, $AA
      .byte $80, $2A, $66, $A0, $26, $AA, $60, $AA
      .byte $AA, $A8, $9A, $66, $98, $AA, $AA, $A8
      .byte $9A, $66, $98, $AA, $AA, $A8, $26, $AA
      .byte $60, $2A, $66, $A0, $0A, $AA, $80, $00
      .byte $A8, $00, $00, $00, $00, $C0, $00, $00
      .byte $C4, $00, $80, $00, $00, $80, $80, $00
      .byte $03, $E0, $00, $0D, $78, $00, $0B, $5C
      .byte $40, $0B, $F8, $00, $C0, $28, $00, $00
      .byte $02, $00, $01, $02, $00, $00, $00, $01
      .byte $30, $00, $20, $11, $00, $20, $00, $00
      .byte $03, $F0, $80, $CF, $7C, $80, $CD, $5E
      .byte $00, $0D, $5F, $40, $07, $5E, $C0, $43
      .byte $FC, $C0, $00, $F0, $00, $23, $01, $00
      .byte $03, $10, $00, $00, $00, $41, $54, $08
      .byte $05, $F5, $40, $1F, $BF, $50, $3E, $AB
      .byte $D0, $7A, $5A, $D4, $79, $5A, $F4, $7A
      .byte $56, $F4, $7D, $5E, $F4, $1F, $BA, $D0
      .byte $17, $EF, $D0, $C5, $FF, $44, $00, $55
      .byte $00, $00, $00, $00, $00, $00, $08, $84
      .byte $00, $00, $00, $00, $83, $00, $80, $00
      .byte $00, $00, $20, $10, $C0, $01, $00, $00
      .byte $00, $00, $40, $40, $08, $00, $00, $00
      .byte $80, $08, $40, $04, $0C, $00, $00, $00
      .byte $00, $03, $00, $00, $00, $00, $40, $40
      .byte $04, $00, $00, $00, $00, $01, $00, $20
      .byte $00, $03, $00, $00, $00, $00, $C0, $00
      .byte $40, $00, $C0, $00, $00, $00, $00, $04
      .byte $02, $3F, $FF, $C0, $3F, $FF, $C0, $FF
      .byte $FF, $F0, $FF, $FF, $F0, $FE, $00, $00
      .byte $FE, $00, $00, $FE, $00, $00, $FE, $00
      .byte $00, $FE, $00, $00, $FE, $00, $00, $FE
      .byte $1F, $F0, $FE, $1F, $F0, $FE, $1F, $F0
      .byte $FE, $1F, $F0, $FE, $01, $F0, $FE, $01
      .byte $F0, $FE, $01, $F0, $FF, $FF, $F0, $FF
      .byte $FF, $F0, $3F, $FF, $C0, $3F, $FF, $C0
      .byte $3F, $FF, $C0, $3F, $FF, $C0, $FF, $FF
      .byte $F0, $FF, $FF, $F0, $FE, $07, $F0, $FE
      .byte $07, $F0, $FE, $07, $F0, $FE, $07, $F0
      .byte $FE, $07, $F0, $FE, $07, $F0, $FE, $07
      .byte $F0, $FE, $07, $F0, $FE, $07, $F0, $FE
      .byte $07, $F0, $FE, $07, $F0, $FE, $07, $F0
      .byte $FE, $07, $F0, $FF, $FF, $F0, $FF, $FF
      .byte $F0, $3F, $FF, $C0, $3F, $FF, $C0, $FF
      .byte $FF, $C0, $FF, $FF, $C0, $FF, $FF, $F0
      .byte $FF, $FF, $F0, $FE, $07, $F0, $FE, $07
      .byte $F0, $FE, $07, $F0, $FE, $07, $F0, $FE
      .byte $07, $F0, $FE, $07, $F0, $FF, $FF, $F0
      .byte $FF, $FF, $F0, $FF, $FF, $80, $FF, $FF
      .byte $80, $FE, $3F, $F0, $FE, $3F, $F0, $FE
      .byte $07, $F0, $FE, $07, $F0, $FE, $07, $F0
      .byte $FE, $07, $F0, $FE, $07, $F0, $FF, $FF
      .byte $F0, $FF, $FF, $F0, $FF, $FF, $F0, $FF
      .byte $FF, $F0, $FE, $00, $00, $FE, $00, $00
      .byte $FE, $00, $00, $FE, $00, $00, $FE, $00
      .byte $00, $FE, $00, $00, $FF, $F8, $00, $FF
      .byte $F8, $00, $FF, $F8, $00, $FF, $F8, $00
      .byte $FE, $00, $00, $FE, $00, $00, $FE, $00
      .byte $00, $FE, $00, $00, $FE, $00, $00, $FE
      .byte $00, $00, $FE, $30, $00, $00, $60, $00
      .byte $00, $C0, $00, $00, $60, $00, $00, $30
      .byte $00, $00, $60, $00, $00, $C0, $C0, $00
      .byte $00, $60, $00, $00, $30, $00, $00, $60
      .byte $00, $00, $C0, $00, $00, $60, $00, $00
      .byte $30, $C0, $00, $00, $C0, $00, $00, $C0
      .byte $00, $00, $C0, $00, $00, $C0, $00, $00
      .byte $C0, $00, $00, $C0, $00, $00, $C0, $00
      .byte $FF, $00, $FF, $00, $FF, $00, $FF, $00
      .byte $FF, $00, $FF, $00, $FF, $00, $FF, $F4
      .byte $FF, $00, $FF, $00, $FF, $00, $FF, $00
      .byte $AD, $00, $1A, $F2, $FF, $FF, $DB, $FE
      .byte $00, $7F, $00, $FF, $00, $FF, $00, $FF
      .byte $01, $FF, $00, $FF, $09, $FF, $00, $FF
      .byte $05, $FF, $00, $FF, $00, $FF, $00, $FF
      .byte $00, $FF, $00, $FF, $00, $A4, $00, $FF
      .byte $00, $FF, $00, $FF, $04, $FF, $00, $FF
      .byte $00, $FF, $00, $FF, $00, $FF, $20, $FF
      .byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
      .byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
      .byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
      .byte $00, $FF, $00, $FF, $09, $FF, $00, $FF
      .byte $01, $FF, $00, $FF, $00, $FF, $00, $FF
      .byte $00, $FF, $00, $5B, $00, $FF, $5F, $FF
      .byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
      .byte $00, $FF, $00, $FF, $00, $FF, $00, $0B
      .byte $00, $FF, $00, $FF, $00, $FF, $00, $FF
      .byte $52, $FF, $F6, $0D, $00, $00, $2C, $85

