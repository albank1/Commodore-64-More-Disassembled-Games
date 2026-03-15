;====================================================================
; Jupiter Lander (1982, Commodore)
;
; $10 and $11 are landing speed and $12/$13 are fuel level
; WE55 is where there is a check for a safe landing
; Source in Dasm format
; To compile:
;  a) dasm JupiterLander.asm -oJupiterLander.bin -f3
;  b) cartconv -t ulti -i JupiterLander.bin -o JupiterLander.crt
;====================================================================

     processor 6502
      .org $E000

WE000:
      .byte $1B, $00, $00, $00, $00, $08, $00, $1E 
      .byte $FF, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $02, $06, $00, $00, $00, $00, $03 
      .byte $02, $08, $00, $00, $00, $00
WE01E:
      .byte $00, $00, $00, $08, $40, $00, $D0, $FF 
      .byte $80, $00, $00, $80, $80, $78, $00, $09 
      .byte $00, $00, $80, $00, $FB, $FF, $34, $04 
      .byte $10   
WE037:                     
      ldx  #$FA                         
      txs                               
      cld                               
      sei                               
      ldx  #$1D                         
WE03E:
      lda  WE000,x                      
      sta  $D011,x                      ; VIC control register
      dex                               
      bpl  WE03E                        
      ldx  #$18                         
WE049:
      lda  WE01E,x                      
      sta  $D400,x                      ; Voice 1: Frequency control (lo byte)
      dex                               
      bpl  WE049                        
      lda  #$7F                         
      sta  $DC0D                        ; Interrupt control register CIA #1
      lda  #$08                         
      sta  $DC0F                        ; Control register B of CIA #1
      ldx  #$00                         
      stx  $DC03                        ; Data direction register port B #1
      dex                               
      stx  $DC02                        ; Data direction register port A #1
      lda  #$05                         
      sta  $01                          ; 6510 I/O register
      lda  #$2F                         
      sta  $00                          
      lda  #$1B                         
      sta  $DC04                        ; Timer A #1: Lo Byte
      lda  #$41                         
      sta  $DC05                        ; Timer A #1: Hi Byte
      lda  #$81                         
      sta  $DC0D                        ; Interrupt control register CIA #1
      lda  #$11                         
      sta  $DC0E                        ; Control register A of CIA #1
      lda  #$00                         
      sta  $1A                          
      sta  $1B                          
      sta  $2B                          
      lda  #$14                         
      sta  $2E                          
      jsr  WED7C                        
WE090:
      jmp  WE7A0                        
WE093:
      sei                               
      lda  #$00                         
      sta  $22                          
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      sta  $D412                        ; Voice 3: Control registers
      lda  #$1F                         
      sta  $D418                        ; Select volume and filter mode
      jsr  WED7C                        
      lda  #$00                         
      sta  $D021                        ; Background 0 color
      sta  $D020                        ; Border color
      lda  #$00                         
      sta  $2B                          
      lda  #$FF                         ; inital fuel level
      sta  $12                          ; 16 bit value in $12 and $13
      sta  $13                          
      lda  #$00                         
      sta  $15                          
      sta  $18                          
      sta  $19                          
      sta  $21                          
      jsr  WEE5A                        
      lda  #$01                         
      sta  $20                          
WE0CE:
      ldx  $15                          
      cpx  #$10                         
      beq  WE0D5                        
      inx                               
WE0D5:
      stx  $15                          
      lda  WE0DC+1,x                    
      sta  $14                          
WE0DC:
      bne  WE0EE                        
      .byte $04, $05, $04, $05, $06, $05, $06, $06 
      .byte $06, $07, $08, $07, $07, $08, $09, $09 
WE0EE:
      lda  #$FF                         
      sta  $1C                          
      lda  #$50                         
      ldx  #$00                         
      stx  $08                          
      sta  $09                          
      stx  $0A                          
      lda  #$6A                         
      stx  $0D                          
      sta  $0E                          
      stx  $0F                          
      lda  #$00                         
      sta  $10                          
      sta  $11                          
      sta  $0C                          
      lda  #$FF                         
      sta  $0B                          
      jsr  WEBD6                      
      lda  #$00                         
      sta  $16                          
      sta  $17                          
      lda  #$03                         
      sta  $D028                        ; Color sprite 1
      jsr  WE173                        
      ldx  #$03                         
      jsr  WEE3E                        
      lda  $D01F                        
      jsr  WE29A                        
WE12C:
      lda  $25                          
      cmp  #$32                         
      bcs  WE144                        
      lda  $24                          
      beq  WE13E                        
      lda  $23                          
      cmp  #$18                         
      bcs  WE144                        
      bcc  WE14E                        
WE13E:
      lda  $23                          
      cmp  #$18                         
      bcs  WE14E                        
WE144:
      lda  $D01F                        
      and  #$02                         
      beq  WE14E                        
      jmp  WE44B                        
WE14E:
      jsr  WE173                        
      lda  $1E                          
      beq  WE158                        
      jmp  WE55C                        
WE158:
      jsr  WE2C8                        
      jsr  WEBD6                      
      lda  $0F                          
      bne  WE16B                        
      lda  $0E                          
      cmp  #$3A                         
      bcs  WE16B                        
      jmp  WE50C                        
WE16B:
      ldx  #$03                         
      jsr  WEE3E                        
      jmp  WE12C                        
WE173:
      jsr  WE1C4                      
      cpy  $1C                          
      beq  WE188                        
      sty  $1C                          
      lda  #$00                         
      sta  $D015                        ; Sprites Abilitator
      jsr  WEC72                      
      lda  #$00                         
      sta  $21                          
WE188:
      ldx  $1C                          
      bne  WE1A1                        
      lda  $0A                          
      lsr                               
      sta  $24                          
      lda  $09                          
      ror                               
      sta  $23                          
      lda  $0F                          
      lsr                               
      lda  $0E                          
      ror                               
      sta  $25                          
      jmp  WE38D                        
WE1A1:
      lda  $09                          
      sec                               
      sbc  WE1B8+2,x                    
      sta  $23                          
      lda  $0A                          
      sbc  WE1BD,x                      
      sta  $24                          
      lda  $0E                          
      sec                               
      sbc  WE1C0,x                      
      sta  $25                          
WE1B8:
      jmp  WE3A1                        
      .byte $38, $E8                    
WE1BD:
      .byte $48, $00, $00               
WE1C0:
      .byte $01, $E2, $42, $E2              
WE1C4:
      lda  $0E                          
      cmp  #$14                         
      lda  $0F                          
      sbc  #$01                         
      bcc  WE1DB                        
      lda  $09                          
      cmp  #$40                         
      lda  $0A                          
      sbc  #$01                         
      bcs  WE1DB                        
      ldy  #$01                         
      rts                               
WE1DB:
      lda  $09                          
      cmp  #$10                         
      lda  $0A                          
      sbc  #$01                         
      bcc  WE1FC                        
      lda  $09                          
      cmp  #$D8                         
      lda  $0A                          
      sbc  #$01                         
      bcs  WE1FC                        
      lda  $0E                          
      cmp  #$74                         
      lda  $0F                          
      sbc  #$00                         
      bcc  WE1FC                        
      ldy  #$02                         
      rts                               
WE1FC:
      lda  $09                          
      cmp  #$40                         
      lda  $0A                          
      sbc  #$01                         
      bcc  WE213                        
      lda  $0E                          
      cmp  #$14                         
      lda  $0F                          
      sbc  #$01                         
      bcc  WE213                        
      ldy  #$03                         
      rts                               
WE213:
      ldy  #$00                         
      rts                               
WE216:
      .byte $07, $3F, $13, $07, $D6, $1C, $07, $00 
      .byte $00, $07, $D6, $1C, $62, $7E, $26, $07 
      .byte $C6, $2D, $07, $7E, $26, $07, $C6, $2D 
      .byte $69, $AC, $39, $0E, $00, $00, $07, $3F 
      .byte $13, $07, $D6, $1C, $07, $00, $00, $07 
      .byte $D6, $1C, $62, $7E, $26, $07, $C6, $2D 
      .byte $07, $7E, $26, $07, $C6, $2D, $69, $AC 
      .byte $39, $0E, $00, $00, $07, $FC, $4C, $2A 
      .byte $00, $00, $07, $FC, $4C, $23, $00, $00 
      .byte $07, $FC, $4C, $1C, $00, $00, $07, $FC 
      .byte $4C, $15, $00, $00, $07, $FC, $4C, $0E 
      .byte $00, $00, $07, $FC, $4C, $07, $00, $00 
      .byte $07, $FC, $4C, $07, $00, $00, $07, $FC 
      .byte $4C, $07, $00, $00, $07, $FC, $4C, $07 
      .byte $00, $00, $07, $FC, $4C, $07, $00, $00 
      .byte $07, $FC, $4C, $07, $00, $00, $07, $FC 
      .byte $4C, $07, $00, $00          
WE29A:
      lda  $20                          
      beq  WE2C7                        
      lda  #$41                         
      sta  $D404                        ; Voice 1: Control registers
      ldy  #$00                         
WE2A5:
      ldx  WE216,y                      
      iny                               
      lda  WE216,y                      
      sta  $D400                        ; Voice 1: Frequency control (lo byte)
      iny                               
      lda  WE216,y                      
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      jsr  WEE3E                        
      iny                               
      cpy  #$84                         
      bne  WE2A5                        
      lda  #$00                         
      sta  $20                          
      lda  #$40                         
      sta  $D404                        ; Voice 1: Control registers
WE2C7:
      rts                               
WE2C8:
      jsr  WEB6F                        
WE2CB:
      lda  $13                          
      bne  WE2D3                        
      sta  $17                          
      sta  $16                          
WE2D3:
      ldy  #$80                         
      lda  $17                          
      beq  WE2FE                        
      ldy  #$81                         
      cmp  #$02                         
      lda  #$06                         
      ldx  #$00                         
      bcc  WE2E7                        
      lda  #$FA                         
      ldx  #$FF                         
