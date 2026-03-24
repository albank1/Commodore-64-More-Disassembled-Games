;================================================================================
; Stellar Dodger (1983,Terminal Software)
;  
; Source in Dasm format
; To compile:
; a) dasm StellarDodger.asm -ostellardodger.prg
;================================================================================

      processor 6502

      .org $0801

      .byte $0F, $08, $25, $00, $9E, $32, $30, $36
      .byte $35, $20, $4A, $59, $53
      .byte $00                         ; 37 SYS2065 JYS
      .byte $00, $00                    ; <- end of BASIC program ->
      nop                               
      nop                               
      nop                               
      nop                               
      nop                               
      lda  #$36                         
      sta  $01                          ; 6510 I/O register
      jmp  W1E87                      

      .byte $71, $71, $71, $00, $FF, $71, $00, $FF 
      .byte $71, $00, $FF, $71, $00, $FF, $71, $00 
      .byte $FF, $71, $00, $FF, $71, $00, $FF, $71 
      .byte $00, $FF, $71, $00, $FF, $71, $00, $FF 
      .byte $71, $00, $FF, $71, $00, $FF, $71, $00 
      .byte $FF, $71, $00, $FF, $71, $00, $FF, $71 
      .byte $00, $FF, $71, $00, $FF, $71, $00, $FF 
      .byte $71, $00, $FF, $71, $00, $FF, $71, $00 
      .byte $FF, $71, $00, $FF, $71, $00, $FF, $71 
      .byte $00, $FF, $71, $00, $FF, $71, $00, $FF 
      .byte $71, $00, $FF, $71, $00, $FF, $71, $00 
      .byte $FF, $71, $00, $FF, $71, $00, $FF, $71 
      .byte $00, $FF, $71, $00, $FF, $71, $00, $FF 
      .byte $71, $00, $FF, $71, $00, $FF, $71, $00 
      .byte $FF, $71, $00, $FF, $71, $00, $FF, $71 
      .byte $00, $FF, $71, $00, $FF, $71, $00, $FF 
      .byte $71, $00, $FF, $71, $00, $FF, $71, $00 
      .byte $FF, $71, $00, $FF, $71, $00, $FF, $71 
      .byte $00, $FF, $71, $00, $FF, $71, $00, $FF 
      .byte $71, $00, $FF, $71, $00, $FF, $71, $00 
      .byte $FF, $71, $00, $FF, $71, $00, $FF, $71 
      .byte $00, $FF, $71, $00, $FF, $71, $00, $FF 
      .byte $71, $00, $FF, $71, $00, $FF, $71, $00 
      .byte $FF, $71, $00, $FF, $71, $00, $FF, $71 
      .byte $00, $FF, $71, $00, $20, $71, $FF, $08 
      .byte $71, $00, $08, $14, $22, $16, $08, $00 
      .byte $00, $08, $2C, $22, $63, $22, $04, $18 
      .byte $00, $00, $08, $36, $C1, $81, $6A, $14 
      .byte $00, $00, $02               
W0900:
      .byte $0D, $B1, $C1, $E2, $14, $08, $64, $5A 
      .byte $41, $81, $81, $62, $1A, $04, $18, $18 
      .byte $00, $07, $71, $18, $18, $00, $07, $71 
      .byte $18, $18, $00, $07, $71, $18, $18, $00 
      .byte $07, $71, $18, $18, $00, $07, $71, $18 
      .byte $18, $00, $07, $71, $18, $18, $00, $06 
      .byte $71, $18, $18, $08, $00, $08, $71, $08 
      .byte $00, $08, $71, $08, $00, $08, $71, $08 
      .byte $00, $08, $71, $08, $00, $08, $71, $08 
      .byte $00, $08, $71, $08, $00, $08, $71, $08 
      .byte $00, $00, $00, $C0, $F3, $FF, $FF, $FF 
      .byte $00, $00, $00, $18, $BC, $FE, $FE, $FF 
      .byte $80, $C0, $F0, $F0, $F0, $F8, $FE, $FF 
      .byte $80, $C0, $E0, $F0, $F7, $FF, $FF, $FF 
      .byte $00, $06, $71, $99, $FF, $0F, $07, $03 
      .byte $07, $0F, $9F, $FF, $FF, $1F, $3F, $7F 
      .byte $3F, $1F, $3F, $7F, $3F, $FF, $FF, $FF 
      .byte $F8, $05, $71, $FF, $FF, $FF, $00, $05 
      .byte $71, $FF, $FF, $FF, $1F, $05, $71, $00 
      .byte $08, $71, $F8, $0D, $71, $FF, $FF, $FF 
      .byte $00, $05, $71, $FF, $FF, $FF, $1F, $05 
      .byte $71, $FF, $FF, $FF, $1F, $08, $71, $18 
      .byte $0D, $71, $F8, $06, $71, $18, $05, $71 
      .byte $00, $05, $71, $F8, $F8, $F8, $00, $05 
      .byte $71, $1F, $1F, $1F, $00, $10, $38, $44 
      .byte $C6, $44, $38, $10, $00, $3C, $7E, $42 
      .byte $3C, $42, $66, $00, $00, $7E, $C3, $BD 
      .byte $7E, $81, $C3, $00, $00, $3C, $42, $81 
      .byte $7E, $18, $3C, $99, $00, $81, $7E, $81 
      .byte $A5, $81, $7E, $81, $7E, $42, $42, $62 
      .byte $62, $62, $7E, $00, $18, $07, $71, $00 
      .byte $7E, $66, $06, $0C, $18, $3E, $7E, $00 
W0A00:
      .byte $7E, $46, $06, $1E, $06, $46, $7E, $00 
      .byte $60, $60, $6C, $6C, $7F, $0C, $0C, $00 
      .byte $7E, $66, $60, $7E, $06, $66, $7E, $00 
      .byte $7E, $66, $60, $7C, $66, $66, $7E, $00 
      .byte $7E, $66, $0C, $3E, $18, $18, $18, $00 
      .byte $7E, $66, $66, $7E, $66, $66, $7E, $00 
      .byte $7E, $66, $66, $7E, $06, $66, $7E, $00 
      .byte $FF, $08, $71, $00, $FF, $07, $71, $00 
      .byte $00, $FF, $06, $71, $00, $00, $00, $FF 
      .byte $05, $71, $00, $04, $71, $FF, $04, $71 
      .byte $00, $05, $71, $FF, $FF, $FF, $00, $06 
      .byte $71, $FF, $FF, $00, $07, $71, $FF, $00 
      .byte $00, $00, $E7, $94, $E4, $94, $E7, $00 
      .byte $00, $00, $A5, $B5, $AD, $A5, $A5, $00 
      .byte $00, $00, $2F, $28, $2F, $21, $EF, $00 
      .byte $00, $00, $F7, $84, $F4, $14, $F7, $00 
      .byte $00, $00, $BD, $25, $25, $25, $BD, $00 
      .byte $00, $00, $CF, $28, $CC, $48, $2F, $00 
      .byte $00, $00, $97, $92, $F2, $92, $97, $00 
      .byte $00, $00, $BD, $21, $2D, $25, $BD, $00 
      .byte $00, $00, $20, $20, $E0, $20, $20, $00 
      .byte $00, $00, $E3, $94, $E7, $A4, $94, $00 
      .byte $00, $00, $3D, $91, $91, $91, $BD, $00 
      .byte $00, $00, $C0, $20, $20, $40, $80, $00 
      .byte $00, $00, $94, $D4, $B4, $94, $97, $00 
      .byte $00, $00, $A5, $BD, $A5, $A5, $A5, $00 
      .byte $00, $00, $CF, $28, $CE, $28, $CF, $00 
      .byte $00, $00, $70, $48, $70, $50, $48, $57 
      .byte $7F, $7F, $57, $F7, $F7, $57, $FF, $57 
      .byte $DF, $06, $71, $FF, $57, $7F, $7F, $5F 
      .byte $7F, $7F, $57, $FF, $7F, $06, $71, $57 
      .byte $FF, $DF, $77, $77, $77, $57, $77, $77 