WE2E7:
      clc                               
      adc  $0B                          
      sta  $0B                          
      txa                               
      adc  $0C                          
      sta  $0C                          
      lda  $12                          
      sec                               
      sbc  #$1E                         ; Reduce fuel level by $1E
      sta  $12                          
      lda  $13                          
      sbc  #$00                         
      sta  $13                          
WE2FE:
      sty  $D40B                        ; Voice 2: Control registers
      lda  $0B                          ; Buffer pointer of input/number index
      clc                               
      adc  $08                          
      sta  $08                          
      lda  $0C                          
      adc  $09                          
      sta  $09                          
      php                               
      lda  $0C                          
      asl                               
      lda  #$FF                         
      bcs  WE318                        
      lda  #$00                         
WE318:
      plp                               
      adc  $0A                          
      sta  $0A                          
      lda  $16                          
      bne  WE328                        
      lda  #$80                         
      sta  $D412                        
      bne  WE363                        
WE328:
      lda  #$0C                         
      pha                               
      asl                               
      asl                               
      asl                               
      adc  #$0F                         
      sta  $27                          
      lda  $12                          
      sec                               
      sbc  $27                          ; Reduce fuel level by $27
      sta  $12                          
      lda  $13                          
      sbc  #$00                         
      sta  $13                          
      pla                               
      sta  $27                          
      lda  $10                          
      sec                               
      sbc  $27                          
      sta  $10                          
      lda  $11                          
      sbc  #$00                         
      sta  $11                          
      lda  #$E6                         
      sta  $D414                        
      lda  #$28                         
      sta  $D416                        
      lda  #$00                         
      sta  $D417                        
      lda  #$81                         
      jsr  WF254                        
WE363:
      lda  $10                          
      clc                               
      adc  $14                          
      sta  $10                          
      lda  $11                          
      adc  #$00                         
      sta  $11                          
      lda  $10                          
      clc                               
      adc  $0D                          
      sta  $0D                          
      lda  $11                          
      adc  $0E                          
      sta  $0E                          
      php                               
      lda  $11                          
      asl                               
      lda  #$FF                         
      bcs  WE387                        
      lda  #$00                         
WE387:
      plp                               
      adc  $0F                          
      sta  $0F                          
      rts                               
WE38D:
      lda  #$00                         
      sta  $1E                          
      lda  #$00                         
      sta  $D015                        ; Sprites Abilitator
      lda  #$00                         
      sta  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      sta  $D017                        ; (2X) vertical expansion (Y) sprite 0..7
      jmp  WE3F9                        
WE3A1:
      lda  #$00                         
      sta  $1E                          
      lda  #$00                         
      sta  $D015                        ; Sprites Abilitator
      lda  #$0E                         
      sta  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      sta  $D017                        ; (2X) vertical expansion (Y) sprite 0..7
      jsr  WE3F9                        
      ldx  #$02                         
WE3B7:
      lda  $0E                          
      cmp  WE3E7,x                      
      bne  WE3E3                        
      lda  $0F                          
      cmp  WE3EA,x                      
      bne  WE3E3                        
      lda  $09                          
      cmp  WE3ED,x                      
      lda  $0A                          
      sbc  WE3F0,x                      
      bcc  WE3E3                        
      lda  $09                          
      cmp  WE3F3,x                      
      lda  $0A                          
      sbc  WE3F6,x                      
      bcs  WE3E3                        
      lda  #$01                         
      sta  $1E                          
      bne  WE3E6                        
WE3E3:
      dex                               
      bpl  WE3B7                        
WE3E6:
      rts                               
WE3E7:
      .byte $6A, $9A, $7A               
WE3EA:
      .byte $01, $00, $01               
WE3ED:
      .byte $B0, $60, $E0               
WE3F0:
      .byte $00, $01, $01               
WE3F3:
      .byte $E0, $90, $00               
WE3F6:
      .byte $00, $01, $02               
WE3F9:
      lda  $2B                          
      eor  #$01                         
      sta  $2B                          
      lda  $23                          
      sta  $D002                        ; Position X sprite 1
      sta  $D004                        ; Position X sprite 2
      sta  $D006                        ; Position X sprite 3
      lda  $25                          
      sta  $D003                        ; Position Y sprite 1
      sta  $D005                        ; Position Y sprite 2
      sta  $D007                        ; Position Y sprite 3
      ldx  #$00                         
      lda  $24                          ; Utility programs pointers area
      beq  WE41C                        
      dex                               
WE41C:
      stx  $D010                        ; Position X MSB sprites 0..7
      jsr  WEE90                        
      ldx  #$01                         
      lda  $17                          
      beq  WE432                        
      inx                               
      inx                               
      inx                               
      inx                               
      clc                               
      adc  #$F9                         
      sta  $07FB                        ; Pointer to data sprites
WE432:
      lda  $16                          
      beq  WE440                        
      inx                               
      inx                               
      clc                               
      lda  #$F8                         
      adc  $2B                          
      sta  $07FA                        ; Pointer to data sprites
WE440:
      lda  #$F0                         
      sta  $07F9                        ; Pointer to data sprites
      txa                               
      asl                               
      sta  $D015                        ; Sprites Abilitator
      rts                               
WE44B:
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      sta  $D412                        ; Voice 3: Control registers
      lda  #$FB                         
      sta  $D414                        ; Generator 3: Sustain/Release
      lda  #$34                         
      sta  $D416                        ; Filter cut frequency: hi byte
      lda  #$00                         
      sta  $D417                        ; Filter resonance control/voice input control
      lda  #$02                         
      sta  $D015                        ; Sprites Abilitator
      lda  #$81                         
      jsr  WF25D                        
      lda  #$07                         
      sta  $2A
WE473:
      inc  $07F9                        
      lda  $2A                          
      cmp  #$03                         
      bne  WE481                        
      lda  #$80                         
      sta  $D412                        ; Voice 3: Control registers
WE481:
      jsr  WE4F3                        
      dec  $2A                          
      bne  WE473                        
      lda  #$00                         
      sta  $D015                        
      ldx  $22                          
      beq  WE493                        
      lda  #$00                         
WE493:
      lda  $22                          
      beq  WE498                        
      rts                               
WE498:
      lda  $11                          
      cmp  #$02                         
      bcc  WE4A6                        
      lda  #$01                         
      sta  $27                          
      lda  #$FF                         
      bne  WE4AA                        
WE4A6:
      sta  $27                          
      lda  $10                          
WE4AA:
      lsr  $27                          
      ror                               
      lsr  $27                          
      ror                               
      lsr                               
      lsr                               
      sta  $27                          
      lda  $13                          
      sec                               
      sbc  $27                          
      bcs  WE4BD                        
      lda  #$00                         
WE4BD:
      sta  $13                          
      jsr  WEBD6                      
WE4C2:
      ldx  #$C8                         
      jsr  WEE3E                        
      lda  $13                          
      beq  WE4CE                        
      jmp  WE0EE                        
WE4CE:
      ldx  #$00                         
      jsr  WEE3E                        
      lda  $1A                          
      cmp  $18                          
      lda  $1B                          
      sbc  $19                          
      bcs  WE4E8                        
      lda  $18                          
      sta  $1A                          
      lda  $19                          
      sta  $1B                          
      jsr  WEE5A                        
WE4E8:
      jsr  WE532                      
      ldx  #$00                         
      jsr  WEE3E                        
      jmp  WE090                        
WE4F3:
      lda  #$04                         
      sta  $1D                          
WE4F7:
      lda  $D028                        ; Color sprite 1
      clc                               
      adc  #$02                         
      and  #$0F                         
      sta  $D028                        ; Color sprite 1
      ldx  #$03                         
      jsr  WEE3E                        
      dec  $1D                          
      bne  WE4F7                        
      rts                               
WE50C:
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      sta  $D412                        ; Voice 3: Control registers
      jsr  WE6FC                      
      ldx  #$09                         
WE51C:
      lda  WE528,x                      
      sta  $045E,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE51C                        
      jmp  WE4C2                        
WE528:
      .byte $4F, $55, $54, $00, $4F, $46, $00, $53 
      .byte $4B, $59                         
WE532:
      ldx  #$10                         
WE534:
      lda  #$01                         
      sta  $D8AB,x                      ; Color RAM
      sta  $D8D3,x                      ; Color RAM
      lda  #$00                         
      sta  $04AB,x                      ; Video matrix (25*40)
      sta  $04D3,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE534                        
      ldx  #$08                         
WE549:
      lda  WE553,x                      
      sta  $04AF,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE549                        
      rts                               
WE553:
      .byte $47, $41, $4D, $45, $00, $4F, $56, $45 
      .byte $52                         
WE55C:					; checks for safe landing
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      sta  $D412                        ; Voice 3: Control registers
      sta  $17                          ; Last transient strings address
      sta  $16                          ; Pointer: transient strings stack
      jsr  WE173                        
      lda  $11                          
      bmi  WE57D                        
      bne  WE57A                        
      lda  $10                          
      cmp  #$48                         ; Safe landing velocity cmp #$48 
      bcc  WE57D                        
WE57A:
      jmp  WE624                        
WE57D:
      lda  #$00                         
      sta  $17                          
      lda  #$50                         
      sec                               
      sbc  $10                          
      ldx  $1C                          
      cpx  #$01                         
      beq  WE58D                        
      asl                               
WE58D:
      cpx  #$02                         
      beq  WE59F                        
      sta  $1D                          
      asl                               
      rol  $17                          
      asl                               
      rol  $17                          
      adc  $1D                          
      bcc  WE59F                        
      inc  $17                          
WE59F:
      sta  $1D                          
      jsr  WE717                        
      ldy  #$00                         
      lda  #$41                         
      sta  $D404                        ; Voice 1: Control registers
WE5AB:
      lda  WE6BE,y                      
      sta  $D400                        ; Voice 1: Frequency control (lo byte)
      iny                               
      lda  WE6BE,y                      
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      ldx  #$0E                         
      jsr  WEE3E                        
      iny                               
      cpy  #$3E                         
      bne  WE5AB                        
      lda  #$40                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $2C                          ; Pointer: BASIC starting programs
      ldx  #$0E                         
      jsr  WEE3E                        
WE5CE:
      sed                               
      lda  $18                          
      clc                               
      adc  #$01                         
      sta  $18                          
      lda  $19                          
      adc  #$00                         
      sta  $19                          
      cld                               
      jsr  WEE5A                        
      lda  $12                          
      clc                               
      adc  #$46                         
      tax                               
      lda  $13                          
      adc  #$00                         
      bcs  WE5F8                        
      stx  $12                          
      sta  $13                          
      jsr  WEBD6                      
      lda  #$F0                         
      sta  $07F9                        
WE5F8:
      lda  $2C                          
      eor  #$01                         
      sta  $2C                          
      sta  $D404                        
      ldx  #$02                         
      jsr  WEE3E                        
      lda  $1D                          
      sec                               
      sbc  #$01                         
      sta  $1D                          
      lda  $17                          
      sbc  #$00                         
      sta  $17                          
      ora  $1D                          
      bne  WE5CE                        
      lda  #$40                         
      sta  $D404                        ; Voice 1: Control registers
      ldx  #$96                         
      jsr  WEE3E                        
      jmp  WE0CE                        
WE624:
      ldy  #$00                         
      lda  #$41                         
      sta  $D404                        ; Voice 1: Control registers
WE62B:
      lda  WE658,y                      
      sta  $D400                        ; Voice 1: Frequency control (lo byte)
      iny                               
      lda  WE658,y                      
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      ldx  #$08                         
      jsr  WEE3E                        
      iny                               
      cpy  #$58                         
      bne  WE62B                        
      lda  #$40                         
      sta  $D404                        ; Voice 1: Control registers
      jsr  WE6FC                      
      ldx  #$0D                         
WE64C:
      lda  WE6B0,x                      
      sta  $045C,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE64C                        
      jmp  WE44B                        
WE658:
      .byte $AC, $39, $00, $00, $FC, $4C, $AC, $39 
      .byte $7F, $30, $00, $00, $AC, $39, $7F, $30 
      .byte $7E, $26, $00, $00, $7F, $30, $7E, $26 
      .byte $D6, $1C, $D6, $1C, $00, $00, $72, $1C 
      .byte $38, $1B, $D6, $1C, $8D, $1E, $5E, $20 
      .byte $8D, $1E, $5E, $20, $4B, $22, $55, $24 
      .byte $7E, $26, $00, $00, $00, $00, $D6, $1C 
      .byte $38, $1B, $D6, $1C, $8D, $1E, $8D, $1E 
      .byte $8D, $1E, $D6, $1C, $D6, $1C, $00, $00 
      .byte $00, $00, $00, $00, $55, $24, $00, $00 
      .byte $00, $00, $00, $00, $7E, $26, $00, $00 
WE6B0:
      .byte $53, $4F, $52, $52, $59, $00, $4E, $4F 
      .byte $00, $42, $4F, $4E, $55, $53
WE6BE:
      .byte $7E, $26, $00, $00, $7E, $26, $7F, $30 
      .byte $AC, $39, $7F, $30, $AC, $39, $7F, $30 
      .byte $34, $2B, $00, $00, $34, $2B, $61, $33 
      .byte $BC, $40, $BC, $40, $BC, $40, $A9, $48 
      .byte $AC, $39, $7F, $30, $A9, $48, $AC, $39 
      .byte $7F, $30, $A9, $48, $AC, $39, $FC, $4C 
      .byte $00, $00, $A9, $48, $FC, $4C, $FC, $4C 
      .byte $FC, $4C, $FC, $4C, $FC, $4C     
WE6FC:
      ldx  #$0E                         
      lda  #$01                         
WE700:
      sta  $D85C,x                      ; Color RAM
      dex                               
      bpl  WE700                        
      ldx  #$10                         
      lda  #$00                         
WE70A:
      sta  $0433,x                      ; Video matrix (25*40)
      sta  $045B,x                      ; Video matrix (25*40)
      sta  $0483,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE70A                        
      rts                               
WE717:
      jsr  WE6FC                      
      lda  #$50                         
      sec                               
      sbc  $10                          
      ldx  #$FF                         
WE721:
      inx                               
      sec                               
      sbc  #$0A                         
      bcs  WE721                        
      adc  #$0A                         
      ora  #$30                         
      sta  $045D                        ; Video matrix (25*40)
      txa                               
      beq  WE736                        
      ora  #$30                         
      sta  $045C                        ; Video matrix (25*40)
WE736:
      lda  #$30                         
      sta  $045E                        ; Video matrix (25*40)
      lda  #$58                         
      sta  $0460                        ; Video matrix (25*40)
      ldx  $1C                          
      dex                               
      bne  WE74C                        
      lda  #$35                         
      sta  $0463                        ; Video matrix (25*40)
      bne  WE760                        
WE74C:
      dex                               
      bne  WE756                        
      lda  #$32                         
      sta  $0463                        ; Video matrix (25*40)
      bne  WE760                        
WE756:
      lda  #$31                         
      sta  $0462                        ; Video matrix (25*40)
      lda  #$30                         
      sta  $0463                        ; Video matrix (25*40)
WE760:
      lda  #$3D                         
      sta  $0464                        ; Video matrix (25*40)
      lda  $1D                          
      ldx  $17                          
      ldy  #$FF                         
WE76B:
      iny                               
      sec                               
      sbc  #$64                         
      pha                               
      txa                               
      sbc  #$00                         
      tax                               
      pla                               
      bcs  WE76B                        
      adc  #$64                         
      pha                               
      tya                               
      beq  WE782                        
      ora  #$30                         
      sta  $0466                        ; Video matrix (25*40)
WE782:
      pla                               
      ldy  #$FF                         
WE785:
      iny                               
      sec                               
      sbc  #$0A                         
      bcs  WE785                        
      adc  #$0A                         
      pha                               
      tya                               
      ora  #$30                         
      sta  $0467                        ; Video matrix (25*40)
      pla                               
      ora  #$30                         
      sta  $0468                        ; Video matrix (25*40)
      lda  #$30                         
      sta  $0469                        ; Video matrix (25*40)
      rts                               
WE7A0:
      lda  #$00                         
      sta  $D418                        ; Select volume and filter mode
      lda  #$01                         
      sta  $22                          
      cli                               
WE7AA:
      jsr  WF266                        
      nop                               
      nop                               
      sta  $D020                        ; Border color
      lda  #$00                         
      sta  $02                          
      lda  #$04                         
      sta  $03                          
      ldx  #$17                         
WE7BC:
      ldy  #$25                         
WE7BE:
      lda  #$00                         
      sta  ($02),y                      
      dey                               
      bpl  WE7BE                        
      lda  $02                          
      clc                               
      adc  #$28                         
      sta  $02                          
      bcc  WE7D0                        
      inc  $03                          
WE7D0:
      dex                               
      bne  WE7BC                        
      lda  #$00                         
      sta  $02                          
      lda  #$D8                         
      sta  $03                          
      ldx  #$17                         
WE7DD:
      ldy  #$25                         
WE7DF:
      lda  #$01                         
      sta  ($02),y                      
      dey                               
      bpl  WE7DF                        
      lda  $02                          
      clc                               
      adc  #$28                         
      sta  $02                          
      bcc  WE7F1                        
      inc  $03                          
WE7F1:
      dex                               
      bne  WE7DD                        
      ldx  #$0D                         
WE7F6:
      lda  WE874,x                      
      sta  $0434,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE7F6                        
      ldx  #$11                         
WE801:
      lda  WE882,x                      
      sta  $0482,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE801                        
      ldx  #$11                         
WE80C:
      lda  WE894,x                      
      sta  $07CA,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE80C                        
      ldx  #$06                         
WE817:
      lda  WE8A6,x                      
      sta  $052F,x                      ; Video matrix (25*40)
      lda  WE8AD,x                      
      sta  $05C2,x                      ; Video matrix (25*40)
      lda  WE8B4,x                      
      sta  $05CB,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE817                        
      ldx  #$25                         
WE82E:
      lda  WE8BB,x                      
      sta  $0608,x                      ; Video matrix (25*40)
      lda  WE8E1,x                      
      sta  $0630,x                      ; Video matrix (25*40)
      lda  WE907,x                      
      sta  $0658,x                      ; Video matrix (25*40)
      lda  WE92D,x                      
      sta  $0680,x                      ; Video matrix (25*40)
      lda  WE953,x                      
      sta  $06A8,x                      ; Video matrix (25*40)
      lda  WE979,x                      
      sta  $06D0,x                      ; Video matrix (25*40)
      lda  WE99F,x                      
      sta  $06F8,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE82E                        
      ldx  #$1A                         
WE85D:
      lda  WE9C5,x                      
      sta  $0749,x                      ; Video matrix (25*40)
      dex                               
      bpl  WE85D                        
      ldx  #$11                         
WE868:
      lda  WE9E0,x                      
      sta  $0782,x                      
      dex                               
      bpl  WE868                        
      jmp  WE9F2                      
WE874:
      lsr                               
      eor  $50,x                        
      eor  #$54                         
      eor  $52                          
      brk                               
      jmp  $4E41                        
      .byte $44, $45, $52               
WE882:
      .byte $5B, $5B, $00, $49, $4E, $53, $54, $52 
      .byte $55, $43, $54, $49, $4F, $4E, $53, $00 
      .byte $5D, $5D                    
WE894:
      .byte $50, $55, $53, $48, $00, $5B, $46, $31 
      .byte $5D, $00, $54, $4F, $00, $53, $54, $41 
      .byte $52, $54                    