W0B00:
      .byte $FF, $57, $77, $77, $77, $5F, $5F, $7F 
      .byte $FF, $57, $77, $05, $71, $57, $FF, $57 
      .byte $7F, $7F, $57, $77, $77, $57, $FF, $57 
      .byte $77, $77, $5F, $57, $77, $77, $FF, $00 
      .byte $00, $00, $F4, $84, $C4, $84, $87, $00 
      .byte $00, $00, $BD, $A1, $B9, $A1, $BD, $00 
      .byte $07, $71, $E0, $81, $A8, $4A, $51, $A9 
      .byte $95, $56, $81, $FF, $FF, $FE, $FC, $FC 
      .byte $FE, $FC, $C1, $FF, $FF, $10, $F9, $73 
      .byte $67, $CE, $9C, $FF, $FF, $20, $CF, $87 
      .byte $3E, $7C, $18, $FF, $FF, $CF, $9E, $3C 
      .byte $79, $F3, $20, $FF, $FF, $38, $78, $F2 
      .byte $E0, $CE, $9E, $FF, $FF, $70, $79, $72 
      .byte $61, $4C, $59, $F8, $F8, $38, $98, $38 
      .byte $F8, $F8, $F8, $FF, $FF, $03, $99, $CC 
      .byte $E6, $F3, $F0, $FF, $FF, $C3, $99, $CC 
      .byte $66, $33, $18, $FF, $FF, $81, $CC, $E6 
      .byte $73, $39, $38, $FF, $FF, $81, $CD, $67 
      .byte $32, $99, $0C, $FF, $FF, $83, $CF, $E1 
      .byte $33, $99, $0C, $FF, $FF, $07, $99, $C9 
      .byte $E0, $F3, $19, $F8, $05, $71, $78, $38 
      .byte $98, $00, $05, $0D, $06, $0E, $02, $0A 
      .byte $03, $0C, $08, $0D, $06, $71, $0B, $0B 
      .byte $71, $02, $02, $02, $0B, $0B, $02, $0B 
      .byte $08, $71, $02, $0B, $08, $71, $02, $0B 
      .byte $0B, $07, $04, $71, $0B, $0B, $02, $0B 
      .byte $08, $71, $02, $0B, $08, $71, $02, $0B 
      .byte $08, $71, $02, $0B, $08, $71, $02, $0B 
      .byte $08, $71, $02, $0B, $0B, $0C, $04, $71 
      .byte $0B, $0B, $02, $0B, $08, $71, $02, $0B 
      .byte $0B, $0F, $05, $71, $0B, $02, $0B, $08 
      .byte $71, $02, $0B, $08, $71, $02, $0B, $0B 
      .byte $0C, $04, $71, $0B, $0B, $02, $0B, $08 
      .byte $71, $02, $0B, $0B, $0F, $05, $71, $0B 
      .byte $02, $0B, $08, $71, $02, $0B, $08, $71 
      .byte $02, $0B, $0B, $0F, $0F, $0F, $0B, $0B 
      .byte $0B, $02, $0B, $0B, $0F, $04, $71, $0B 
      .byte $0B, $02, $0B, $08, $71, $02, $0B, $0B 
      .byte $0B, $0F, $0B, $04, $71, $02, $0B, $0A 
      .byte $71, $00, $0F, $71, $15, $55, $50, $54 
      .byte $88, $54, $15, $A9, $50, $00, $A8, $00 
      .byte $00, $88, $00, $05, $55, $40, $14, $88 
      .byte $50, $05, $A9, $40, $00, $A8, $00, $00 
      .byte $88, $00, $03, $FF, $00, $0F, $8B, $C0 
      .byte $03, $AB, $00, $00, $A8, $00, $00, $20 
      .byte $00, $00, $A8, $00, $20, $71, $05, $55 
      .byte $40, $14, $88, $50, $05, $A9, $40, $00 
      .byte $A8, $00, $00, $88, $00, $03, $FF, $00 
      .byte $0F, $8B, $C0, $03, $AB, $00, $00, $A8 
      .byte $00, $00, $20, $00, $00, $A8, $00, $2F 
      .byte $71, $03, $FF, $00, $0F, $8B, $C0, $03 
      .byte $AB, $00, $00, $A8, $00, $00, $20, $00 
      .byte $00, $A8, $00, $19, $71, $1F, $00, $01 
      .byte $FF, $00, $07, $FF, $00, $0F, $FF, $00 
      .byte $3F, $FF, $00, $7F, $FF, $00, $1F, $FF 
      .byte $00, $0F, $FF, $00, $1F, $FF, $00, $0F 
      .byte $FF, $00, $0F, $FF, $00, $03, $FF, $00 
      .byte $07, $FF, $00, $01, $FF, $FF, $00, $1C 
      .byte $71, $30, $00, $00, $54, $00, $02, $AA 
      .byte $00, $02, $56, $80, $09, $55, $80, $0D 
      .byte $5D, $80, $09, $55, $80, $0A, $56, $80 
      .byte $02, $56, $00, $00, $AA, $00, $02, $00 
      .byte $80, $08, $00, $20, $00, $1D, $71, $30 
      .byte $00, $00, $54, $00, $02, $AA, $00, $02 
      .byte $56, $80, $09, $55, $80, $0B, $57, $80 
      .byte $09, $55, $80, $0A, $56, $80, $02, $56 
      .byte $00, $00, $AA, $00, $02, $00, $80, $08 
      .byte $00, $20, $00, $1D, $71, $30, $00, $00 
      .byte $54, $00, $02, $AA, $00, $02, $56, $80 
      .byte $09, $55, $80, $09, $D5, $C0, $09, $55 
      .byte $80, $0A, $56, $80, $02, $56, $00, $00 
      .byte $AA, $00, $02, $00, $80, $08, $00, $20 
      .byte $00, $3B, $71, $CC, $00, $00, $30, $00 
      .byte $3C, $71, $33, $00, $00, $0C, $00, $1A 
      .byte $71, $0C, $00, $30, $38, $00, $2C, $38 
      .byte $00, $2C, $3C, $00, $3C, $3C, $00, $3C 
      .byte $34, $00, $1C, $FC, $00, $3C, $30, $00 
      .byte $0C, $30, $00, $0F, $EC, $00, $3B, $DC 
      .byte $00, $37, $EC, $00, $3B, $30, $00, $0C 
      .byte $00, $19, $71, $03, $FF, $C0, $02, $AA 
      .byte $80, $02, $AA, $80, $03, $FF, $C0, $01 
      .byte $41, $40, $01, $00, $40, $01, $00, $40 
      .byte $00, $15, $71, $1D, $1E, $1E, $1E, $1F 
      .byte $1D, $1E, $1F, $00, $21, $5B, $5C, $5D 
      .byte $25, $21, $3A, $25, $00, $22, $23, $23 
      .byte $23, $24, $21, $3A, $25, $1D, $1E, $04 
      .byte $71, $1F, $21, $3A, $25, $21, $42, $43 
      .byte $44, $20, $25, $21, $3A, $25, $22, $23 
      .byte $04, $71, $24, $21, $3A, $25, $5F, $60 
      .byte $61, $62, $63, $64, $65, $3A, $25, $66 
      .byte $67, $68, $69, $6A, $6B, $6C, $3A, $25 
      .byte $00, $06, $71, $21, $3A, $25, $1D, $1E 
      .byte $05, $71, $28, $3A, $25, $21, $45, $46 
      .byte $47, $20, $20, $26, $3A, $25, $21, $20 
      .byte $05, $71, $26, $3A, $25, $21, $30, $05 
      .byte $71, $26, $3A, $25, $22, $23, $05, $71 
      .byte $27, $3A, $25, $1D, $1E, $05, $71, $28 
      .byte $3A, $25, $21, $48, $49, $4A, $20, $20 
      .byte $26, $3A, $25, $21, $20, $05, $71, $26 
      .byte $3A, $25, $21, $30, $05, $71, $26, $3A 
      .byte $25, $22, $23, $05, $71, $27, $3A, $25 
      .byte $1D, $1E, $04, $71, $1F, $21, $3A, $25 
      .byte $21, $4B, $4C, $4D, $20, $25, $21, $3A 
      .byte $25, $21, $4E, $4F, $50, $51, $25, $21 
      .byte $3A, $25, $22, $29, $20, $2A, $23, $24 
      .byte $21, $3A, $25, $00, $21, $30, $25, $00 
      .byte $00, $21, $3A, $25, $00, $22, $23, $24 
      .byte $00, $00, $22, $23, $24, $16, $17, $20 
      .byte $04, $71, $00, $00, $18, $20, $20, $20 
      .byte $00, $00, $00, $18, $20, $20, $00, $04 
      .byte $71, $18, $20, $00, $05, $71, $19, $00 
      .byte $06, $71, $01, $00, $00, $00, $6E, $FC 
      .byte $00, $64, $00, $00, $00, $EA, $EA, $EA 
      .byte $20, $42, $50, $20, $21, $52, $20 
      adc  $50                          ; Scratch area
      jsr  $5083                        
      jsr  $5096                        
      jsr  $52E8                        
      jmp  $5310                        

      ldx  #$00                         
W0E9F:
      lda  $4800,x                      
      sta  $0800,x                      
      lda  $4900,x                      
      sta  W0900,x                      
      lda  $4A00,x                      
      sta  W0A00,x                      
      lda  $4B00,x                      
      sta  W0B00,x                      
      dex                               
      bne  W0E9F                        
      lda  #$13                         
      sta  $D018                        ; VIC memory control register
      rts                               

      ldx  #$00                         
W0EC2:
      lda  $4C59,x                      
      sta  $2D00,x                      
      lda  $4D59,x                      
      sta  $2E00,x                      
      lda  $4E59,x                      
      sta  $2F00,x                      
      lda  $4F59,x                      
      sta  $3000,x                      
      dex                               
      bne  W0EC2                        
      rts                               

      lda  #$20                         
      ldx  #$00                         
W0EE2:
      sta  $0400,x                      ; Video matrix (25*40)
      sta  $0500,x                      ; Video matrix (25*40)
      sta  $0600,x                      ; Video matrix (25*40)
      sta  $06E7,x                      ; Video matrix (25*40)
      dex                               
      bne  W0EE2                        
      ldx  #$08                         
      lda  $4F1A,x                      
      sta  $041F,x                      ; Video matrix (25*40)
      lda  $4F23,x                      
      sta  $0447,x                      ; Video matrix (25*40)
      lda  $4F2C,x                      
      sta  $046F,x                      ; Video matrix (25*40)
      lda  $4F35,x                      
      sta  $0497,x                      ; Video matrix (25*40)
      lda  $4F3E,x                      
      sta  $04BF,x                      ; Video matrix (25*40)
      lda  $4F47,x                      
      sta  $04E7,x                      ; Video matrix (25*40)
      lda  $4F50,x                      
      sta  $050F,x                      ; Video matrix (25*40)
      lda  $4F59,x                      
      sta  $0537,x                      ; Video matrix (25*40)
      lda  $4F62,x                      
      sta  $055F,x                      ; Video matrix (25*40)
      lda  $4F6B,x                      
      sta  $0587,x                      ; Video matrix (25*40)
      lda  $4F74,x                      
      sta  $05AF,x                      ; Video matrix (25*40)
      lda  $4F7D,x                      
      sta  $05D7,x                      ; Video matrix (25*40)
      lda  $4F86,x                      
      sta  $05FF,x                      ; Video matrix (25*40)
      lda  $4F8F,x                      
      sta  $0627,x                      ; Video matrix (25*40)
      lda  $4F98,x                      
      sta  $064F,x                      ; Video matrix (25*40)
      lda  $4FA1,x                      
      sta  $0677,x                      ; Video matrix (25*40)
      lda  $4FAA,x                      
      sta  $069F,x                      ; Video matrix (25*40)
      lda  $4FB3,x                      
      sta  $06C7,x                      ; Video matrix (25*40)
      lda  $4FBC,x                      
      sta  $06EF,x                      ; Video matrix (25*40)
      lda  $4FC5,x                      
      sta  $0717,x                      ; Video matrix (25*40)
      lda  $4FCE,x                      
      sta  $073F,x                      ; Video matrix (25*40)
      lda  $4FD7,x                      
      sta  $0767,x                      ; Video matrix (25*40)
      lda  $4FE0,x                      
      sta  $078F,x                      ; Video matrix (25*40)
      lda  $4FE9,x                      
      sta  $07B7,x                      ; Video matrix (25*40)
      lda  $4FF2,x                      
      sta  $07DF,x                      ; Video matrix (25*40)
      dex                               
      cpx  #$FF                         
      beq  W0F91                        
      jmp  $5098                        

W0F91:
      ldx  #$05                         
W0F93:
      lda  $4FFB,x                      
      sta  $0720,x                      ; Video matrix (25*40)
      lda  $5001,x                      
      sta  $0748,x                      ; Video matrix (25*40)
      lda  $5007,x                      
      sta  $0770,x                      ; Video matrix (25*40)
      lda  $500D,x                      
      sta  $0798,x                      ; Video matrix (25*40)
      lda  $5013,x                      
      sta  $07C0,x                      ; Video matrix (25*40)
      dex                               
      cpx  #$FF                         
      bne  W0F93                        
      lda  #$00                         
      sta  $0765                        ; Video matrix (25*40)
      sta  $0766                        ; Video matrix (25*40)
      sta  $078E                        ; Video matrix (25*40)
      sta  $07B6                        ; Video matrix (25*40)
      sta  $07DE                        ; Video matrix (25*40)
      lda  #$1C                         
      sta  $078D                        ; Video matrix (25*40)
      sta  $07B5                        ; Video matrix (25*40)
      lda  #$1B                         
      sta  $07DD                        ; Video matrix (25*40)
      ldx  #$17                         
      lda  #$1A                         
W0FD8:
      sta  $07C5,x                      ; Video matrix (25*40)
      dex                               
      bne  W0FD8                        
      lda  #$CF                         
      sta  $D015                        ; Sprites Abilitator
      lda  #$CF                         
      sta  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      lda  #$27                         
      sta  $D017                        ; (2X) vertical expansion (Y) sprite 0..7
      lda  #$00                         
      sta  $D01B                        ; Sprite-background screen priority
      lda  #$00                         
      sta  $D021                        ; Background 0 color
      lda  #$0B                         
      sta  $D020                        ; Border color
      lda  #$B4                         
      sta  $07F8                        ; Pointer to data sprites
      sta  $07F9                        ; Pointer to data sprites
      sta  $07FA                        ; Pointer to data sprites
      lda  #$D7                         
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
      lda  #$2E                         
      sta  $D00D                        ; Position Y sprite 6
      sta  $D00F                        ; Position Y sprite 7
      lda  #$E1                         
      sta  $D006                        ; Position X sprite 3
      lda  #$C8                         
      sta  $D007                        ; Position Y sprite 3
      lda  #$50                         
      sta  $D000                        ; Position X sprite 0
      lda  #$96                         
      sta  $D002                        ; Position X sprite 1
      lda  #$D2                         
      sta  $D004                        ; Position X sprite 2
      lda  #$34                         
      sta  $D009                        ; Position Y sprite 4
      lda  #$D5                         
      sta  $D001                        ; Position Y sprite 0
      sta  $D003                        ; Position Y sprite 1
      sta  $D005                        ; Position Y sprite 2
      lda  #$02                         
      sta  $D025                        ; Multicolor animation 0 register
      lda  #$07                         
      sta  $D026                        ; Multicolor animation 1 register
      lda  #$06                         
      sta  $D027                        ; Color sprite 0
      sta  $D028                        ; Color sprite 1
      sta  $D029                        ; Color sprite 2
      sta  $D02D                        ; Color sprite 6
      sta  $D02E                        ; Color sprite 7
      lda  #$0D                         
      sta  $D02A                        ; Color sprite 3
      lda  #$0E                         
      sta  $D02B                        ; Color sprite 4
      lda  #$07                         
      sta  $D02C                        ; Color sprite 5
      lda  #$B7                         
      sta  $07FB                        ; Pointer to data sprites
      lda  #$B8                         
      sta  $07FC                        ; Pointer to data sprites
      lda  #$BD                         
      sta  $07FE                        ; Pointer to data sprites
      lda  #$BE                         
      sta  $07FF                        ; Pointer to data sprites
      rts                               

      lda  #$D7                         
      sta  $59                          
      lda  #$FF                         
      sta  $58                          
      ldx  #$00                         
W1086:
      ldy  #$50                         
      lda  $4B68,x                      
W108B:
      sta  ($58),y                      
      dey                               
      bne  W108B                        
      clc                               
      lda  $58                          
      adc  #$50                         
      sta  $58                          
      lda  $59                          
      adc  #$00                         
      sta  $59                          
      inx                               
      cpx  #$0D                         
      bne  W1086                        
      ldx  #$08                         
      lda  $4B78,x                      
      sta  $D81F,x                      ; Color RAM
      lda  $4B81,x                      
      sta  $D847,x                      ; Color RAM
      lda  $4B8A,x                      
      sta  $D86F,x                      ; Color RAM
      lda  $4B93,x                      
      sta  $D897,x                      ; Color RAM
      lda  $4B9C,x                      
      sta  $D8BF,x                      ; Color RAM
      lda  $4BA5,x                      
      sta  $D8E7,x                      ; Color RAM
      lda  $4BAE,x                      
      sta  $D90F,x                      ; Color RAM
      lda  $4BB7,x                      
      sta  $D937,x                      ; Color RAM
      lda  $4BC0,x                      
      sta  $D95F,x                      ; Color RAM
      lda  $4BC9,x                      
      sta  $D987,x                      ; Color RAM
      lda  $4BD2,x                      
      sta  $D9AF,x                      ; Color RAM
      lda  $4BDB,x                      
      sta  $D9D7,x                      ; Color RAM
      lda  $4BE4,x                      
      sta  $D9FF,x                      ; Color RAM
      lda  $4BED,x                      
      sta  $DA27,x                      ; Color RAM
      lda  $4BF6,x                      
      sta  $DA4F,x                      ; Color RAM
      lda  $4BFF,x                      
      sta  $DA77,x                      ; Color RAM
      lda  $4C08,x                      
      sta  $DA9F,x                      ; Color RAM
      lda  $4C11,x                      
      sta  $DAC7,x                      ; Color RAM
      lda  $4C1A,x                      
      sta  $DAEF,x                      ; Color RAM
      lda  $4C23,x                      
      sta  $DB17,x                      ; Color RAM
      lda  $4C2C,x                      
      sta  $DB3F,x                      ; Color RAM
      lda  $4C35,x                      
      sta  $DB67,x                      ; Color RAM
      lda  $4C3E,x                      
      sta  $DB8F,x                      ; Color RAM
      lda  $4C47,x                      
      sta  $DBB7,x                      ; Color RAM
      lda  $4C50,x                      
      sta  $DBDF,x                      ; Color RAM
      dex                               
      cpx  #$FF                         
      beq  W1142                        
      jmp  $5249                        

W1142:
      rts                               

      lda  #$00                         
      sta  $D418                        ; Select volume and filter mode
      lda  #$80                         
      sta  $D412                        ; Voice 3: Control registers
      lda  #$D2                         
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      sta  $D414                        ; Generator 3: Sustain/Release
      lda  #$81                         
      sta  $D412                        ; Voice 3: Control registers
      lda  #$01                         
      sta  $D413                        ; Generator 3: Attack/Decay
      rts                               

      .byte $00, $05, $71, $03, $50, $00, $01, $01 
      .byte $01, $AD, $00, $DC, $8D, $0E, $53, $AD 
      .byte $01, $DC, $8D, $0F, $53, $A9, $09, $8D 
      .byte $08, $53, $8D, $09, $53, $A9, $CF, $8D 
      .byte $15, $D0                    