WE8A6:
      .byte $46, $31, $5F, $46, $49, $52, $45 
WE8AD:
      .byte $00, $4C, $45, $46, $54, $5F, $41 
WE8B4:
      .byte $44, $5F, $52, $49, $47, $48, $54 
WE8BB:
      .byte $55, $53, $45, $00, $54, $48, $45, $00 
      .byte $4B, $45, $59, $42, $4F, $41, $52, $44 
      .byte $00, $4F, $52, $00, $4A, $4F, $59, $53 
      .byte $54, $49, $43, $4B, $00, $46, $4F, $52 
      .byte $00, $43, $4F, $4E, $54, $5F
WE8E1:
      .byte $52, $4F, $4C, $4C, $49, $4E, $47, $00 
      .byte $54, $48, $52, $55, $53, $54, $5E, $00 
      .byte $4C, $41, $4E, $44, $00, $00, $4F, $4E 
      .byte $00, $4F, $4E, $45, $00, $4F, $46, $00 
      .byte $00, $54, $48, $52, $45, $45
WE907:
      .byte $50, $4F, $53, $49, $54, $49, $4F, $4E 
      .byte $53, $5E, $00, $56, $45, $52, $54, $49 
      .byte $43, $41, $4C, $00, $56, $45, $4C, $4F 
      .byte $43, $49, $54, $59, $00, $4D, $55, $53 
      .byte $54, $00, $43, $4F, $4D, $45
WE92D:
      .byte $57, $49, $54, $48, $49, $4E, $00, $00 
      .byte $54, $48, $45, $00, $59, $45, $4C, $4C 
      .byte $4F, $57, $00, $41, $52, $45, $41, $00 
      .byte $4F, $46, $00, $54, $48, $45, $00, $00 
      .byte $53, $43, $41, $4C, $45, $5E
WE953:
      .byte $54, $48, $45, $00, $53, $43, $4F, $52 
      .byte $45, $5C, $00, $41, $43, $43, $4F, $52 
      .byte $44, $49, $4E, $47, $00, $54, $4F, $00 
      .byte $54, $48, $45, $00, $56, $45, $4C, $4F 
      .byte $43, $49, $54, $59, $5C, $00
WE979:
      .byte $49, $53, $00, $4D, $55, $4C, $54, $49 
      .byte $50, $4C, $49, $45, $44, $00, $42, $59 
      .byte $00, $54, $48, $45, $00, $4E, $55, $4D 
      .byte $42, $45, $52, $00, $42, $45, $4C, $4F 
      .byte $57, $5E, $00, $59, $4F, $55
WE99F:
      .byte $41, $52, $45, $00, $52, $45, $46, $55 
      .byte $45, $4C, $45, $44, $00, $4F, $4E, $00 
      .byte $41, $00, $53, $55, $43, $43, $45, $53 
      .byte $53, $46, $55, $4C, $00, $4C, $41, $4E 
      .byte $44, $49, $4E, $47, $5E, $00
WE9C5:
      .byte $43, $4F, $50, $59, $52, $49, $47, $48 
      .byte $54, $00, $31, $39, $38, $32, $00, $42 
      .byte $59, $00, $43, $4F, $4D, $4D, $4F, $44 
      .byte $4F, $52, $45               
WE9E0:
      .byte $41, $4E, $44, $00, $48, $41, $4C, $00 
      .byte $4C, $41, $42, $4F, $52, $41, $54, $4F 
      .byte $52, $59                         
WE9F2:
      lda  #$00                         
      sta  $13                          
      sta  $11                          
      lda  #$14                         
      sta  $10                          
      jsr  WEBD6                      
      lda  #$01                         
      sta  $21                          
      lda  #$90                         
      sta  $23                          
      lda  #$00                         
      sta  $24                          
      lda  #$5A                         
      sta  $25                          
      lda  #$03                         
      sta  $D028                        
      lda  #$00                         
      sta  $17                          
      sta  $16                          
      jsr  WE3A1                        
      ldx  #$78                         
      jsr  WEE3E                        
      lda  #$03                         
      sta  $2D                          
WEA26:
      ldx  #$06                         
      lda  #$00                         
WEA2A:
      sta  $D9C2,x                      ; Color RAM
      dex                               
      bpl  WEA2A                        
      lda  #$01                         
      sta  $17                          
      jsr  WE3A1                        
      ldx  #$46                         
      jsr  WEE3E                        
      ldx  #$06                         
      lda  #$01                         
WEA40:
      sta  $D9C2,x                      ; Color RAM
      dex                               
      bpl  WEA40                        
      lda  #$00                         
      sta  $17                          
      jsr  WE3A1                        
      ldx  #$46                         
      jsr  WEE3E                        
      ldx  #$06                         
      lda  #$00                         
WEA56:
      sta  $D9CB,x                      
      dex                               
      bpl  WEA56                        
      lda  #$02                         
      sta  $17                          
      jsr  WE3A1                        
      ldx  #$46                         
      jsr  WEE3E                        
      ldx  #$06                         
      lda  #$01                         
WEA6C:
      sta  $D9CB,x                      
      dex                               
      bpl  WEA6C                        
      lda  #$00                         
      sta  $17                          
      jsr  WE3A1                        
      ldx  #$46                         
      jsr  WEE3E                        
      ldx  #$06                         
      lda  #$00                         
WEA82:
      sta  $D92F,x                      
      dex                               
      bpl  WEA82                        
      lda  #$01                         
      sta  $16                          
      lda  #$0F                         
      sta  $1D                          
WEA90:
      jsr  WE3A1                        
      ldx  #$06                         
      jsr  WEE3E                        
      dec  $1D                          
      bne  WEA90                        
      ldx  #$06                         
      lda  #$01                         
WEAA0:
      sta  $D92F,x                      
      dex                               
      bpl  WEAA0                        
      lda  #$00                         
      sta  $16                          
      jsr  WE3A1                        
      ldx  #$46                         
      jsr  WEE3E                        
      dec  $2D                          
      beq  WEAB9                        
      jmp  WEA26                        
WEAB9:
      ldx  #$02                         
      jsr  WEE3E                        
      lda  #$FF                         
      sta  $1C                          
      lda  #$00                         
      sta  $D021                        ; Background 0 color
      sta  $D020                        ; Border color
      lda  #$04                         
      sta  $14                          
      lda  #$00                         
      sta  $08                          
      sta  $0D                          
      sta  $0A                          
      sta  $0F                          
      lda  #$50                         
      sta  $09                          
      lda  #$6A                         
      sta  $0E                          
      lda  #$00                         
      sta  $10                          
      sta  $11                          
      inc  $15                          
      lda  $15                          
      and  #$03                         
      tax                               
      lda  WEB31,x                      
      sta  $0B                          
      lda  WEB35,x                      
      sta  $0C                          
      lda  #$01                         
      sta  $13                          
      lda  #$03                         
      sta  $D028                        ; Color sprite 1
      lda  #$00                         
      sta  $16                          
      sta  $17                          
      jsr  WE173                        
      ldx  #$03                         
      jsr  WEE3E                        
      lda  $D01F                        ; Animation/background contact
WEB11:
      jsr  WE2CB                        
      jsr  WE173                        
      jsr  WEC01                        
      ldx  #$03                         
      jsr  WEE3E                        
      lda  $D01F                        ; Animation/background contact
      and  #$02                         
      beq  WEB11                        
      jsr  WE44B                        
      ldx  #$00                         
      jsr  WEE3E                        
      jmp  WE7AA                        
WEB31:
      .byte $E6, $FF, $C8, $82          
WEB35:
      .byte $00, $00, $00, $02, $48, $8A, $48, $98 
      .byte $48, $C6, $2E, $D0, $12, $A9, $14, $85 
      .byte $2E, $EE, $CA, $DB, $AD, $CA, $DB, $A2 
      .byte $11                         
WEB4E:
      sta  $DBCA,x                      ; Color RAM
      dex                               
      bpl  WEB4E                        
      lda  #$FE                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      and  #$10                         
      bne  WEB66                        
      ldx  #$FA                         
      txs                               
      jmp  WE093                        
WEB66:
      lda  $DC0D                        ; Interrupt control register CIA #1
      pla                               
      tay                               
      pla                               
      tax                               
      pla                               
      rti                               
WEB6F:
      lda  #$FF                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  #$00                         
      sta  $17                          
      sta  $16                          
WEB7A:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cmp  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      bne  WEB7A                        
      lsr                               
      lsr                               
      and  #$07                         
      cmp  #$07                         
      beq  WEB9C                        
      lsr                               
      bcs  WEB8F                        
      inc  $17                          ; Last transient strings address
WEB8F:
      lsr                               
      bcs  WEB96                        
      inc  $17                          
      inc  $17                          
WEB96:
      lsr                               
      bcs  WEB9B                        
      inc  $16                          
WEB9B:
      rts                               
WEB9C:
      ldy  #$00                         
      lda  #$FE                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
WEBA3:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cmp  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      bne  WEBA3                        
      and  #$10                         
      bne  WEBB1                        
      ldy  #$01                         
WEBB1:
      sty  $16                          
      ldy  #$00                         
      ldx  #$01                         
WEBB7:
      lda  WEBD2,x                      
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
WEBBD:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cmp  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      bne  WEBBD                        
      and  #$04                         
      bne  WEBCC                        
      ldy  WEBD4,x                      
WEBCC:
      dex                               
      bpl  WEBB7                        
      sty  $17                          
      rts                               
WEBD2:
      .byte $FB, $FD                    
WEBD4:
      .byte $02
      .byte $01
WEBD6:
      lda  $13                          
      pha                               
      lsr                               
      lsr                               
      lsr                               
      tay                               
      tax                               
      beq  WEBE8                        
      lda  #$01                         
WEBE2:
      sta  $07C7,x                      ; Video matrix (25*40)
      dex                               
      bne  WEBE2                        