W1182:
      jsr  $5453                        
      jsr  $548F                        
      jsr  $5F35                        
      jsr  $6028                        
      and  #$10                         
      beq  W11A7                        
      dec  $5308                        
      bne  W1182                        
      dec  $5309                        
      bne  W1182                        
      lda  #$08                         
      sta  $5308                        
      sta  $5309                        
      jsr  $5F2F                        
W11A7:
      lda  $530D                        
      beq  W11B8                        
      lda  $530E                        
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  $530F                        
      sta  $DC01                        ; Data port B #1: keyboard, joystick, paddle
W11B8:
      jsr  $5042                        
      jsr  $5065                        
      jsr  $5083                        
      jsr  $5096                        
      jsr  $5CBB                        
      jsr  $5B01                        
      jsr  $57A6                        
      jsr  $53EE                        
      jsr  $5F35                        
      jsr  $5469                        
      lda  #$00                         
      sta  $53ED                        
      jsr  $5C73                        
      jsr  $55F5                        
      jsr  $5C97                        
      jsr  $5C3E                        
      jsr  $5F35                        
      lda  #$50                         
      sta  $530B                        
      jsr  $5EEB                        
W11F2:
      jsr  $54DD                        
      jsr  $53EE                        
      jsr  $5453                        
      jsr  $540E                        
      jsr  $5042                        
      jsr  $5065                        
      jsr  $5BF6                        
      jsr  $5C0B                        
      dec  $530B                        
      beq  W121F                        
      lda  $D01E                        ; Animations contact
      lda  $D01F                        ; Animation/background contact
      jsr  $604C                        
      and  #$10                         
      bne  W11F2                        
      jsr  $5F45                        
W121F:
      jsr  $5453                        
      jsr  $548F                        
      jsr  $54DD                        
      jsr  $55CB                        
      jsr  $5E3A                        
      jsr  $57DD                        
      jsr  $5D08                        
      jsr  $591B                        
      jsr  $594F                        
      jsr  $5BF6                        
      jmp  $59F9                        

      jmp  $5B87                        

      .byte $00, $0C, $0C, $00, $AD, $15, $D0, $09 
      .byte $10, $29, $DF, $8D, $15, $D0, $A9, $20 
      .byte $A0, $00, $91, $5C, $A9, $64, $8D, $26 
      .byte $50, $A9, $02, $8D, $25, $50, $A9, $01 
      .byte $8D, $F8, $59, $60          
      ldy  #$34                         
      sty  $D009                        ; Position Y sprite 4
      ldy  $D00D                        ; Position Y sprite 6
      cpy  #$2E                         
      bne  W129B                        
      ldy  $D00C                        ; Position X sprite 6
      iny                               
      cpy  #$DC                         
W1279:
      bne  W1284                        
      ldy  #$2F                         
      sty  $D00D                        ; Position Y sprite 6
      sty  $D00F                        ; Position Y sprite 7
      rts                               

W1284:
      sty  $D00C                        ; Position X sprite 6
      sty  $D00E                        ; Position X sprite 7
      iny                               
      ora  $8C71                        
      php                               
      bne  W12F1                        
      ldy  $D00C                        ; Position X sprite 6
      dey                               
      cpy  #$1E                         
      bne  W1279+1                      
      ldy  #$2E                         
W129B:
      sty  $D00D                        ; Position Y sprite 6
      sty  $D00F                        ; Position Y sprite 7
      rts                               

      lda  $5024                        
      sta  $5019                        
W12A8:
      lda  #$46                         
      sta  $501A                        
W12AD:
      dec  $501A                        
      bne  W12AD                        
      dec  $5019                        
      bne  W12A8                        
      rts                               

      lda  $5021                        
      asl                               
      .byte $04, $71                    
      sta  $5019                        
      sec                               
      lda  #$BE                         
      sbc  $5019                        
      sbc  $530C                        
      sta  $5024                        
      lda  #$64                         
      sta  $5026                        
      lda  #$02                         
      sta  $5025                        
      lda  #$00                         
      sta  $5027                        
      rts                               

      ldy  $D00D                        ; Position Y sprite 6
      cpy  #$2E                         
      bne  W12FC                        
      ldy  $D00C                        ; Position X sprite 6
      iny                               
      cpy  #$DC                         
      bne  W12F5                        
      ldy  #$2F                         
      sty  $D00D                        ; Position Y sprite 6
W12F1:
      sty  $D00F                        ; Position Y sprite 7
      rts                               

W12F5:
      sty  $D00C                        ; Position X sprite 6
      sty  $D00E                        ; Position X sprite 7
      rts                               

W12FC:
      ldy  $D00C                        ; Position X sprite 6
      dey                               
      cpy  #$1E                         
      bne  W12F5                        
      ldy  #$2E                         
      sty  $D00D                        ; Position Y sprite 6
      sty  $D00F                        ; Position Y sprite 7
      rts                               

      brk                               
      asl  $A971,x                      
      jsr  $00A0                        ; Real time clock HMS (1/60 sec)
      sta  ($5C),y                      
      lda  $0496                        ; Video matrix (25*40)
      sta  $54BF,y                      
      iny                               
      lda  $04C8                        ; Video matrix (25*40)
      sta  $54BF,y                      
      iny                               
      lda  $0536                        ; Video matrix (25*40)
      sta  $54BF,y                      
      iny                               
      lda  $0568                        ; Video matrix (25*40)
      sta  $54BF,y                      
      iny                               
      lda  $05D6                        ; Video matrix (25*40)
      sta  $54BF,y                      
      iny                               
      lda  $0608                        ; Video matrix (25*40)
      sta  $54BF,y                      
      iny                               
      lda  $0676                        ; Video matrix (25*40)
      sta  $54BF,y                      
      iny                               
      lda  $06A8                        ; Video matrix (25*40)
      sta  $54BF,y                      
      iny                               
      lda  $0716                        ; Video matrix (25*40)
      sta  $54BF,y                      
      ldx  #$1E                         
      ldy  #$1D                         
W1358:
      lda  $0478,y                      ; Video matrix (25*40)
      sta  $0478,x                      ; Video matrix (25*40)
      lda  $0518,y                      ; Video matrix (25*40)
      sta  $0518,x                      ; Video matrix (25*40)
      lda  $05B8,y                      ; Video matrix (25*40)
      sta  $05B8,x                      ; Video matrix (25*40)
      lda  $0658,y                      ; Video matrix (25*40)
      sta  $0658,x                      ; Video matrix (25*40)
      lda  $06F8,y                      ; Video matrix (25*40)
      sta  $06F8,x                      ; Video matrix (25*40)
      dey                               
      dex                               
      bne  W1358                        
      ldx  #$00                         
      ldy  #$01                         
W137E:
      lda  $04C8,y                      ; Video matrix (25*40)
      sta  $04C8,x                      ; Video matrix (25*40)
      lda  $0568,y                      ; Video matrix (25*40)
      sta  $0568,x                      ; Video matrix (25*40)
      lda  $0608,y                      ; Video matrix (25*40)
      sta  $0608,x                      ; Video matrix (25*40)
      lda  $06A8,y                      ; Video matrix (25*40)
      sta  $06A8,x                      ; Video matrix (25*40)
      inx                               
      iny                               
      cpy  #$1F                         
      bne  W137E                        
      ldy  #$00                         
      lda  $54BF,y                      
      sta  $0478                        ; Video matrix (25*40)
      iny                               
      lda  $54BF,y                      
      sta  $04E6                        ; Video matrix (25*40)
      iny                               
      lda  $54BF,y                      
      sta  $0518                        ; Video matrix (25*40)
      iny                               
      lda  $54BF,y                      
      sta  $0586                        ; Video matrix (25*40)
      iny                               
      lda  $54BF,y                      
      sta  $05B8                        ; Video matrix (25*40)
      iny                               
      lda  $54BF,y                      
      sta  $0626                        ; Video matrix (25*40)
      iny                               
      lda  $54BF,y                      
      sta  $0658                        ; Video matrix (25*40)
      iny                               
      lda  $54BF,y                      
      sta  $06C6                        ; Video matrix (25*40)
      iny                               
      lda  $54BF,y                      
      sta  $06F8                        ; Video matrix (25*40)
      lda  $5027                        
      beq  W13ED                        
      ldy  #$00                         
      lda  ($5C),y                      
      cmp  #$20                         
      bne  W13EE                        
      lda  #$06                         
      sta  ($5C),y                      
W13ED:
      rts                               

W13EE:
      lda  #$5E                         
      sta  ($5C),y                      
      jsr  $56DC                        
      jsr  $5CEF                        
      lda  #$00                         
      sta  $5027                        
      rts                               

      lda  #$04                         
      sta  $59                          
      lda  #$77                         
      sta  $58                          
      ldy  #$00                         