WEBE8:
      pla                               
      and  #$07                         
      clc                               
      adc  #$10                         
      sta  $07C8,y                      ; Video matrix (25*40)
      lda  #$00                         
WEBF3:
      cpy  #$1F                         
      beq  WEC01                        
      sta  $07C9,y                      ; Video matrix (25*40)
      ldx  $13                          
      beq  WEC01                        
      iny                               
      bne  WEBF3                        
WEC01:
      lda  $11                          
      cmp  #$02                         
      bcc  WEC0B                        
      cmp  #$FE                         
      bcc  WEC51                        
WEC0B:
      sta  $27                          
      lda  $10                          
      lsr  $27                          
      ror                               
      lsr  $27                          
      ror                               
      pha                               
      lda  #$00                         
      sta  $02                          
      lda  #$04                         
      sta  $03                          
      ldx  #$10                         
      ldy  #$C7                         
WEC22:
      lda  #$01                         
      sta  ($02),y                      
      tya                               
      clc                               
      adc  #$28                         
      tay                               
      bcc  WEC2F                        
      inc  $03                          
WEC2F:
      dex                               
      bne  WEC22                        
      pla                               
      clc                               
      adc  #$80                         
      lsr                               
      pha                               
      lsr                               
      lsr                               
      and  #$FE                         
      tax                               
      lda  WEC52,x                      
      sta  $02                          
      lda  WEC53,x                      
      sta  $03                          
      pla                               
      and  #$07                         
      clc                               
      adc  #$18                         
      ldy  #$27                         
      sta  ($02),y                      
WEC51:
      rts                               
WEC52:
      .byte $A0
WEC53:
      .byte $04, $C8, $04, $F0, $04, $18, $05, $40 
      .byte $05, $68, $05, $90, $05, $B8, $05, $E0 
      .byte $05, $08, $06, $30, $06, $58, $06, $80 
      .byte $06, $A8, $06, $D0, $06, $F8, $06
WEC72:
      ldx  $1C                          
      lda  WECD4,x                      
      sta  $02                          
      lda  WECD8,x                      
      sta  $03                          
      lda  #$00                         
      sta  $04                          
      lda  #$04                         
      sta  $05                          
      lda  #$00                         
      sta  $06                          
      lda  #$D8                         
      sta  $07                          
      ldy  #$00                         
      sty  $28                          
WEC92:
      ldy  #$00                         
      sty  $29                          
WEC96:
      ldy  $28                          
      lda  ($02),y                      
      bne  WEC9D                        
      rts                               
WEC9D:
      tax                               
      iny                               
      lda  ($02),y                      
      iny                               
      sty  $28                          
      bne  WECA8                        
      inc  $03                          
WECA8:
      ldy  $29                          
WECAA:
      sta  ($04),y                      
      pha                               
      cmp  #$01                         
      lda  #$02                         
      bcs  WECB5                        
      lda  #$03                         
WECB5:
      sta  ($06),y                      
      pla                               
      cpy  #$25                         
      beq  WECC4                        
      iny                               
      dex                               
      bne  WECAA                        
      sty  $29                          
      beq  WEC96                        
WECC4:
      lda  $04                          
      adc  #$27                         
      sta  $04                          
      sta  $06                          
      bcc  WEC92                        
      inc  $05                          
      inc  $07                          
      bcs  WEC92                        
WECD4:
      .byte $B8, $0D, $D2, $7B          
WECD8:
      .byte $EE, $F0, $F0, $F1          
WECDC:
      .byte $05, $05, $05, $05, $05, $05, $05, $05 
      .byte $01, $01, $01, $01, $01, $01, $01, $01 
      .byte $01, $04, $04, $04, $04, $04, $04, $04 
      .byte $04, $04, $04, $01, $01, $01, $01, $01 
      .byte $01, $01, $01, $01, $01, $01, $01, $01 
      .byte $07, $07, $07, $07, $07, $07, $07, $06 
      .byte $06, $06, $06, $06, $06, $06, $06, $06 
      .byte $06, $06, $06, $06, $06, $06, $06, $06 
      .byte $06, $06, $06, $06, $06, $06, $06, $06 
      .byte $06, $06, $06, $06, $06, $06, $06, $06 
WED2C:
      .byte $00, $53, $43, $4F, $52, $45, $00, $3A 
      .byte $00, $00, $00, $00, $00, $30, $00, $00 
      .byte $00, $00, $48, $49, $5F, $53, $43, $4F 
      .byte $52, $45, $00, $3A, $00, $00, $00, $00 
      .byte $00, $30, $00, $00, $00, $00, $00, $00 
      .byte $00, $46, $55, $45, $4C, $00, $3A, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
WED7C:
      .byte $A9, $00                    
      sta  $02                          
      lda  #$D8                         
      sta  $03                          
      ldy  #$4E                         
      lda  #$01                         
      sta  ($02),y                      
      iny                               
      sta  ($02),y                      
      ldx  #$13                         
WED8F:
      tya                               
      clc                               
      adc  #$28                         
      tay                               
      bcc  WED98                        
      inc  $03                          
WED98:
      lda  #$05                         
      sta  ($02),y                      
      dey                               
      lda  #$00                         
      sta  ($02),y                      
      iny                               
      dex                               
      bne  WED8F                        
      lda  #$07                         
      sta  $DA07                        ; Color RAM
      ldx  #$4F                         
WEDAC:
      lda  WECDC,x                      
      sta  $DB98,x                      ; Color RAM
      dex                               
      bpl  WEDAC                        
      ldx  #$4F                         
WEDB7:
      lda  WED2C,x                      
      sta  $0798,x                      ; Video matrix (25*40)
      dex                               
      bpl  WEDB7                        
      lda  #$08                         
      sta  $044E                        ; Video matrix (25*40)
      lda  #$09                         
      sta  $044F                        ; Video matrix (25*40)
      lda  #$0A                         
      sta  $049F                        ; Video matrix (25*40)
      lda  #$0B                         
      sta  $0747                        ; Video matrix (25*40)
      lda  #$3E                         
      sta  $04C6                        ; Video matrix (25*40)
      lda  #$3B                         
      sta  $05DE                        ; Video matrix (25*40)
      lda  #$3C                         
      sta  $0606                        ; Video matrix (25*40)
      lda  #$3F                         
      sta  $071E                        ; Video matrix (25*40)
      lda  #$01                         
      sta  $D8C6                        ; Color RAM
      sta  $D9DE                        ; Color RAM
      sta  $DA06                        ; Color RAM
      sta  $DB1E                        ; Color RAM
      lda  #$00                         
      sta  $0426                        ; Video matrix (25*40)
      sta  $0427                        ; Video matrix (25*40)
      sta  $0476                        ; Video matrix (25*40)
      sta  $0477                        ; Video matrix (25*40)
      sta  $049E                        ; Video matrix (25*40)
      sta  $04C6                        ; Video matrix (25*40)
      sta  $04EE                        ; Video matrix (25*40)
      sta  $0516                        ; Video matrix (25*40)
      sta  $053E                        ; Video matrix (25*40)
      sta  $0566                        ; Video matrix (25*40)
      sta  $058E                        ; Video matrix (25*40)
      sta  $05B6                        ; Video matrix (25*40)
      sta  $062E                        ; Video matrix (25*40)
      sta  $0656                        ; Video matrix (25*40)
      sta  $067E                        ; Video matrix (25*40)
      sta  $06A6                        ; Video matrix (25*40)
      sta  $06CE                        ; Video matrix (25*40)
      sta  $06F6                        ; Video matrix (25*40)
      sta  $0746                        ; Video matrix (25*40)
      sta  $076F                        ; Video matrix (25*40)
      sta  $076E                        ; Video matrix (25*40)
      sta  $0797                        ; Video matrix (25*40)
      sta  $0796                        ; Video matrix (25*40)
      rts                               
WEE3E:
      jsr  WEE45                        
      dex                               
      bne  WEE3E                        
      rts                               
WEE45:
      pha                               
      txa                               
      pha                               
      tya                               
      pha                               
      ldx  #$0A                         
WEE4C:
      ldy  #$C8                         
WEE4E:
      dey                               
      bne  WEE4E                        
      dex                               
      bne  WEE4C                        
      pla                               
      tay                               
      pla                               
      tax                               
      pla                               
      rts                               
WEE5A:
      lda  $18                          
      ldx  $19                          
      ldy  #$00                         
      sty  $26                          
      jsr  WEE6F                        
      lda  $1A                          
      ldx  $1B                          
      ldy  #$00                         
      sty  $26                          
      ldy  #$14                         
WEE6F:
      pha                               
      txa                               
      jsr  WEE75                        
      pla                               
WEE75:
      pha                               
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      jsr  WEE7E                        
      pla                               
WEE7E:
      and  #$0F                         
      bne  WEE86                        
      bit  $26                          
      bpl  WEE8E                        ; Routine: Set serial bus clock pulse output
WEE86:
      sec                               
      ror  $26                          ; Real product
      ora  #$30                         
      sta  $07A1,y                      ; Video matrix (25*40)
WEE8E:
      iny                               
      rts                               
WEE90:
      lda  $13                          
      bne  WEEAC                        
      lda  $21                          
      bne  WEEAC                        
      lda  #$01                         
      sta  $21                          
      ldx  #$0A                         
WEE9E:
      lda  WEEAD,x                      
      sta  $07CE,x                      ; Video matrix (25*40)
      lda  #$0A                         
      sta  $DBCE,x                      ; Color RAM
      dex                               
      bpl  WEE9E                        
WEEAC:
      rts                               