W1408:
      clc                               
      lda  $58                          
      adc  #$01                         
      sta  $58                          
      lda  $59                          
      adc  #$00                         
      sta  $59                          
      lda  ($58),y                      
      cmp  #$5E                         
      beq  W1420                        
      cmp  #$16                         
      bne  W1408                        
      rts                               

W1420:
      lda  #$20                         
      sta  ($58),y                      
      jmp  $55D5                        

      brk                               
      ldx  #$1F                         
      stx  $55F4                        
W142D:
      lda  $53ED                        
      cmp  #$01                         
      bne  W143A                        
      jsr  $548F                        
      jmp  $560A                        

W143A:
      jsr  $540E                        
      jsr  $54DD                        
      jsr  $5453                        
      jsr  $564C                        
      sta  $0479                        ; Video matrix (25*40)
      jsr  $564C                        
      sta  $04E6                        ; Video matrix (25*40)
      jsr  $564C                        
      sta  $0519                        ; Video matrix (25*40)
      jsr  $564C                        
      sta  $0586                        ; Video matrix (25*40)
      jsr  $564C                        
      sta  $05B9                        ; Video matrix (25*40)
      jsr  $564C                        
      sta  $0626                        ; Video matrix (25*40)
      jsr  $564C                        
      sta  $0659                        ; Video matrix (25*40)
      jsr  $564C                        
      sta  $06C6                        ; Video matrix (25*40)
      jsr  $564C                        
      sta  $06F9                        ; Video matrix (25*40)
      dec  $55F4                        
      bne  W142D                        
      rts                               

      lda  $5021                        
      lsr                               
      sta  $5019                        
      sec                               
      lda  #$F8                         
      sbc  $5019                        
      sta  $5019                        
      lda  $D41B                        ; Random numbers generator oscillator 3
      cmp  $5019                        
      bcs  W149A                        
      lda  #$20                         
      rts                               

W149A:
      jsr  $5D31                        
      lda  $5021                        
      lsr                               
      clc                               
      adc  #$01                         
      rts                               

      lda  #$26                         
      sta  $58                          
      lda  #$04                         
      sta  $59                          
      ldy  #$00                         
W14AF:
      clc                               
      lda  $58                          
      adc  #$28                         
      sta  $58                          
      lda  $59                          
      adc  #$00                         
      sta  $59                          
      lda  ($58),y                      
      cmp  #$20                         
      beq  W14AF                        
      cmp  #$23                         
      bne  W14C7                        
      rts                               

W14C7:
      cmp  #$3A                         
      bne  W14D0                        
      lda  #$3B                         
      sta  ($58),y                      
      rts                               

W14D0:
      cmp  #$3B                         
      bne  W14D9                        
      lda  #$3C                         
      sta  ($58),y                      
      rts                               

W14D9:
      cmp  #$3C                         
      bne  W14E2                        
      lda  #$3D                         
      sta  ($58),y                      
      rts                               

W14E2:
      cmp  #$3D                         
      bne  W14EB                        
      lda  #$3E                         
      sta  ($58),y                      
      rts                               

W14EB:
      cmp  #$3E                         
      bne  W14F4                        
      lda  #$3F                         
      sta  ($58),y                      
      rts                               

W14F4:
      cmp  #$3F                         
      bne  W14FD                        
W14F8:
      lda  #$40                         
      sta  ($58),y                      
      rts                               

W14FD:
      cmp  #$40                         
      bne  W1506                        
      lda  #$41                         
      sta  ($58),y                      
      rts                               

W1506:
      cmp  #$41                         
      bne  W14F8                        
      lda  #$20                         
      sta  ($58),y                      
      rts                               

      .byte $F8, $18, $AD, $1B, $50, $6D, $21, $50 
      .byte $8D, $1B, $50, $AD, $1C, $50, $69, $00 
      .byte $8D, $1C, $50, $AD, $1D, $50, $69, $00 
      .byte $8D, $1D, $50, $D8, $AD, $1B, $50, $4A 
      .byte $04, $71, $09, $30, $8D, $03, $06, $AD 
      .byte $1B, $50, $29, $0F, $09, $30, $8D, $04 
      .byte $06, $AD, $1C, $50, $4A, $04, $71, $09 
      .byte $30, $8D, $01, $06, $AD, $1C, $50, $29 
      .byte $0F, $09, $30, $8D, $02, $06, $AD, $1D 
      .byte $50, $29, $0F, $09, $30, $8D, $00, $06 
      .byte $AD, $05, $53, $D0, $12, $AD, $1C, $50 
      .byte $C9, $25, $90, $34, $EE, $0A, $53, $A9 
      .byte $01, $8D                    
      ora  $53                          
      jmp  $576E                        

      lda  $5306                        
      bne  W158D                        
      lda  $501C                        
      cmp  #$50                         
      bcc  W159F                        
      lda  #$01                         
      sta  $5306                        
      inc  $530A                        
      jmp  $576E                        

W158D:
      lda  $5307                        
      bne  W159F                        
      lda  $501D                        
      beq  W159F                        
      lda  #$01                         
      sta  $5307                        
      inc  $530A                        
W159F:
      lda  $501D                        
      cmp  $5020                        
      bcc  W15AC                        
      beq  W15AD                        
      jsr  $5794                        
W15AC:
      rts                               

W15AD:
      lda  $501C                        
      cmp  $501F                        
      bcc  W15AC                        
      beq  W15BB                        
      jsr  $5794                        
      rts                               

W15BB:
      lda  $501B                        
      cmp  $501E                        
      bcc  W15AC                        
      beq  W15AC                        
      .byte $AD, $1B, $50, $8D, $1E, $50, $AD, $1C 
      .byte $50, $8D, $1F, $50, $AD, $1D, $50, $8D 
      .byte $20, $50, $AD, $1E, $50, $4A, $04, $71 
      .byte $09, $30, $8D, $CB, $06, $AD, $1E, $50 
      .byte $29, $0F, $09, $30, $8D, $CC, $06, $AD 
      .byte $1F, $50, $4A, $04, $71, $09, $30, $8D 
      .byte $C9, $06, $AD, $1F, $50, $29, $0F, $09 
      .byte $30, $8D, $CA, $06, $AD, $20, $50, $29 
      .byte $0F, $09, $30, $8D, $C8, $06, $60 
      lda  $D015                        ; Sprites Abilitator
      and  #$DF                         
      sta  $D015                        ; Sprites Abilitator
      jsr  $5F45                        
      jsr  $604C                        
      tay                               
      and  #$04                         
      bne  W1633                        
      ldx  $D008                        ; Position X sprite 4
      cpx  #$1D                         
      bcc  W1633                        
      dec  $D008                        ; Position X sprite 4
      dec  $D008                        ; Position X sprite 4
      tya                               
      tax                               
      jsr  $5672                        
      txa                               
      tay                               
W1633:
      tya                               
      and  #$08                         
      bne  W164C                        
      ldx  $D008                        ; Position X sprite 4
      cpx  #$F5                         
      bcs  W164C                        
      inc  $D008                        ; Position X sprite 4
      inc  $D008                        ; Position X sprite 4
      tya                               
      tax                               
      jsr  $5672                        
      txa                               
      tay                               
W164C:
      tya                               
      and  #$02                         
      bne  W1671                        
      ldx  $5026                        
      dex                               
      stx  $5026                        
      cpx  #$63                         
      beq  W165F                        
      jmp  $5867                        

W165F:
      ldx  #$64                         
      stx  $5026                        
      ldx  $5025                        
      inx                               
      cpx  #$04                         
      bne  W166E                        
      ldx  #$03                         
W166E:
      stx  $5025                        
W1671:
      tya                               
      and  #$01                         
      bne  W1696                        
      ldx  $5026                        
      inx                               
      stx  $5026                        
      cpx  #$65                         
      beq  W1684                        
      jmp  $5867                        

W1684:
      ldx  #$64                         
      stx  $5026                        
      ldx  $5025                        
      dex                               
      cpx  #$FC                         
      bne  W1693                        
      ldx  #$FD                         
W1693:
      stx  $5025                        
W1696:
      lda  $07FC                        ; Pointer to data sprites
      cmp  #$B8                         
      bne  W16A5                        
      lda  #$B9                         
      sta  $07FC                        ; Pointer to data sprites
      jmp  $5887                        

W16A5:
      cmp  #$B9                         
      bne  W16B1                        
      lda  #$BA                         
      sta  $07FC                        ; Pointer to data sprites
      jmp  $5887                        

W16B1:
      lda  #$B8                         
      sta  $07FC                        ; Pointer to data sprites
      lda  $5025                        
      cmp  #$03                         
      beq  W16D4                        
      cmp  #$02                         
      beq  W16D7                        
      cmp  #$01                         
      beq  W16DD                        
      cmp  #$FF                         
      beq  W170E                        
      cmp  #$FE                         
      beq  W16FD                        
      cmp  #$FD                         
      beq  W16E9                        
      jmp  $58B4                        

W16D4:
      inc  $D009                        ; Position Y sprite 4
W16D7:
      inc  $D009                        ; Position Y sprite 4
      inc  $D009                        ; Position Y sprite 4
W16DD:
      inc  $D009                        ; Position Y sprite 4
      inc  $D009                        ; Position Y sprite 4
      lda  #$80                         
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      rts                               

W16E9:
      dec  $D009                        ; Position Y sprite 4
      lda  #$46                         
      dec  $D009                        ; Position Y sprite 4
      dec  $D009                        ; Position Y sprite 4
      dec  $D009                        ; Position Y sprite 4
      dec  $D009                        ; Position Y sprite 4
      jmp  $58E7                        

W16FD:
      dec  $D009                        ; Position Y sprite 4
      dec  $D009                        ; Position Y sprite 4
      dec  $D009                        ; Position Y sprite 4
      dec  $D009                        ; Position Y sprite 4
      lda  #$32                         
      jmp  $58E7                        

W170E:
      dec  $D009                        ; Position Y sprite 4
      dec  $D009                        ; Position Y sprite 4
      lda  #$28                         
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      lda  #$81                         
      sta  $D412                        ; Voice 3: Control registers
      jsr  $5672                        
      lda  $D015                        ; Sprites Abilitator
      ora  #$20                         
      sta  $D015                        ; Sprites Abilitator
      lda  $D008                        ; Position X sprite 4
      sta  $D00A                        ; Position X sprite 5
      lda  $D009                        ; Position Y sprite 4
      sbc  #$11                         
      sta  $D00B                        ; Position Y sprite 5
      lda  $07FD                        ; Pointer to data sprites
      cmp  #$BB                         
      beq  W1744                        
      lda  #$BB                         
      sta  $07FD                        ; Pointer to data sprites
      rts                               

W1744:
      lda  #$BC                         
      sta  $07FD                        ; Pointer to data sprites
      rts                               

      lda  $D009                        ; Position Y sprite 4
      cmp  #$2A                         
      bcc  W1752                        
      rts                               

W1752:
      lda  #$08                         
      sta  $55F4                        
      lda  $D015                        ; Sprites Abilitator
      and  #$DF                         
      sta  $D015                        ; Sprites Abilitator
W175F:
      jsr  $548F                        
      jsr  $54DD                        
      jsr  $5672                        
      jsr  $5453                        
      inc  $D009                        ; Position Y sprite 4
      dec  $55F4                        
      bne  W175F                        
      lda  #$64                         
      sta  $5026                        
      lda  #$01                         
      sta  $5025                        
      rts                               

      lda  $5027                        
      bne  W17C8                        
      lda  #$00                         
      sta  $5C                          
      lda  #$04                         
      sta  $5D                          
      jsr  $604C                        
      and  #$10                         
      beq  W1793                        
      rts                               

W1793:
      inc  $5027                        
      jsr  $5672                        
      jsr  $5672                        
      jsr  $5CDF                        
      sec                               
      lda  $D009                        ; Position Y sprite 4
      sbc  #$28                         
      lsr                               
      lsr                               
      lsr                               
      tay                               
      lda  $D008                        ; Position X sprite 4
      sec                               
      sbc  #$0E                         
      lsr                               
      lsr                               
      lsr                               
      sta  $5C                          
      lda  #$04                         
      sta  $5D                          
W17B8:
      clc                               
      lda  $5C                          
      adc  #$28                         
      sta  $5C                          
      lda  $5D                          
      adc  #$00                         
      sta  $5D                          
      dey                               
      bne  W17B8                        
W17C8:
      ldy  #$00                         
      lda  ($5C),y                      
      cmp  #$20                         
      bne  W17D3                        
      jsr  $5CEF                        
W17D3:
      lda  #$20                         
      sta  ($5C),y                      
      sec                               
      lda  $5C                          
      sbc  #$28                         
      sta  $5C                          
      lda  $5D                          
      sbc  #$00                         
      sta  $5D                          
      ldy  #$00                         
      lda  ($5C),y                      
      cmp  #$20                         
      beq  W17FC                        
      lda  #$5E                         
      sta  ($5C),y                      
      jsr  $56DC                        
      lda  #$00                         
      sta  $5027                        
      jsr  $5CEF                        
      rts                               

W17FC:
      lda  #$0D                         
      sta  ($5C),y                      
      lda  #$0C                         
      sta  $5BF5                        
      sta  ($5C),y                      
      lda  #$0B                         
      sta  ($5C),y                      
      lda  #$0A                         
      sta  ($5C),y                      
      lda  #$09                         
      sta  ($5C),y                      
      lda  #$08                         
      sta  ($5C),y                      
      lda  #$07                         
      sta  ($5C),y                      
      lda  $5D                          
      cmp  #$03                         
      bne  W1826                        
      lda  #$00                         
      sta  $5027                        
W1826:
      rts                               

      ora  ($AD,x)                      ; Pointer: Tape buffer/Screen scrolling
      sed                               
      eor  $03D0,y                      ; Tape I/O buffer
      jmp  $5A82                        

      ldy  $D01E                        ; Animations contact
      tya                               
      and  #$01                         
      beq  W185C                        
      ldx  $07F8                        ; Pointer to data sprites
      cpx  #$B6                         
      bne  W1850                        
      lda  $D015                        ; Sprites Abilitator
      and  #$FE                         
      sta  $D015                        ; Sprites Abilitator
      dec  $5B00                        
      jsr  $5ADC                        
      jmp  $5B70                        

W1850:
      inc  $07F8                        ; Pointer to data sprites
      dec  $5B00                        
      jsr  $5AB6                        
      jmp  $5B70                        

W185C:
      tya                               
      and  #$02                         
      beq  W1885                        
      ldx  $07F9                        ; Pointer to data sprites
      cpx  #$B6                         
      bne  W1879                        
      lda  $D015                        ; Sprites Abilitator
      and  #$FD                         
      sta  $D015                        ; Sprites Abilitator
      dec  $5B00                        
      jsr  $5ADC                        
      jmp  $5B70                        

W1879:
      inc  $07F9                        ; Pointer to data sprites
      dec  $5B00                        
      jsr  $5AB6                        
      jmp  $5B70                        

W1885:
      tya                               
      and  #$04                         
      beq  W18AE                        
      ldx  $07FA                        ; Pointer to data sprites
      cpx  #$B6                         
      bne  W18A2                        
      lda  $D015                        ; Sprites Abilitator
      and  #$FB                         
      sta  $D015                        ; Sprites Abilitator
      dec  $5B00                        
      jsr  $5ADC                        
      jmp  $5B70                        

W18A2:
      inc  $07FA                        ; Pointer to data sprites
      dec  $5B00                        
      jsr  $5AB6                        
      jmp  $5B70                        

W18AE:
      jmp  $5B87                        

      lda  $D01E                        ; Animations contact
      tay                               
      and  #$90                         
      cmp  #$90                         
      beq  W18BE                        
      jmp  $5B87                        

W18BE:
      tya                               
      and  #$50                         
      cmp  #$50                         
      bne  W18C8                        
      jmp  $5B9B                        

W18C8:
      lda  #$01                         
      sta  $59F8                        
      lda  #$64                         
      sta  $5026                        
      lda  #$00                         
      sta  $5025                        
      lda  #$5A                         
      jsr  $5EC2                        
      jsr  $5B37                        
      jsr  $5C63                        
      jmp  $538B                        

      clc                               
      lda  $5021                        
      adc  #$30                         
      sta  $04C0                        ; Video matrix (25*40)
      lda  #$30                         
      sta  $04C1                        ; Video matrix (25*40)
      sta  $04C2                        ; Video matrix (25*40)
      lda  #$20                         
      sta  $04C3                        ; Video matrix (25*40)
      lda  #$0F                         
      sta  $5BF5                        
      clc                               
      sed                               
      lda  $501C                        
      adc  $5021                        
      jmp  $56EC                        

      clc                               
      lda  $5021                        
      adc  #$30                         
      sta  $04C0                        ; Video matrix (25*40)
      lda  #$30                         
      sta  $04C1                        ; Video matrix (25*40)
      sta  $04C2                        ; Video matrix (25*40)
      lda  #$15                         
      sta  $5BF5                        
      sed                               
      clc                               
      lda  $501C                        
      adc  $5021                        
      adc  $5021                        
      jmp  $56EC                        

      ora  #$A9                         
      ora  ($8D,x)                      ; Real value of the RND seed
      and  ($50,x)                      
      lda  #$31                         
      sta  $07B9                        ; Video matrix (25*40)
      lda  #$00                         
      sta  $501B                        
      sta  $501C                        
      sta  $501D                        
      sta  $5305                        
      sta  $5306                        
      sta  $5307                        
      sta  $530C                        
      lda  #$03                         
      sta  $530A                        
      lda  #$09                         
      sta  $5B00                        
      lda  #$00                         
      sta  $D413                        ; Generator 3: Attack/Decay
      lda  #$B8                         
      sta  $D414                        ; Generator 3: Sustain/Release
      rts                               

      lda  $5B00                        
      beq  W196C                        
      rts                               

W196C:
      inc  $5021                        
      lda  $07B9                        ; Video matrix (25*40)
      cmp  #$3A                         
      bne  W1999                        
      lda  #$31                         
      sta  $07B9                        ; Video matrix (25*40)
      lda  #$09                         
      sta  $5B00                        
      lda  #$B4                         
      sta  $07F8                        ; Pointer to data sprites
      sta  $07F9                        ; Pointer to data sprites
      sta  $07FA                        ; Pointer to data sprites
      lda  $D015                        ; Sprites Abilitator
      ora  #$07                         
      sta  $D015                        ; Sprites Abilitator
      jsr  $5C3E                        
      jmp  $5374                        