WEEAD:
      .byte $4F, $55, $54, $00, $4F, $46, $00, $46 
      .byte $55, $45, $4C, $01, $21, $24, $00, $01 
      .byte $25, $01, $22, $24, $00, $01, $26, $01 
      .byte $23, $23, $00, $01, $25, $01, $01, $01 
      .byte $01, $01, $21, $22, $00, $01, $26, $01 
      .byte $01, $01, $01, $01, $22, $21, $00, $01 
      .byte $24, $02, $01, $02, $01, $01, $20, $1F 
      .byte $00, $01, $24, $03, $01, $03, $01, $01 
      .byte $20, $0E, $00, $01, $24, $06, $07, $01 
      .byte $20, $07, $00, $01, $25, $04, $01, $04 
      .byte $01, $01, $20, $0C, $00, $01, $24, $03 
      .byte $01, $01, $02, $01, $03, $03, $01, $01 
      .byte $20, $06, $00, $01, $2B, $04, $01, $05 
      .byte $01, $01, $20, $0A, $00, $01, $24, $0A 
      .byte $01, $01, $20, $05, $00, $01, $2B, $04 
      .byte $01, $06, $01, $01, $20, $08, $00, $01 
      .byte $24, $0C, $01, $01, $20, $04, $00, $01 
      .byte $2D, $04, $01, $07, $01, $01, $20, $06 
      .byte $00, $01, $24, $0E, $01, $01, $21, $04 
      .byte $00, $01, $2F, $03, $01, $08, $01, $01 
      .byte $21, $04, $00, $01, $25, $0F, $01, $01 
      .byte $22, $04, $00, $01, $2F, $03, $01, $08 
      .byte $01, $01, $22, $04, $00, $01, $2B, $0F 
      .byte $01, $01, $23, $04, $00, $01, $2F, $03 
      .byte $01, $08, $01, $01, $23, $04, $00, $01 
      .byte $2D, $0F, $01, $01, $2A, $03, $00, $01 
      .byte $25, $04, $01, $08, $01, $01, $2A, $05 
      .byte $00, $01, $2C, $0E, $01, $01, $29, $03 
      .byte $00, $01, $2B, $04, $01, $08, $01, $01 
      .byte $29, $06, $00, $01, $2F, $0C, $01, $01 
      .byte $28, $04, $00, $01, $2B, $04, $01, $07 
      .byte $01, $01, $23, $07, $00, $01, $2F, $04 
      .byte $01, $01, $0C, $01, $0D, $05, $01, $01 
      .byte $28, $05, $00, $01, $26, $04, $01, $07 
      .byte $01, $01, $23, $06, $00, $01, $25, $05 
      .byte $01, $01, $0E, $01, $0F, $04, $01, $01 
      .byte $23, $05, $00, $01, $25, $05, $01, $07 
      .byte $01, $01, $23, $06, $00, $01, $26, $0B 
      .byte $01, $01, $23, $05, $00, $01, $2B, $05 
      .byte $01, $08, $01, $06, $07, $0C, $01, $01 
      .byte $23, $05, $00, $01, $26, $05, $01, $0A 
      .byte $01, $01, $02, $01, $04, $0F, $01, $05 
      .byte $07, $06, $01, $1C, $01, $01, $02, $01 
      .byte $05, $01, $06, $07, $01, $26, $01, $00 
      .byte $0C, $01, $01, $21, $0A, $00, $01, $25 
      .byte $0E, $01, $0C, $01, $01, $22, $0A, $00 
      .byte $01, $26, $0E, $01, $0D, $01, $01, $21 
      .byte $09, $00, $01, $2F, $0E, $01, $0D, $01 
      .byte $01, $22, $09, $00, $01, $2F, $0E, $01 
      .byte $0D, $01, $01, $23, $09, $00, $01, $2E 
      .byte $0E, $01, $0D, $01, $01, $23, $09, $00 
      .byte $01, $2D, $0E, $01, $0D, $01, $01, $2A 
      .byte $0A, $00, $01, $2C, $0D, $01, $0D, $01 
      .byte $01, $29, $0B, $00, $01, $2C, $0C, $01 
      .byte $0C, $01, $01, $2A, $0D, $00, $01, $2F 
      .byte $0B, $01, $0C, $01, $01, $29, $0D, $00 
      .byte $01, $2F, $0B, $01, $0B, $01, $01, $23 
      .byte $0E, $00, $01, $2F, $0B, $01, $0B, $01 
      .byte $01, $23, $0E, $00, $01, $2F, $0B, $01 
      .byte $0B, $01, $01, $23, $0D, $00, $01, $25 
      .byte $0C, $01, $0B, $01, $01, $23, $0D, $00 
      .byte $01, $26, $0C, $01, $0B, $01, $01, $23 
      .byte $0C, $00, $01, $25, $0D, $01, $0B, $01 
      .byte $01, $23, $0C, $00, $01, $26, $0D, $01 
      .byte $0C, $01, $0C, $07, $0E, $01, $26, $01 
      .byte $11, $01, $01, $02, $01, $04, $13, $01 
      .byte $1D, $01, $01, $0C, $01, $0D, $07, $01 
      .byte $1D, $01, $01, $0E, $01, $0F, $07, $01 
      .byte $26, $01, $26, $01, $00, $26, $00, $26 
      .byte $00, $26, $00, $26, $00, $26, $00, $26 
      .byte $00, $26, $00, $26, $00, $26, $00, $26 
      .byte $00, $0B, $00, $01, $24, $0C, $07, $01 
      .byte $20, $0D, $00, $0A, $00, $01, $24, $0E 
      .byte $01, $01, $20, $0C, $00, $09, $00, $01 
      .byte $24, $07, $01, $01, $02, $01, $03, $07 
      .byte $01, $01, $20, $0B, $00, $08, $00, $01 
      .byte $24, $12, $01, $01, $20, $0A, $00, $07 
      .byte $00, $01, $24, $14, $01, $01, $20, $09 
      .byte $00, $06, $00, $01, $24, $16, $01, $01 
      .byte $20, $08, $00, $05, $00, $01, $24, $18 
      .byte $01, $01, $20, $07, $00, $04, $00, $01 
      .byte $24, $1A, $01, $01, $20, $06, $00, $03 
      .byte $00, $01, $24, $1C, $01, $01, $21, $05 
      .byte $00, $02, $00, $01, $24, $0A, $01, $01 
      .byte $0C, $01, $0D, $11, $01, $01, $22, $05 
      .byte $00, $01, $00, $01, $25, $0B, $01, $01 
      .byte $0E, $01, $0F, $12, $01, $01, $21, $04 
      .byte $00, $01, $00, $01, $26, $1F, $01, $01 
      .byte $22, $04, $00, $01, $00, $01, $2F, $1F 
      .byte $01, $01, $23, $04, $00, $00, $15, $01 
      .byte $01, $21, $08, $00, $01, $2F, $07, $01 
      .byte $15, $01, $01, $22, $08, $00, $01, $2F 
      .byte $07, $01, $15, $01, $01, $23, $08, $00 
      .byte $01, $2F, $07, $01, $15, $01, $01, $23 
      .byte $08, $00, $01, $2F, $07, $01, $15, $01 
      .byte $01, $2A, $07, $00, $01, $25, $08, $01 
      .byte $15, $01, $01, $29, $07, $00, $01, $26 
      .byte $08, $01, $14, $01, $01, $2A, $08, $00 
      .byte $01, $2F, $08, $01, $06, $01, $01, $0C 
      .byte $01, $0D, $0C, $01, $01, $29, $08, $00 
      .byte $01, $2F, $08, $01, $06, $01, $01, $0E 
      .byte $01, $0F, $0B, $01, $01, $28, $09, $00 
      .byte $01, $2F, $08, $01, $12, $01, $01, $28 
      .byte $0A, $00, $01, $2F, $08, $01, $11, $01 
      .byte $01, $28, $0A, $00, $01, $25, $09, $01 
      .byte $10, $01, $01, $28, $0B, $00, $01, $26 
      .byte $09, $01, $0F, $01, $01, $23, $0B, $00 
      .byte $01, $25, $0A, $01, $0F, $01, $01, $23 
      .byte $0B, $00, $01, $26, $0A, $01, $0F, $01 
      .byte $01, $23, $0B, $00, $01, $2F, $0A, $01 
      .byte $0F, $01, $01, $23, $0B, $00, $01, $2F 
      .byte $0A, $01, $0F, $01, $01, $23, $0A, $00 
      .byte $01, $25, $0B, $01, $0F, $01, $01, $23 
      .byte $0A, $00, $01, $26, $0B, $01, $10, $01 
      .byte $0A, $07, $0C, $01, $26, $01, $13, $01 
      .byte $01, $02, $01, $01, $01, $05, $01, $06 
      .byte $0F, $01, $26, $01, $26, $01, $00 
WF254:
      sta  $D412                        ; Voice 3: Control registers
      lda  #$09                         
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      rts                               
WF25D:
      sta  $D412                        ; Voice 3: Control registers
      lda  #$07                         
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      rts                               
WF266:
      lda  #$3B                         
      sta  $2F                          
      lda  #$F3                         
      sta  $30                          
      lda  #$04                         
      sta  $32                          
      lda  #$00                         
      sta  $31                          
      lda  #$00                         
      tay                               
WF279:
      sta  ($31),y                      
      inc  $31                          
      bne  WF281                        
      inc  $32                          
WF281:
      ldx  $31                          
      cpx  #$E0                         
      bne  WF279                        
      ldx  $32                          
      cpx  #$07                         
      bne  WF279                        
      lda  #$D8                         
      sta  $32                          
      lda  #$00                         
      sta  $31                          
      lda  #$06                         
WF297:
      sta  ($31),y                      
      inc  $31                          
      bne  WF29F                        
      inc  $32                          
WF29F:
      ldx  $31                          
      cpx  #$E0                         
      bne  WF297                        
      ldx  $32                          
      cpx  #$DB                         
      bne  WF297                        
      lda  #$04                         
      sta  $32                          
      lda  #$C7                         
      sta  $31                          
      lda  #$0F                         
      sta  $D020                        ; Border color
      sta  $D021                        ; Background 0 color
WF2BB:
      ldy  #$00                         
      lda  ($2F),y                      
      bmi  WF2EB                        
      and  #$F0                         
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      tax                               
      lda  WF335,x                      
      sta  ($31),y                      
      inc  $31                          
      bne  WF2D3                        
      inc  $32                          
WF2D3:
      lda  ($2F),y                      
      and  #$0F                         
      tax                               
      lda  WF335,x                      
      sta  ($31),y                      
      inc  $31                          
      bne  WF2E3                        
      inc  $32                          
WF2E3:
      inc  $2F                          
      bne  WF2E9                        
      inc  $30                          
WF2E9:
      bne  WF2BB                        
WF2EB:
      ldx  #$12                         
WF2ED:
      lda  WF418,x                      
      sta  $06D9,x                      ; Video matrix (25*40)
      dex                               
      bpl  WF2ED                        
      ldx  #$12                         
WF2F8:
      lda  WF42B,x                      
      sta  $0701,x                      ; Video matrix (25*40)
      dex                               
      bpl  WF2F8                        
      ldx  #$12                         
WF303:
      lda  WF43E,x                      
      sta  $0729,x                      ; Video matrix (25*40)
      dex                               
      bpl  WF303                        
      lda  #$0E                         
      sta  $DB03                        ; Color RAM
      lda  $D016                        ; VIC control register
      ora  #$10                         
      sta  $D016                        ; VIC control register
      jsr  WEE3E                        
      jsr  WEE3E                        
      jsr  WEE3E                        
      ldx  #$02                         
      lda  #$06                         
      sta  $D021                        ; Background 0 color
      sta  $D020                        ; Border color
      lda  $D016                        ; VIC control register
      and  #$EF                         
      sta  $D016                        ; VIC control register
      rts                               
WF335:
      .byte $00, $01, $60, $61, $62, $63, $00, $00 
      .byte $10, $10, $00, $10, $11, $11, $30, $11 
      .byte $10, $11, $11, $10, $11, $11, $10, $11 
      .byte $11, $30, $00, $00, $10, $10, $00, $10 
      .byte $10, $00, $10, $01, $00, $00, $10, $00 
      .byte $10, $00, $00, $10, $00, $10, $00, $00 
      .byte $10, $10, $00, $10, $11, $11, $40, $01 
      .byte $00, $00, $10, $00, $11, $10, $00, $11 
      .byte $11, $40, $03, $00, $10, $10, $00, $10 
      .byte $10, $00, $00, $01, $00, $00, $10, $00 
      .byte $10, $00, $00, $10, $05, $30, $05, $11 
      .byte $40, $51, $11, $40, $10, $00, $00, $11 
      .byte $10, $00, $10, $00, $11, $11, $10, $10 
      .byte $00, $10, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $10 
      .byte $00, $00, $21, $11, $30, $13, $00, $10 
      .byte $11, $11, $30, $11, $11, $10, $11, $11 
      .byte $30, $00, $00, $10, $00, $00, $10, $00 
      .byte $10, $15, $30, $10, $10, $00, $10, $10 
      .byte $00, $00, $10, $00, $10, $00, $00, $10 
      .byte $00, $00, $11, $11, $10, $10, $53, $10 
      .byte $10, $00, $10, $11, $10, $00, $11, $11 
      .byte $40, $00, $00, $10, $00, $00, $10, $00 
      .byte $10, $10, $05, $10, $10, $00, $10, $10 
      .byte $00, $00, $10, $05, $30, $00, $00, $11 
      .byte $11, $10, $10, $00, $10, $10, $00, $10 
      .byte $11, $11, $40, $11, $11, $10, $10, $00 
      .byte $10, $00, $FF               
WF418:
      .byte $76, $78, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $73, $74, $00 
      .byte $00, $00, $00               
WF42B:
      .byte $77, $00, $75, $00, $64, $65, $66, $67 
      .byte $68, $69, $6A, $6B, $6C, $6D, $6E, $6F 
      .byte $70, $71, $72               