W1999:
      inc  $07B9                        ; Video matrix (25*40)
      jmp  $5B4C                        

      lda  #$00                         
      sta  $59F8                        
      lda  #$64                         
      sta  $5026                        
      lda  #$00                         
      sta  $5025                        
      lda  #$64                         
      jsr  $5EC2                        
      jmp  $53C6                        

      lda  $D01F                        ; Animation/background contact
      and  #$10                         
      bne  W19CA                        
      lda  $07BE                        ; Video matrix (25*40)
      cmp  #$20                         
      beq  W19C7                        
      jmp  $53C6                        

W19C7:
      jsr  $5F55                        
W19CA:
      ldx  #$14                         
      jsr  $5F35                        
W19CF:
      jsr  $5453                        
      lda  $D41B                        ; Random numbers generator oscillator 3
      sta  $D02B                        ; Color sprite 4
      lda  $D41B                        ; Random numbers generator oscillator 3
      sta  $D025                        ; Multicolor animation 0 register
      lda  $D41B                        ; Random numbers generator oscillator 3
      sta  $D026                        ; Multicolor animation 1 register
      jsr  $5EFB                        
      dex                               
      bne  W19CF                        
      jsr  $5EEB                        
      lda  #$0E                         
      sta  $D02B                        ; Color sprite 4
      lda  #$02                         
      sta  $D025                        ; Multicolor animation 0 register
      lda  #$07                         
      sta  $D026                        ; Multicolor animation 1 register
      ldy  #$00                         
      lda  #$20                         
      sta  ($5C),y                      
      lda  #$2B                         
      sta  $5C                          
      lda  #$04                         
      sta  $5D                          
      sty  $5027                        
      dec  $530A                        
      beq  W1A1D                        
      lda  $5B00                        
      bne  W1A1A                        
      jmp  $5B3D                        

W1A1A:
      jmp  $538B                        

W1A1D:
      jsr  $5DA5                        
      jmp  $531C                        

      .byte $00, $12, $CE, $F4, $5B, $AD, $F4, $5B 
      .byte $29, $07, $C9, $07, $D0, $03, $20, $72 
      .byte $56                         
      dec  $5BF5                        
      beq  W1A3A                        
      rts                               

W1A3A:
      lda  #$20                         
      sta  $04C0                        ; Video matrix (25*40)
      sta  $04C1                        ; Video matrix (25*40)
      sta  $04C2                        ; Video matrix (25*40)
      sta  $04C3                        ; Video matrix (25*40)
      sta  $5BF5                        
      lda  $530A                        
      ldx  #$2C                         
      cmp  #$02                         
      beq  W1A69                        
      cmp  #$01                         
      beq  W1A6C                        
      cmp  #$03                         
      beq  W1A66                        
      cmp  #$04                         
      beq  W1A63                        
      stx  $04C3                        ; Video matrix (25*40)
W1A63:
      stx  $04C0                        ; Video matrix (25*40)
W1A66:
      stx  $04C1                        ; Video matrix (25*40)
W1A69:
      stx  $04C2                        ; Video matrix (25*40)
W1A6C:
      rts                               

W1A6D:
      lda  #$26                         
      sta  $58                          
      lda  #$04                         
      sta  $59                          
      ldy  #$00                         
      clc                               
      lda  $58                          
      adc  #$28                         
      sta  $58                          
      lda  $59                          
      adc  #$00                         
      sta  $59                          
      lda  ($58),y                      
      cmp  #$23                         
      bne  W1A8B                        
      rts                               

W1A8B:
      lda  #$3A                         
      sta  ($58),y                      
      jmp  $5C48                        

      lda  $5B00                        
      cmp  #$07                         
      beq  W1A6D                        
      cmp  #$05                         
      beq  W1A6D                        
      cmp  #$03                         
      beq  W1A6D                        
      rts                               

      ldy  #$00                         
      lda  #$26                         
      sta  $58                          
      lda  #$D8                         
      sta  $59                          
      ldx  #$18                         
      clc                               
      lda  $58                          
      adc  #$28                         
      sta  $58                          
      lda  $59                          
      adc  #$00                         
      sta  $59                          
      dex                               
      bne  W1ABF                        
      rts                               

W1ABF:
      lda  #$03                         
      sta  ($58),y                      
      jmp  $5C7F                        

      ldy  #$00                         
      lda  #$26                         
      sta  $58                          
      lda  #$D8                         
      sta  $59                          
      ldx  #$18                         
      clc                               
      lda  $58                          
      adc  #$28                         
      sta  $58                          
      lda  $59                          
      adc  #$00                         
      sta  $59                          
      dex                               
      bne  W1AE3                        
      rts                               

W1AE3:
      lda  #$02                         
      sta  ($58),y                      
      jmp  $5CA3                        

      lda  #$8F                         
      sta  $D418                        ; Select volume and filter mode
      lda  #$11                         
      sta  $D405                        ; Generator 1: Attack/Decay
      lda  #$62                         
      sta  $D406                        ; Generator 1: Sustain/Release
      lda  #$20                         
      sta  $D404                        ; Voice 1: Control registers
      lda  #$10                         
      sta  $D40B                        ; Voice 2: Control registers
      lda  #$22                         
      sta  $D40C                        ; Generator 2: Attack/Decay
      lda  #$31                         
      sta  $D40D                        ; Generator 2: Sustain/Release
      rts                               

      lda  #$8C                         
      sta  $53EB                        
      lda  #$81                         
      sta  $D404                        ; Voice 1: Control registers
      lda  #$00                         
      sta  $D400                        ; Voice 1: Frequency control (lo byte)
      rts                               

      lda  #$11                         
      sta  $D40B                        ; Voice 2: Control registers
      lda  #$00                         
      sta  $D407                        ; Voice 2: Frequency control (lo byte)
      lda  $53EA                        
      sta  $53EC                        
      adc  #$28                         
      adc  $53EA                        
      sta  $D408                        ; Voice 2: Frequency control (hi byte)
      rts                               

      lda  $53EB                        
      bne  W1B44                        
      lda  #$80                         
      sta  $D404                        ; Voice 1: Control registers
      jmp  $5D1E                        

W1B44:
      sec                               
      sbc  #$0A                         
      sta  $53EB                        
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      lda  $53EC                        
      beq  W1B5F                        
      dec  $D408                        ; Voice 2: Frequency control (hi byte)
      dec  $53EC                        
      bne  W1B5F                        
      lda  #$10                         
      sta  $D40B                        ; Voice 2: Control registers
W1B5F:
      rts                               

      stx  $5D5C                        
      sty  $5D5D                        
      lda  #$32                         
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      lda  #$10                         
      sta  $D404                        ; Voice 1: Control registers
      lda  #$11                         
      sta  $D404                        ; Voice 1: Control registers
      ldx  #$28                         
W1B77:
      ldy  #$64                         
W1B79:
      dey                               
      bne  W1B79                        
      dex                               
      bne  W1B77                        
      lda  #$10                         
      sta  $D404                        ; Voice 1: Control registers
      ldx  $5D5C                        
      ldy  $5D5D                        
      rts                               

      .byte $00, $00, $60, $FE, $03, $60, $FE, $03 
      .byte $6C, $DF, $03, $7A, $34, $01, $6C, $DF 
      .byte $01, $7A, $34, $02, $91, $53, $03, $7A 
      .byte $34, $07, $11, $25, $08, $11, $25, $05 
      .byte $11, $25, $02, $11, $25, $07, $14, $64 
      .byte $05, $13, $3F, $02, $13, $3F, $06, $11 
      .byte $25, $03, $11, $25, $04, $11, $25, $02 
      .byte $11, $25, $14, $11, $25, $19, $A5, $59 
      .byte $4A, $85, $59, $A5, $58, $6A, $85, $58 
      .byte $60, $A0, $00, $A9, $20, $8D, $04, $D4 
      .byte $8D, $0B, $D4               
W1BDE:
      lda  $5D76,y                      
      sta  $59                          
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      iny                               
      lda  $5D76,y                      
      sta  $58                          
      sta  $D400                        ; Voice 1: Frequency control (lo byte)
      jsr  $5D9A                        
      lda  $58                          
      sta  $D407                        ; Voice 2: Frequency control (lo byte)
      lda  $59                          
      sta  $D408                        ; Voice 2: Frequency control (hi byte)
      lda  #$21                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      iny                               
      lda  $5D76,y                      
      jsr  $5E26                        
      cpy  #$21                         
      bcc  W1BDE                        
      rts                               

      ldy  #$00                         
W1C12:
      lda  $5D5E,y                      
      sta  $59                          
      iny                               
      lda  $5D5E,y                      
      sta  $58                          
      sec                               
      lda  #$04                         
      sbc  $5021                        
      tax                               
W1C24:
      jsr  $5D9A                        
      dex                               
      bne  W1C24                        
      lda  $58                          
      sta  $D400                        ; Voice 1: Frequency control (lo byte)
      lda  $59                          
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      jsr  $5D9A                        
      lda  $58                          
      sta  $D407                        
      lda  $59                          
      sta  $D408                        ; Voice 2: Frequency control (hi byte)
      lda  #$21                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      iny                               
      lda  $5D5E,y                      
      jsr  $5E26                        
      cpy  #$18                         
      bcc  W1C12                        
      rts                               

      tax                               