WF43E:
      .byte $7A, $79, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $7B, $7C, $7D, $7E, $00, $00 
      .byte $00, $00, $00, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $FF, $FF, $FF, $FF, $FF, $FF 
      .byte $FF, $FF, $FF, $BD, $DB, $E7, $E7, $DB 
      .byte $BD, $FF, $C3, $BD, $FD, $F3, $CF, $BF 
      .byte $81, $FF, $81, $BF, $87, $FB, $FD, $BB 
      .byte $C7, $FF, $F7, $E7, $D7, $F7, $F7, $F7 
      .byte $C1, $FF, $C3, $BD, $B9, $A5, $9D, $BD 
      .byte $C3, $FF, $55, $AA, $55, $AA, $FF, $FF 
      .byte $FF, $FF, $00, $7E, $2A, $2A, $2B, $02 
      .byte $04, $08, $10, $20, $40, $9C, $22, $18 
      .byte $44, $38, $00, $00, $00, $00, $00, $00 
      .byte $FF, $FF, $FF, $FF, $00, $00, $00, $00 
      .byte $00, $00, $FF, $E0, $C0, $80, $07, $0F 
      .byte $0F, $0F, $FF, $3F, $3F, $3F, $C0, $C1 
      .byte $C3, $FF, $0F, $0F, $0F, $07, $80, $C0 
      .byte $E0, $FF, $C3, $C1, $C0, $BF, $3F, $3F 
      .byte $7F, $FF, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $80, $80, $80, $80, $80, $80 
      .byte $80, $80, $C0, $C0, $C0, $C0, $C0, $C0 
      .byte $C0, $C0, $E0, $E0, $E0, $E0, $E0, $E0 
      .byte $E0, $E0, $F0, $F0, $F0, $F0, $F0, $F0 
      .byte $F0, $F0, $F8, $F8, $F8, $F8, $F8, $F8 
      .byte $F8, $F8, $FC, $FC, $FC, $FC, $FC, $FC 
      .byte $FC, $FC, $FE, $FE, $FE, $FE, $FE, $FE 
      .byte $FE, $FE, $00, $FF, $FF, $FF, $FF, $FF 
      .byte $FF, $FF, $FF, $00, $FF, $FF, $FF, $FF 
      .byte $FF, $FF, $FF, $FF, $00, $FF, $FF, $FF 
      .byte $FF, $FF, $FF, $FF, $FF, $00, $FF, $FF 
      .byte $FF, $FF, $FF, $FF, $FF, $FF, $00, $FF 
      .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00 
      .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
      .byte $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
      .byte $FF, $00, $80, $C0, $E0, $E0, $F8, $FE 
      .byte $FE, $FF, $80, $C0, $C0, $C0, $E0, $C0 
      .byte $E0, $F0, $F0, $F0, $F8, $F8, $FC, $FE 
      .byte $FE, $FF, $FF, $FE, $FE, $FE, $FE, $FE 
      .byte $FE, $FF, $01, $03, $07, $07, $1F, $7F 
      .byte $7F, $FF, $01, $03, $03, $03, $07, $03 
      .byte $07, $0F, $0F, $0F, $1F, $1F, $3F, $7F 
      .byte $7F, $FF, $F0, $E0, $E0, $E0, $E0, $E0 
      .byte $E0, $F0, $FF, $FE, $FE, $F8, $E0, $E0 
      .byte $C0, $80, $F0, $E0, $C0, $E0, $C0, $C0 
      .byte $C0, $80, $FF, $FE, $FE, $FC, $F8, $F8 
      .byte $F0, $F0, $0F, $07, $07, $07, $07, $07 
      .byte $07, $0F, $FF, $7F, $7F, $1F, $07, $07 
      .byte $03, $01, $0F, $07, $03, $07, $03, $03 
      .byte $03, $01, $FF, $7F, $7F, $3F, $1F, $1F 
      .byte $0F, $0F, $FF, $7F, $7F, $7F, $7F, $7F 
      .byte $7F, $FF, $00, $7C, $C6, $CE, $D6, $E6 
      .byte $C6, $7C, $00, $18, $38, $18, $18, $18 
      .byte $18, $3C, $00, $7C, $C6, $C6, $0C, $38 
      .byte $E0, $FE, $00, $7C, $C6, $06, $1C, $06 
      .byte $C6, $7C, $00, $0C, $1C, $2C, $4C, $FE 
      .byte $0C, $0C, $00, $FE, $C0, $C0, $FC, $06 
      .byte $C6, $7C, $00, $1C, $30, $60, $FC, $C6 
      .byte $C6, $7C, $00, $7E, $C6, $0C, $18, $18 
      .byte $18, $18, $00, $7C, $C6, $C6, $7C, $C6 
      .byte $C6, $7C, $00, $7C, $C6, $C6, $7E, $06 
      .byte $0C, $38, $00, $00, $18, $18, $00, $18 
      .byte $18, $00, $00, $00, $00, $00, $00, $44 
      .byte $EA, $4A, $0A, $EA, $04, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $7E, $00, $7E 
      .byte $00, $00, $00, $00, $12, $15, $15, $15 
      .byte $12, $00, $00, $00, $12, $15, $D5, $15 
      .byte $12, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $38, $6C, $C6, $C6, $FE 
      .byte $C6, $C6, $00, $FC, $66, $66, $7C, $66 
      .byte $66, $FC, $00, $3C, $66, $C0, $C0, $C0 
      .byte $66, $3C, $00, $F8, $64, $66, $66, $66 
      .byte $64, $F8, $00, $FE, $60, $60, $7C, $60 
      .byte $60, $FE, $00, $FE, $60, $60, $7C, $60 
      .byte $60, $F0, $00, $3C, $66, $C0, $DE, $C6 
      .byte $66, $3C, $00, $C6, $C6, $C6, $FE, $C6 
      .byte $C6, $C6, $00, $3C, $18, $18, $18, $18 
      .byte $18, $3C, $00, $1E, $0C, $0C, $0C, $CC 
      .byte $CC, $78, $00, $C6, $CC, $D8, $F0, $D8 
      .byte $CC, $C6, $00, $F0, $60, $60, $60, $60 
      .byte $60, $FE, $00, $C6, $EE, $FE, $D6, $C6 
      .byte $C6, $C6, $00, $C6, $E6, $F6, $DE, $CE 
      .byte $C6, $C6, $00, $7C, $EE, $C6, $C6, $C6 
      .byte $EE, $7C, $00, $FC, $66, $66, $7C, $60 
      .byte $60, $F0, $00, $38, $64, $C2, $C2, $CA 
      .byte $64, $3A, $00, $FC, $C6, $C6, $FC, $D8 
      .byte $CC, $C6, $00, $7C, $C6, $C0, $7C, $06 
      .byte $C6, $7C, $00, $7E, $5A, $18, $18, $18 
      .byte $18, $3C, $00, $C6, $C6, $C6, $C6, $C6 
      .byte $C6, $7C, $00, $C6, $C6, $C6, $6C, $6C 
      .byte $38, $38, $00, $C6, $C6, $C6, $D6, $FE 
      .byte $7C, $44, $00, $C6, $C6, $6C, $38, $6C 
      .byte $C6, $C6, $00, $C6, $C6, $6C, $7C, $38 
      .byte $38, $38, $00, $FE, $C6, $0C, $38, $60 
      .byte $C6, $FE, $00, $06, $0C, $18, $30, $18 
      .byte $0C, $06, $00, $00, $00, $00, $18, $18 
      .byte $30, $60, $00, $C0, $60, $30, $18, $30 
      .byte $60, $C0, $00, $00, $00, $00, $00, $18 
      .byte $18, $00, $00, $00, $00, $7E, $7E, $00 
      .byte $00, $00, $01, $03, $07, $0F, $1F, $3F 
      .byte $7F, $FF, $80, $C0, $E0, $F0, $F8, $FC 
      .byte $FE, $FF, $FF, $FE, $FC, $F8, $F0, $E0 
      .byte $C0, $80, $FF, $7F, $3F, $1F, $0F, $07 
      .byte $03, $01, $7F, $FF, $C0, $C0, $C0, $C0 
      .byte $FF, $7F, $0F, $9F, $98, $18, $18, $98 
      .byte $9F, $0F, $E1, $F9, $19, $19, $19, $19 
      .byte $F9, $E1, $9C, $FF, $C3, $83, $83, $83 
      .byte $83, $83, $78, $FC, $06, $06, $06, $06 
      .byte $06, $06, $67, $7F, $70, $60, $60, $60 
      .byte $60, $60, $1E, $FF, $E1, $C1, $C1, $C1 
      .byte $C1, $C1, $0F, $9F, $98, $98, $98, $98 
      .byte $9F, $8F, $F0, $F9, $19, $19, $19, $19 
      .byte $F9, $F0, $FF, $FF, $81, $81, $81, $81 
      .byte $FF, $FF, $8F, $9F, $98, $98, $98, $98 
      .byte $9F, $8F, $F1, $F9, $19, $19, $19, $19 
      .byte $F9, $F1, $BC, $FE, $C2, $80, $80, $80 
      .byte $80, $80, $3F, $7F, $60, $7F, $7F, $60 
      .byte $7F, $3F, $C0, $E0, $60, $E0, $E0, $00 
      .byte $E0, $C0, $00, $00, $00, $01, $01, $01 
      .byte $01, $01, $00, $00, $00, $80, $80, $80 
      .byte $80, $80, $AA, $A8, $A0, $00, $50, $54 
      .byte $55, $00, $00, $00, $00, $03, $07, $0F 
      .byte $1F, $1E, $3E, $3C, $3C, $3C, $3C, $3C 
      .byte $3E, $1E, $00, $00, $FC, $FF, $FF, $FF 
      .byte $03, $00, $03, $FF, $FF, $FF, $FC, $00 
      .byte $00, $00, $1F, $0F, $07, $03, $00, $00 
      .byte $00, $00, $00, $00, $00, $60, $CE, $D8 
      .byte $CE, $60, $00, $00, $00, $CD, $6D, $6D 
      .byte $6C, $CC, $00, $00, $00, $F7, $B6, $F7 
      .byte $36, $37, $00, $00, $00, $DE, $C3, $C6 
      .byte $D8, $DF, $00, $00, $00, $60, $CF, $CC 
      .byte $CF, $60, $10, $00, $12, $08, $7E, $1C 
      .byte $05, $FF, $CC, $06, $10, $36, $0F, $9F 
      .byte $F0, $08, $92, $10, $08, $F3, $F0, $08 
      .byte $F2, $10, $08, $F4, $08, $1F, $FE, $18 
      .byte $20, $01, $F4, $20, $00, $A4, $27, $80 
      .byte $BC, $27, $C0, $A4, $1F, $FF, $FC, $0D 
      .byte $3C, $B0, $19, $C3, $98, $31, $00, $8C 
      .byte $30, $00, $0C, $78, $00, $1E, $FC, $00 
      .byte $3F, $AA, $38, $FE, $3C, $15, $81, $EA 
      .byte $0A, $00, $37, $09, $EF, $CB, $10, $60 
      .byte $0F, $17, $6D, $E8, $17, $0C, $08, $17 
      .byte $01, $E8, $17, $1D, $F4, $60, $3E, $E4 
      .byte $5F, $BE, $0A, $5F, $DD, $5A, $58, $63 
      .byte $42, $58, $3F, $5A, $20, $00, $02, $12 
      .byte $C3, $66, $26, $3C, $64, $4A, $C3, $52 
      .byte $49, $00, $D2, $84, $00, $21, $FC, $00 
      .byte $3F, $AA, $47, $01, $CE, $2A, $7E, $15 
      .byte $15, $FF, $CB, $36, $10, $35, $2F, $9F 
      .byte $F1, $28, $92, $17, $28, $C0, $F4, $28 
      .byte $3E, $14, $E8, $77, $0A, $9E, $EF, $9A 
      .byte $A0, $FB, $B5, $A0, $7F, $25, $A7, $3E 
      .byte $3D, $A7, $C0, $A5, $5F, $FF, $FD, $2D 
      .byte $3C, $99, $59, $C3, $9A, $B5, $3C, $AD 
      .byte $B6, $C3, $2D, $7B, $00, $DE, $02, $00 
      .byte $40, $AA, $B8, $FE, $3D, $55, $81, $EA 
      .byte $2A, $00, $37, $48, $7F, $0B, $51, $FF 
      .byte $CF, $53, $FF, $E8, $57, $ED, $F3, $CF 
      .byte $F6, $FA, $0F, $A3, $F9, $5D, $42, $BD 
      .byte $5F, $C8, $FC, $4F, $A3, $7A, $4F, $EA 
      .byte $FA, $57, $BF, $F2, $A3, $FF, $E2, $51 
      .byte $FF, $C6, $A6, $7F, $25, $4A, $80, $52 
      .byte $49, $3C, $D2, $84, $C3, $21, $FD, $00 
      .byte $BF, $AA, $C0, $FF, $82, $A3, $FF, $E5 
      .byte $CF, $FF, $F0, $9F, $FD, $F8, $3F, $82 
      .byte $FC, $7E, $90, $2E, $78, $01, $5E, $FC 
      .byte $00, $0F, $FA, $00, $1F, $F0, $00, $07 
      .byte $FC, $00, $17, $F8, $80, $0F, $FA, $00 
      .byte $2F, $FD, $00, $1F, $7E, $89, $9E, $7F 
      .byte $A4, $FE, $3F, $F7, $FC, $9F, $FF, $F9 
      .byte $AF, $FF, $F5, $73, $FF, $CE, $00, $FF 
      .byte $00, $AA, $20, $BB, $81, $23, $FF, $E0 
      .byte $8F, $35, $72, $0E, $88, $58, $38, $80 
      .byte $B4, $32, $00, $0E, $70, $00, $0A, $E8 
      .byte $00, $07, $68, $00, $01, $C0, $00, $07 
      .byte $D0, $00, $04, $68, $00, $05, $F0, $00 
      .byte $02, $B4, $00, $0B, $70, $00, $06, $3A 
      .byte $80, $5A, $2E, $92, $AC, $0B, $28, $79 
      .byte $47, $DB, $D0, $01, $FF, $40, $A0, $BD 
      .byte $0A, $AA, $00, $00, $00, $00, $F8, $50 
      .byte $06, $81, $30, $14, $00, $84, $04, $01 
      .byte $1E, $00, $00, $04, $10, $00, $00, $24 
      .byte $00, $15, $60, $00, $01, $60, $00, $05 
      .byte $20, $00, $08, $20, $00, $00, $40, $00 
      .byte $0A, $28, $00, $04, $00, $00, $06, $20 
      .byte $00, $00, $08, $00, $0C, $0C, $80, $38 
      .byte $00, $00, $00, $00, $CD, $C0, $00, $07 
      .byte $00, $AA, $00, $00, $00, $00, $0C, $00 
      .byte $01, $00, $10, $00, $00, $00, $20, $00 
      .byte $00, $00, $00, $02, $00, $00, $01, $00 
      .byte $00, $00, $00, $00, $02, $00, $00, $02 
      .byte $00, $00, $00, $80, $00, $00, $00, $00 
      .byte $02, $40, $00, $00, $00, $00, $04, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $20, $00, $10, $08, $00, $24, $00, $C0 
      .byte $00, $AA, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $3C, $00, $01, $FF, $80 
      .byte $00, $FF, $00, $00, $3C, $00, $00, $00 
      .byte $00, $AA, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $01, $E7, $80 
      .byte $00, $FF, $00, $00, $7E, $00, $00, $3C 
      .byte $00, $AA, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $30, $00, $00, $C0, $00, $00, $30 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $AA, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $0C, $00, $00, $03, $00 
      .byte $00, $0C, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $AA, $AA, $AA, $37, $E0, $37, $E0 
      .byte $39, $EB