W1C56:
      jsr  $5F1C                        
      dex                               
      bne  W1C56                        
      lda  #$20                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      jsr  $5F1C                        
      iny                               
      rts                               

      lda  #$04                         
      sta  $59                          
      lda  #$77                         
      sta  $58                          
      ldy  #$00                         
      sty  $53EA                        
W1C76:
      clc                               
      lda  $58                          
      adc  #$01                         
      sta  $58                          
      lda  $59                          
      adc  #$00                         
      sta  $59                          
      lda  ($58),y                      
      beq  W1C76                        
      cmp  #$06                         
      bcc  W1C92                        
      cmp  #$16                         
      bne  W1C76                        
      jmp  $5E69                        

W1C92:
      inc  $53EA                        
      jmp  $5E47                        

      lda  $53EA                        
      lsr                               
      cmp  $5021                        
      bcc  W1CA2                        
      rts                               

W1CA2:
      jsr  $5DE1                        
      inc  $530C                        
      jsr  $5672                        
      lda  $58                          
      sta  $5A                          
      lda  $59                          
      sta  $5B                          
      jsr  $5F35                        
W1CB6:
      jsr  $5672                        
      jsr  $56DC                        
      jsr  $5D31                        
      lda  $07BE                        ; Video matrix (25*40)
      cmp  #$20                         
      bne  W1CB6                        
      jsr  $5C3E                        
      lda  #$01                         
      sta  $53ED                        
      jsr  $5C73                        
      jsr  $55F5                        
      jsr  $5EAF                        
      jsr  $5C97                        
      jsr  $5F45                        
      rts                               

W1CDE:
      jsr  $5672                        
      jsr  $5D31                        
      lda  $58                          
      cmp  $5A                          
      bne  W1CDE                        
      lda  $59                          
      cmp  $5B                          
      bne  W1CDE                        
      rts                               

      stx  $5D5C                        
      sty  $5D5D                        
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      lda  #$20                         
      sta  $D404                        ; Voice 1: Control registers
      lda  #$21                         
      sta  $D404                        ; Voice 1: Control registers
      ldx  #$3C                         
W1D06:
      ldy  #$64                         
W1D08:
      dey                               
      bne  W1D08                        
      dex                               
      bne  W1D06                        
      lda  #$20                         
      sta  $D404                        ; Voice 1: Control registers
      ldx  $5D5C                        
      ldy  $5D5D                        
      rts                               

      lda  #$80                         
      sta  $D404                        ; Voice 1: Control registers
      lda  #$10                         
      sta  $D40B                        ; Voice 2: Control registers
      lda  #$8F                         
      sta  $D418                        ; Select volume and filter mode
      rts                               

      lda  #$81                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      txa                               
      ror                               
      ror                               
      sta  $5019                        
      lda  $D41B                        ; Random numbers generator oscillator 3
      and  #$07                         
      rol                               
      rol                               
      rol                               
      sbc  $5019                        
      sta  $D408                        ; Voice 2: Frequency control (hi byte)
      ror                               
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      rts                               

      lda  #$55                         
      sta  $501A                        
W1D50:
      sta  $5019                        
W1D53:
      dec  $5019                        
      bne  W1D53                        
      dec  $501A                        
      bne  W1D50                        
      rts                               

      lda  #$01                         
      sta  $530A                        
      rts                               

      lda  #$8F                         
      sta  $D418                        ; Select volume and filter mode
      lda  #$81                         
      sta  $D412                        ; Voice 3: Control registers
      lda  #$DC                         
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      rts                               

      lda  #$0F                         
      sta  $D418                        ; Select volume and filter mode
      lda  #$80                         
      sta  $D412                        ; Voice 3: Control registers
      lda  #$DC                         
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      rts                               

      lda  $D015                        ; Sprites Abilitator
      and  #$DF                         
      sta  $D015                        ; Sprites Abilitator
      sec                               
      lda  #$FF                         
      sbc  $D009                        ; Position Y sprite 4
      sta  $5029                        
      lda  #$8F                         
      sta  $D418                        ; Select volume and filter mode
      lda  #$80                         
      sta  $D40B                        ; Voice 2: Control registers
W1D9F:
      jsr  $548F                        
      jsr  $5453                        
      lda  #$20                         
      ldy  #$00                         
      sta  ($5C),y                      
      jsr  $54DD                        
      jsr  $55CB                        
      lda  $5029                        
      jsr  $5EC2                        
      jsr  $591B                        
      jsr  $5BF6                        
      inc  $D009                        ; Position Y sprite 4
      inc  $D009                        ; Position Y sprite 4
      dec  $5029                        
      dec  $5029                        
      lda  $D01F                        ; Animation/background contact
      and  #$10                         
      beq  W1DD1                        
      rts                               

W1DD1:
      lda  $D01E                        ; Animations contact
      and  #$10                         
      beq  W1D9F                        
      rts                               

      jsr  $5FDF                        
      cmp  #$06                         
      beq  W1DFF                        
      cmp  #$01                         
      beq  W1DFF                        
      cmp  #$04                         
      beq  W1E02                        
      cmp  #$05                         
      beq  W1E05                        
      cmp  #$27                         
      beq  W1E08                        
      cmp  #$24                         
      beq  W1E08                        
      cmp  #$37                         
      beq  W1E0B                        
      cmp  #$34                         
      beq  W1E0B                        
      lda  #$7F                         
      rts                               

W1DFF:
      lda  #$6F                         
      rts                               

W1E02:
      lda  #$7E                         
      rts                               

W1E05:
      lda  #$7D                         
      rts                               

W1E08:
      lda  #$7B                         
      rts                               

W1E0B:
      lda  #$77                         
      rts                               

      lda  #$FF                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      cmp  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      bne  W1E42                        
      cmp  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      bne  W1E42                        
      lda  #$00                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  #$FF                         
      cmp  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      beq  W1E42                        
      ldx  #$07                         
W1E2B:
      ldy  #$07                         
      lda  $6020,x                      
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
W1E33:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cmp  $6020,y                      
      beq  W1E43                        
      dey                               
      bpl  W1E33                        
      dex                               
      bpl  W1E2B                        
      txa                               
W1E42:
      rts                               

W1E43:
      .byte $8A, $0A, $04, $71          
      sty  $5028                        
      ora  $5028                        
      rts                               

      inc  $FBFD,x                      
      isb  $EF,x                        ; Table of screen line/Transient editor
      dcp  $7FBF,x                      
      jsr  $5FDF                        
      cmp  #$FF                         
      bne  W1E5E                        
      rts                               

W1E5E:
      cmp  #$04                         
      beq  W1E74                        
      cmp  #$05                         
      beq  W1E74                        
      cmp  #$06                         
      beq  W1E74                        
      cmp  #$03                         
      beq  W1E74                        
      lda  #$00                         
      sta  $530D                        
      rts                               

W1E74:
      lda  #$01                         
      sta  $530D                        
      rts                               

      lda  $530D                        
      bne  W1E82                        
      jmp  $5FAA                        

W1E82:
      lda  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      rts                               
      .byte $61
W1E87:
      sei                               
      ldx  #$25                         
      ldy  #$00                         
      stx  $14                          
      sty  $15                          
      ldx  #$86                         
      ldy  #$1E                         
      stx  $FC                          
      sty  $FD                          
      ldy  #$00                         
      ldx  #$7B                         
W1E9C:
      lda  W1EA5+2,x                    
      sta  $0333,x                      
      dex                               
      bne  W1E9C                        
W1EA5:
      jmp  $0384                        ; Tape I/O buffer

      .byte $14, $08, $25, $00, $9E, $20, $32, $30 
      .byte $35, $32, $32, $20, $42, $4C, $91, $44 
      .byte $49, $45, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00 
W1EC7:
      dey                               
      cpy  #$FF                         
      bne  W1ECE                        
      dec  $FD                          
W1ECE:
      lda  ($FC),y                      
      sta  $FF                          
      dey                               
      cpy  #$FF                         
      bne  W1ED9                        
      dec  $FD                          
W1ED9:
      lda  ($FC),y                      
      cmp  #$71                         
      beq  W1F0E                        
W1EDF:
      sta  $6058,x                      
      dex                               
      cpx  #$FF                         
      bne  W1EED                        
      dec  $036D                        ; Tape I/O buffer
      dec  $038C                        ; Tape I/O buffer
W1EED:
      dec  $FF                          ; Transient data area of BASIC
      bne  W1EDF                        
W1EF1:
      dey                               
      cpy  #$FF                         
      bne  W1EF8                        
      dec  $FD                          
W1EF8:
      lda  ($FC),y                      
      cmp  #$71                         
      beq  W1EC7                        
      sta  $6058,x                      
      dex                               
      cpx  #$FF                         
      bne  W1EF1                        
      dec  $036D                        
      dec  $038C                        
      bne  W1EF1                        
W1F0E:
      ldx  #$1F                         
W1F10:
      lda  $0333,x                      
      sta  $0800,x                      
      dex                               
      bne  W1F10                        
      lda  #$71                         
      lda  #$37                         
      sta  $01                          
      cli                               
      jmp  $A8BC                        

