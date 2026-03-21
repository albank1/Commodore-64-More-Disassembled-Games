;==============================================================================
;  Omega Race (1982, Commodore)
;  Address $24 store the number of lives (ships)
; 
;  Source in Dasm format
; To compile:
; a) dasm OmegaRace.asm -oOmegaRace.bin -f3
; b) cartconv -t normal -i OmegaRace.bin -o OmegaRace.crt
;==============================================================================

      processor 6502
      org $8000

      .word $8009			; Cold start start vector
      .word $80D8			; Warm start vector
      .byte $C3, $C2, $CD, $38, $30 
 
      sei                               
      lda  #$7F                         
      sta  $DC0D                        ; Interrupt control register CIA #1
      sta  $DD0D                        ; Interrupt control register CIA #2
      sta  $DD02                        ; Data direction register port A #2
      lda  $DC0D                        ; Interrupt control register CIA #1
      lda  #$93                         
      sta  $DD00                        ; Data port A #2: serial bus, RS-232, VIC memory
      ldx  #$05                         
W801F:
      lda  W9DF7,x                      
      sta  $FFFA,x                      ; Not Maskerable Interrupt (NMI) vector
      dex                               
      bpl  W801F                        
      ldx  #$1F                         
      ldy  #$00                         
      sty  $DC0E                        
      sty  $DC0F                        
      sty  $B8                          
      lda  #$80                         
      sta  $B9                          
      txa                               
W8039:
      sta  ($B8),y                      
      lda  ($B8),y                      
      sta  ($B8),y                      
      dey                               
      bne  W8039                        
      inc  $B9                          
      dex                               
      bpl  W8039                        
      lda  #$2F                         
      sta  $00                          
      lda  #$E1                         
      sta  $01                          
      ldx  #$00                         
      stx  $17                          
      stx  $18                          
      stx  $19                          
      stx  $16                          
      stx  $0D                          
      inx                               
      stx  $0C                          
      ldx  #$D0                         
W8060:
      lda  #$00                         
      sta  $37FF,x                      
      lda  $D17F,x                      
      sta  $3807,x                      
      lda  $D007,x                      
      sta  $3857,x                      
      dex                               
      bne  W8060                        
      lda  #$E5                         
      sta  $01                          
      lda  #$28                         
      sta  $B8                          
      sta  $BA                          
      lda  #$99                         
      sta  $B9                          
      lda  #$39                         
      sta  $BB                          
      ldx  #$06                         
      ldy  #$00                         
W808A:
      lda  ($B8),y                      
      sta  ($BA),y                      
      dey                               
      bne  W808A                        
      inc  $B9                          
      inc  $BB                          
      dex                               
      bpl  W808A                        
      ldx  #$07                         
      lda  #$00                         
W809C:
      sta  $3A30,x                      
      sta  $3A48,x                      
      sta  $3B70,x                      
      sta  $3B88,x                      
      sta  $3BC0,x                      
      sta  $3BC8,x                      
      sta  $3BF0,x                      
      sta  $3BF8,x                      
      sta  $3C20,x                      
      sta  $3C28,x                      
      sta  $3CC0,x                      
      sta  $3CC8,x                      
      sta  $3CF0,x                      
      sta  $3CF8,x                      
      sta  $3A78,x                      
      sta  $3E30,x                      
      sta  $3E38,x                      
      sta  $3E70,x                      
      sta  $3E78,x                      
      dex                               
      bpl  W809C                        
      sei                               
      cld                               
      ldx  #$FF                         
      txs                               
      ldx  #$18                         
W80DF:
      lda  #$00                         
      sta  $D000,x                      ; Position X sprite 0
      lda  W9229,x                      
      sta  $D016,x                      ; VIC control register
      lda  W9242,x                      
      sta  $D400,x                      ; Voice 1: Frequency control (lo byte)
      dex                               
      bpl  W80DF                        
      lda  #$1B                         
      sta  $D011                        ; VIC control register
      lda  #$1F                         
      sta  $AE                          
W80FC:
      lda  #$00                         
      sta  $D1                          
      sta  $D2                          
      sta  $D3                          
      sta  $D418                        
      jsr  W8222                        
      ldx  #$81                         
      ldy  #$92                         
      jsr  W828F                        
      jsr  W8273                        
      ldx  #$07                         
W8116:
      lda  $0C                          
      sta  $D027,x                      
      dex                               
      bpl  W8116                        
W811E:
      inc  $D2                          
      bne  W8130                        
      ldy  #$FF                         
      sty  $D1                          
      iny                               
      tya                               
      tax                               
      sta  $D2                          
      sta  $D3                          
      jmp  W8176                        

W8130:
      ldx  #$02                         
      jsr  W843E                        
      jsr  W82EC                        
      dey                               
      bmi  W8169                        
      cpy  #$02                         
      bne  W814F                        
W813F:
      jsr  W82EC                        
      tya                               
      bne  W813F                        
      inc  $0C                          
      lda  $0C                          
      and  #$0F                         
      sta  $0C                          
      bpl  W80FC                        
W814F:
      cpy  #$03                         
      bne  W8172                        
W8153:
      jsr  W82EC                        
      tya                               
      bne  W8153                        
      inc  $0D                          
      lda  $0D                          
      and  #$0F                         
      sta  $0D                          
      sta  $D020                        
      sta  $D021                        
      bpl  W811E                        
W8169:
      jsr  W83D5                        
      ldy  #$01                         
      lda  $1D                          
      beq  W811E                        
W8172:
      ldx  #$1F                         
      lda  #$03				; number of lives (ships) (was #$03)                         
W8176:
      sta  $24				; store number of lives                       
      sty  $0E                          
      stx  $D418                        
      jsr  W844C                        
W8180:
      jsr  W846B                        
W8183:
      lda  $D011                        ; VIC control register
      bpl  W8183                        
      jsr  W825C                        
      lda  $D01E                        
      sta  $0F                          
      lda  $D01F                        
      sta  $10                          
      inc  $11                          
      lda  $11                          
      and  #$3F                         
      bne  W81A1                        
      dec  $32                          
      dec  $38                          
W81A1:
      dec  $D0                          
      inc  $12                          
      bne  W81A9                        
      inc  $13                          
W81A9:
      inc  $15                          
      lda  $15                          
      and  #$0F                         
      sta  $15                          
      and  #$07                         
      sta  $14                          
      jsr  W8BE9                        
      jsr  W8CBA                        
      jsr  W8D31                        
      jsr  W888B                        
      jsr  W86AB                        
      jsr  W87EB                        
      jsr  W8A98                        
      jsr  W8AF7                        
      jsr  W8B84                        
      jsr  W8656                        
      jsr  W9F40                        
      lda  $24                          
      and  $13                          
      bmi  W81EF                        
      lda  $A7                          
      bne  W8183                        
      lda  $25                          
      and  $13                          
      bmi  W8180                        
      lda  $87                          
      and  $13                          
      bmi  W8180                        
      jmp  W8183                        

W81EF:
      ldx  #$02                         
W81F1:
      lda  $17,x                        
      cmp  $1A,x                        
      bcc  W81FC                        
      bne  W820B                        
      dex                               
      bpl  W81F1                        
W81FC:
      lda  $1A                          
      sta  $17                          
      lda  $1B                          
      sta  $18                          
      lda  $1C                          
      sta  $19                          
      jsr  W8603                        
W820B:
      lda  #$00                         
      sta  $D418                        
      inc  $16                          
      ldx  #$A6                         
      ldy  #$93                         
      jsr  W828F                        
      ldx  #$FF                         
      jsr  W843E                        
      jmp  W80FC                        

      rts                               

W8222:
      ldx  #$00                         
W8224:
      lda  $0C                          
      sta  $D800,x                      ; Color RAM
      sta  $D900,x                      ; Color RAM
      sta  $DA00,x                      ; Color RAM
      sta  $DAE8,x                      ; Color RAM
      lda  #$00                         
      sta  $0400,x                      ; Video matrix (25*40)
      sta  $0500,x                      ; Video matrix (25*40)
      sta  $0600,x                      ; Video matrix (25*40)
      sta  $06E8,x                      ; Video matrix (25*40)
      inx                               
      bne  W8224                        
      lda  $0D                          
      sta  $D020                        ; Border color
      sta  $D021                        ; Background 0 color
      stx  $D015                        ; Sprites Abilitator
      ldx  #$08                         
W8250:
      lda  W9A77,x                      
      sta  $AE,x                        
      sta  $07F7,x                      
      dex                               
      bne  W8250                        
      rts                               

W825C:
      ldx  #$08                         
W825E:
      lda  $AE,x                        
      sta  $07F7,x                      
      dex                               
      bne  W825E                        
      ldx  #$08                         
W8268:
      lda  $AE,x                        
      cmp  $07F7,x                      
      bne  W825C                        
      dex                               
      bne  W8268                        
      rts                               

W8273:
      ldx  #$12                         
W8275:
      lda  W925B,x                      
      sta  $045A,x                      ; Video matrix (25*40)
      lda  #$07                         
      sta  $D85A,x                      ; Color RAM
      lda  W926E,x                      
      sta  $0482,x                      ; Video matrix (25*40)
      lda  #$08                         
      sta  $D882,x                      ; Color RAM
      dex                               
      bpl  W8275                        
      rts                               

W828F:
      stx  $02                          
      sty  $03                          
W8293:
      ldy  #$00                         
      sty  $07                          
      lda  ($02),y                      
      sta  $04                          
      iny                               
      lda  ($02),y                      
      sta  $05                          
W82A0:
      iny                               
      lda  ($02),y                      
      cmp  #$FF                         
      beq  W82E7                        
      cmp  #$FE                         
      beq  W82C5                        
      cmp  #$FD                         
      beq  W82D5                        
      sty  $06                          
      ldy  $07                          
      sta  ($04),y                      
      inc  $07                          
      ldy  $06                          
      lda  $16                          
      beq  W82A0                        
      ldx  #$03                         
      jsr  W843E                        
      jmp  W82A0                        

W82C5:
      iny                               
      clc                               
      tya                               
      adc  $02                          
      sta  $02                          
      lda  $03                          
      adc  #$00                         
      sta  $03                          
      jmp  W8293                        

W82D5:
      clc                               
      lda  $04                          
      adc  #$28                         
      sta  $04                          
      lda  #$00                         
      sta  $07                          
      adc  $05                          
      sta  $05                          
      jmp  W82A0                        

W82E7:
      lda  #$00                         
      sta  $16                          
      rts                               

W82EC:
      ldx  #$FF                         
      stx  $DC02                        
      inx                               
      stx  $DC03                        
      ldy  #$01                         
      ldx  #$FE                         
      jsr  W8375                        
      cpx  #$EF                         
      beq  W8314                        
      ldy  #$03                         
      cpx  #$BF                         
      beq  W8314                        
      ldy  #$02                         
      cpx  #$DF                         
      beq  W8314                        
      ldy  #$04                         
      cpx  #$F7                         
      beq  W8314                        
      ldy  #$00                         
W8314:
      rts                               

      ldx  #$FF                         
      stx  $DC02                        
      inx                               
      stx  $DC03                        
      lda  $D1                          
      beq  W8340                        
      jsr  W8273                        
      ldx  #$00                         
      stx  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cmp  #$FF                         
      bne  W833D                        
      inc  $D2                          
      bne  W8314                        
      inc  $D3                          
      lda  $D3                          
      cmp  #$03                         
      bne  W8314                        
W833D:
      jmp  W80FC                        

W8340:
      lda  #$1F                         
      ldx  #$FD                         
      jsr  W8375                        
      cpx  #$FB                         
      bne  W834F                        
      and  #$FB                         
      bpl  W8370                        
W834F:
      ldx  #$FB                         
      jsr  W8375                        
      cpx  #$FB                         
      bne  W835A                        
      and  #$F7                         
W835A:
      ldx  #$DF                         
      jsr  W8375                        
      cpx  #$FB                         
      bne  W8365                        
      and  #$EF                         
W8365:
      ldx  #$BF                         
      jsr  W8375                        
      cpx  #$FB                         
      bne  W8370                        
      and  #$FE                         
W8370:
      sta  $AE                          
      jmp  W8381                        

W8375:
      stx  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
W8378:
      ldx  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cpx  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      bne  W8378                        
      rts                               

W8381:
      ldx  #$00                         
      stx  $DC02                        ; Data direction register port A #1
      stx  $DC03                        ; Data direction register port B #1
W8389:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cmp  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      bne  W8389                        
      and  $AE                          
      and  #$1F                         
      tay                               
      and  #$10                       	; test if fire is pressed  
      bne  W839E                        ; change to nop nop for autofire (was bne  W839E)
      ldx  #$80                         
      bne  W83A8                        
W839E:
      bit  $1D                          
      bpl  W83A6                        
      ldx  #$80                         
      stx  $1E                          
W83A6:
      ldx  #$00                         
W83A8:
      stx  $1D                          
      lda  $14                          
      and  #$03                         
      bne  W83C9                        
      ldx  #$00                         
      tya                               
      and  #$04                         
      bne  W83BC                        
      dec  $1F                          
      jmp  W83C3                        

W83BC:
      tya                               
      and  #$08                         
      bne  W83C3                        
      inc  $1F                          
W83C3:
      lda  $1F                          
      and  #$0F                         
      sta  $1F                          
W83C9:
      ldx  #$00                         
      tya                               
      and  #$01                         
      bne  W83D2                        
      ldx  #$80                         
W83D2:
      stx  $20                          
      rts                               

W83D5:
      ldx  #$80                         
      stx  $DC02                        
      ldx  #$00                         
      stx  $DC03                        
      ldx  #$10                         
      lda  $D419                        ; Analog/digital converter: Paddle 1
W83E4:
      cmp  W9CEF,x                      
      bcs  W83EE                        
      dex                               
      bpl  W83E4                        
      bmi  W83F8                        
W83EE:
      dex                               
      txa                               
      adc  #$03                         
      eor  #$FF                         
      and  #$0F                         
      sta  $1F                          
W83F8:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      and  #$04                         
      beq  W841B                        
      lda  #$00                         
      sta  $20                          
      lda  $1D                          
      beq  W8411                        
      lda  $21                          
      cmp  $15                          
      beq  W8415                        
      lda  #$80                         
      sta  $1E                          
W8411:
      lda  $15                          
      sta  $21                          
W8415:
      lda  #$00                         
      sta  $1D                          
      beq  W843D                        
W841B:
      lda  $20                          
      bmi  W843D                        
      lda  $1D                          
      beq  W8435                        
      lda  $21                          
      cmp  $15                          
      bne  W843D                        
      lda  #$00                         
      sta  $1D                          
      lda  #$80                         
      sta  $21                          
      sta  $20                          
      bne  W843D                        
W8435:
      lda  #$80                         
      sta  $1D                          
      lda  $15                          
      sta  $21                          
W843D:
      rts                               

W843E:
      lda  $D011                        ; VIC control register
      bpl  W843E                        
W8443:
      lda  $D011                        ; VIC control register
      bmi  W8443                        
      dex                               
      bne  W843E                        
      rts                               

W844C:
      ldy  #$00                         
      sty  $1A                          
      sty  $1B                          
      sty  $1C                          
      sty  $26                          
      sty  $27                          
      sty  $CE                          
      sty  $A7                          
      ldx  #$07                         
      dey                               
W845F:
      sty  $44,x                        
      dex                               
      bpl  W845F                        
      sty  $25                          
      lda  #$05                         
      sta  $CF                          
      rts                               

W846B:
      jsr  W9FC1                        
      lda  $25                          
      bpl  W8488                        
      inc  $27                          
      dec  $CF                          
      bne  W8488                        
      lda  #$04                         
      sta  $CF                          
      sed                               
      lda  $CE                          
      clc                               
      adc  #$01                         
      sta  $CE                          
      cld                               
      jsr  W91CC                        
W8488:
      ldx  $27                          
      cpx  #$04                         
      bcc  W8490                        
      ldx  #$04                         
W8490:
      lda  W9C1F,x                      
      sta  $25                          
      lda  W9C23,x                      
      sta  $32                          
      lda  W9C27,x                      
      sta  $31                          
      lda  W9C2B,x                      
      sta  $33                          
      lda  W9B6F,x                      
      sta  $35                          
      lda  W9B73,x                      
      sta  $37                          
      lda  #$06                         
      sta  $38                          
      lda  #$01                         
      sta  $34                          
      sta  $36                          
      sta  $D0                          
      lda  $D41B                        
      and  #$01                         
      sta  $30                          
      asl                               
      tay                               
      lda  W9A48,y                      
      sta  $02                          
      lda  W9A49,y                      
      sta  $03                          
      ldy  #$0A                         
W84CF:
      lda  ($02),y                      
      sta  $0039,y                      
      dey                               
      bpl  W84CF                        
      tya                               
      ldy  #$0A                         
W84DA:
      cpx  #$04                         
      beq  W84E9                        
      sta  $0039,y                      
      dey                               
      sta  $0039,y                      
      dey                               
      inx                               
      bne  W84DA                        
W84E9:
      sta  $0039,y                      
      ldy  #$00                         
W84EE:
      lda  W990B,y                      
      sta  $004C,y                      
      iny                               
      cpy  #$0B                         
      bne  W84EE                        
W84F9:
      lda  W990B,y                      
      sta  $0054,y                      
      iny                               
      cpy  #$16                         
      bne  W84F9                        
W8504:
      lda  #$00                         
      sta  $005C,y                      
      iny                               
      cpy  #$21                         
      bne  W8504                        
      ldx  #$07                         
W8510:
      lda  $44,x                        
      and  #$7F                         
      sta  $44,x                        
      dex                               
      bpl  W8510                        
      ldy  $27                          
      dey                               
      bne  W8526                        
      ldx  #$07                         
      dey                               
W8521:
      sty  $44,x                        
      dex                               
      bpl  W8521                        
W8526:
      ldx  #$07                         
W8528:
      lda  $57,x                        
      cmp  #$52                         
      bcc  W854C                        
      cmp  #$6A                         
      bcs  W854C                        
      lda  $7D,x                        
      bne  W8542                        
      lda  $6A,x                        
      cmp  #$37                         
      bcc  W854C                        
      cmp  #$4F                         
      bcs  W854C                        
      bcc  W8548                        
W8542:
      lda  $6A,x                        
      cmp  #$18                         
      bcs  W854C                        
W8548:
      lda  #$FF                         
      sta  $44,x                        
W854C:
      dex                               
      bpl  W8528                        
      ldy  #$07                         
      txa                               
W8552:
      sta  $0087,y                      
      dey                               
      bpl  W8552                        
      ldy  #$17                         
      lda  #$01                         
W855C:
      sta  $008F,y                      
      dey                               
      bpl  W855C                        
      inx                               
      stx  $87                          
      stx  $8C                          
      inx                               
      stx  $8D                          
      lda  $33                          
      sta  $9C                          
      sta  $9D                          
      lda  $30                          
      bne  W8585                        
      lda  #$02                         
      sta  $A4                          
      lda  #$07                         
      sta  $A5                          
      lda  #$37                         
      sta  $D000                        ; Position X sprite 0
      lda  #$00                         
      beq  W8595                        
W8585:
      lda  #$0E                         
      sta  $A4                          
      lda  #$09                         
      sta  $A5                          
      lda  #$2F                         
      sta  $D000                        ; Position X sprite 0
      lda  W9FF7                        
W8595:
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  #$52                         
      sta  $D001                        ; Position Y sprite 0
      lda  #$C7                         
      sta  $D00A                        ; Position X sprite 5
      lda  #$C9                         
      sta  $D00B                        ; Position Y sprite 5
      lda  #$9F                         
      sta  $D00C                        ; Position X sprite 6
      lda  #$B9                         
      sta  $D00D                        ; Position Y sprite 6
      lda  #$00                         
      sta  $1D                          
      sta  $1E                          
      sta  $20                          
      sta  $21                          
      sta  $85                          
      sta  $AD                          
      sta  $13                          
      sta  $22                          
      sta  $23                          
      sta  $CD                          
      tax                               
W85C8:
      sta  $0200,x                      
      sta  $0300,x                      
      inx                               
      bne  W85C8                        
      jsr  W8222                        
      ldx  #$1C                         
      ldy  #$93                         
      jsr  W828F                        
      jsr  W85EA                        
      jsr  W8603                        
      jsr  W8632                        
      lda  #$61                         
      sta  $D015                        ; Sprites Abilitator
      rts                               

W85EA:
      ldx  #$A5                         
      ldy  #$05                         
      jsr  W861C                        
W85F1:
      lda  $1A,x                        
      and  #$0F                         
      jsr  W8629                        
      dey                               
      lda  $1A,x                        
      jsr  W8625                        
      inx                               
      dey                               
      bpl  W85F1                        
      rts                               

W8603:
      ldx  #$F5                         
      ldy  #$05                         
      jsr  W861C                        
W860A:
      lda  $17,x                        
      and  #$0F                         
      jsr  W8629                        
      dey                               
      lda  $17,x                        
      jsr  W8625                        
      inx                               
      dey                               
      bpl  W860A                        
      rts                               

W861C:
      stx  $02                          
      sty  $03                          
      ldx  #$00                         
      ldy  #$05                         
      rts                               

W8625:
      lsr                               
      lsr                               
      lsr                               
      lsr                               
W8629:
      sta  $04                          
      inc  $04                          
      lda  $04                          
      sta  ($02),y                      
      rts                               

W8632:
      ldx  #$42                         
      ldy  #$06                         
      stx  $02                          
      sty  $03                          
      lda  #$06                         
      sta  $05                          
      ldy  #$00                         
      lda  #$42                         
      ldx  $24                          
      bne  W8648                        
W8646:
      lda  #$00                         
W8648:
      sta  ($02),y                      
      iny                               
      iny                               
      dec  $05                          
      beq  W8655                        
      dex                               
      bne  W8648                        
      beq  W8646                        
W8655:
      rts                               

W8656:
      ldx  #$07                         
W8658:
      lda  $28,x                        
      beq  W866A                        
      dec  $28,x                        
      lda  $28,x                        
      beq  W868B                        
      cmp  #$05                         
      beq  W867D                        
      cmp  #$0A                         
      beq  W866F                        
W866A:
      dex                               
      bpl  W8658                        
      bmi  W8699                        
W866F:
      txa                               
      asl                               
      tay                               
      lda  W9E70,y                      
      tax                               
      lda  W9E71,y                      
      tay                               
      jmp  W8696                        

W867D:
      txa                               
      asl                               
      tay                               
      lda  W9CC0,y                      
      tax                               
      lda  W9CC1,y                      
      tay                               
      jmp  W8696                        

W868B:
      txa                               
      asl                               
      tay                               
      lda  W9E30,y                      
      tax                               
      lda  W9E31,y                      
      tay                               
W8696:
      jsr  W828F                        
W8699:
      jsr  W9007                        
      lda  $24                          
      ora  $25                          
      ora  $87                          
      bmi  W86AA                        
      lda  $13                          
      and  #$7F                         
      sta  $13                          
W86AA:
      rts                               

W86AB:
      dec  $36                          
      bne  W86AA                        
      lda  $35                          
      sta  $36                          
      inc  $85                          
      ldx  $85                          
      cpx  #$0B                         
      bcc  W86BD                        
      ldx  #$00                         
W86BD:
      stx  $85                          
      lda  $39,x                        
      cmp  #$FF                         
      beq  W86AA                        
      lda  $39,x                        
      and  #$C0                         
      bne  W86EF                        
      inc  $5F,x                        
      bne  W86D1                        
      inc  $72,x                        
W86D1:
      lda  $5F,x                        
      and  #$07                         
      bne  W86EC                        
      dec  $39,x                        
      lda  $39,x                        
      and  #$3F                         
      bne  W86EC                        
      lda  W95A0,x                      
      ora  #$40                         
      ldy  $30                          
      beq  W86EA                        
      ora  #$80                         
W86EA:
      sta  $39,x                        
W86EC:
      jmp  W8754                        

W86EF:
      cmp  #$80                         
      bne  W8718                        
      dec  $5F,x                        
      lda  $5F,x                        
      cmp  #$FF                         
      bne  W86FD                        
      dec  $72,x                        
W86FD:
      and  #$07                         
      bne  W8754                        
      dec  $39,x                        
      lda  $39,x                        
      and  #$3F                         
      bne  W8754                        
      lda  W95A0,x                      
      ora  #$40                         
      ldy  $30                          
      bne  W8714                        
      ora  #$80                         
W8714:
      sta  $39,x                        
      bne  W8754                        
W8718:
      cmp  #$40                         
      bne  W8739                        
      dec  $4C,x                        
      lda  $4C,x                        
      and  #$07                         
      bne  W8754                        
      dec  $39,x                        
      lda  $39,x                        
      and  #$3F                         
      bne  W8754                        
      lda  W9595,x                      
      ldy  $30                          
      bne  W8735                        
      ora  #$80                         
W8735:
      sta  $39,x                        
      bne  W8754                        
W8739:
      inc  $4C,x                        
      lda  $4C,x                        
      and  #$07                         
      bne  W8754                        
      dec  $39,x                        
      lda  $39,x                        
      and  #$3F                         
      bne  W8754                        
      lda  W9595,x                      
      ldy  $30                          
      beq  W8752                        
      ora  #$80                         
W8752:
      sta  $39,x                        
W8754:
      jsr  W8758                        
      rts                               

W8758:
      jsr  W883E                        
      lda  $39,x                        
      and  #$40                         
      bne  W879C                        
      lda  $5F,x                        
      and  #$07                         
      sta  $04                          
      asl                               
      asl                               
      adc  $04                          
      adc  $04                          
      adc  #$44                         
      tay                               
      sty  $BA                          
      iny                               
      sty  $BB                          
      iny                               
      sty  $BC                          
      iny                               
      sty  $C0                          
      iny                               
      sty  $C1                          
      iny                               
      sty  $C2                          
      ldy  #$FE                         
      sty  $BD                          
      iny                               
      sty  $C3                          
      clc                               
      lda  $02                          
      sta  $B8                          
      adc  #$28                         
      sta  $BE                          
      lda  $03                          
      sta  $B9                          
      adc  #$00                         
      sta  $BF                          
      jmp  W87E3                        

W879C:
      lda  $4C,x                        
      and  #$07                         
      sta  $04                          
      asl                               
      asl                               
      adc  $04                          
      adc  $04                          
      adc  #$74                         
      tay                               
      sty  $BA                          
      iny                               
      sty  $BB                          
      iny                               
      sty  $BF                          
      iny                               
      sty  $C0                          
      iny                               
      sty  $C4                          
      iny                               
      sty  $C5                          
      ldy  #$FE                         
      sty  $BC                          
      sty  $C1                          
      iny                               
      sty  $C6                          
      clc                               
      lda  $02                          
      sta  $B8                          
      adc  #$28                         
      sta  $BD                          
      lda  $03                          
      sta  $B9                          
      adc  #$00                         
      sta  $BE                          
      clc                               
      lda  $02                          
      adc  #$50                         
      sta  $C2                          
      lda  $03                          
      adc  #$00                         
      sta  $C3                          
W87E3:
      ldx  #$B8                         
      ldy  #$00                         
      jsr  W828F                        
      rts                               

W87EB:
      clc                               
      lda  $14                          
      adc  #$0B                         
      tax                               
      lda  $39,x                        
      cmp  #$FF                         
      beq  W883D                        
      bpl  W880E                        
      jsr  W883E                        
      ldy  #$00                         
      lda  ($02),y                      
      cmp  #$A4                         
      beq  W883D                        
      cmp  #$A5                         
      beq  W883D                        
W8808:
      lda  #$FF                         
      sta  $39,x                        
      bmi  W883D                        
W880E:
      jsr  W883E                        
      ldy  #$00                         
      lda  ($02),y                      
      cmp  #$A4                         
      beq  W8808                        
      cmp  #$A5                         
      beq  W8808                        
      lda  $02                          
      sta  $B8                          
      lda  $03                          
      sta  $B9                          
      lda  $39,x                        
      ora  #$80                         
      sta  $39,x                        
      and  #$01                         
      clc                               
      adc  #$A4                         
      sta  $BA                          
      lda  #$FF                         
      sta  $BB                          
      ldx  #$B8                         
      ldy  #$00                         
      jsr  W828F                        
W883D:
      rts                               

W883E:
      lda  #$00                         
      sta  $02                          
      lda  #$04                         
      sta  $03                          
      lda  $4C,x                        
      sec                               
      sbc  #$30                         
      and  #$F8                         
      sta  $04                          
      clc                               
      adc  $02                          
      sta  $02                          
      lda  $03                          
      adc  #$00                         
      sta  $03                          
      lda  #$00                         
      asl  $04                          
      rol                               
      asl  $04                          
      rol                               
      clc                               
      adc  $03                          
      sta  $03                          
      clc                               
      lda  $04                          
      adc  $02                          
      sta  $02                          
      lda  $03                          
      adc  #$00                         
      sta  $03                          
      lda  $72,x                        
      lsr                               
      lda  $5F,x                        
      ror                               
      lsr                               
      lsr                               
      sec                               
      sbc  #$03                         
      clc                               
      adc  $02                          
      sta  $02                          
      lda  $03                          
      adc  #$00                         
      sta  $03                          
      rts                               

W888B:
      lda  #$40                         
      ldx  #$FF                         
      cpx  $8D                          
      beq  W88A1                        
      cpx  $8C                          
      beq  W88B0                        
      ldx  $CD                          
      bne  W88B0                        
      ldx  $D0                          
      cpx  #$07                         
      bcs  W88B0                        
W88A1:
      eor  #$FF                         
      and  $D015                        
      ldx  $D0                          
      bne  W88B3                        
      ldx  #$20                         
      stx  $D0                          
      bne  W88B3                        
W88B0:
      ora  $D015                        ; Sprites Abilitator
W88B3:
      sta  $D015                        ; Sprites Abilitator
      ldx  #$05                         
      jsr  W8967                        
      ldx  #$05                         
      jsr  W88CA                        
      ldx  #$06                         
      jsr  W8967                        
      ldx  #$06                         
      jmp  W88CA                        

W88CA:
      ldy  $87,x                        
      bmi  W88F0                        
      lda  $06                          
      bmi  W88F0                        
      cpy  #$02                         
      bcs  W88E0                        
      iny                               
      tya                               
      and  #$01                         
      sta  $87,x                        
      tay                               
      jmp  W88F1                        

W88E0:
      cpy  #$05                         
      bcs  W88F0                        
      iny                               
      cpy  #$05                         
      bne  W88EB                        
      ldy  #$02                         
W88EB:
      sty  $87,x                        
      jsr  W892E                        
W88F0:
      rts                               

W88F1:
      lda  #$9D                         
      sta  $03                          
      sta  $05                          
      lda  #$60                         
      cpy  #$00                         
      bne  W88FF                        
      lda  #$80                         
W88FF:
      sta  $02                          
      clc                               
      adc  #$10                         
      sta  $04                          
      lda  #$03                         
      sta  $07                          
      lda  #$40                         
      cpx  #$05                         
      beq  W8912                        
      lda  #$80                         
W8912:
      sta  $06                          
      ldy  #$00                         
      ldx  #$10                         
W8918:
      lda  ($02),y                      
      sta  ($06),y                      
      inc  $06                          
      lda  ($04),y                      
      sta  ($06),y                      
      inc  $06                          
      inc  $06                          
      inc  $02                          
      inc  $04                          
      dex                               
      bne  W8918                        
      rts                               

W892E:
      lda  #$9D                         
      sta  $03                          
      dey                               
      dey                               
      tya                               
      asl                               
      asl                               
      asl                               
      asl                               
      clc                               
      adc  #$30                         
      sta  $02                          
      txa                               
      asl                               
      tay                               
      lda  W9BC0,y                      
      ora  #$0C                         
      sta  $06                          
      lda  W9BC1,y                      
      sta  $07                          
      ldy  #$00                         
      ldx  #$08                         
W8951:
      lda  ($02),y                      
      sta  ($06),y                      
      inc  $02                          
      inc  $06                          
      lda  ($02),y                      
      sta  ($06),y                      
      inc  $02                          
      inc  $06                          
      inc  $06                          
      dex                               
      bne  W8951                        
W8966:
      rts                               

W8967:
      lda  #$FF                         
      sta  $06                          
      sta  $07                          
      lda  $87,x                        
      bmi  W8966                        
      dec  $8F,x                        
      bne  W8966                        
      lda  $97,x                        
      sta  $8F,x                        
      inc  $06                          
      lda  $9F,x                        
      tay                               
      lda  W9FD7,y                      
      sta  $02                          
      lda  W9FE7,y                      
      sta  $03                          
      txa                               
      asl                               
      tay                               
      clc                               
      lda  $D001,y                      ; Position Y sprite 0
      adc  $02                          
      sta  $D001,y                      ; Position Y sprite 0
      sta  $02                          
      clc                               
      lda  $D000,y                      ; Position X sprite 0
      adc  $03                          
      sta  $D000,y                      ; Position X sprite 0
      sta  $03                          
      cmp  #$FE                         
      bcc  W89AF                        
      lda  W9FF7,x                      
      eor  #$FF                         
      and  $D010                        ; Position X MSB sprites 0..7
      bcs  W89B9                        
W89AF:
      cmp  #$03                         
      bcs  W89BC                        
      lda  W9FF7,x                      
      ora  $D010                        ; Position X MSB sprites 0..7
W89B9:
      sta  $D010                        ; Position X MSB sprites 0..7
W89BC:
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9FF7,x                      
      sta  $04                          
      lda  #$FF                         
      sta  $05                          
      lda  $02                          
      cmp  #$34                         
      bcs  W89D7                        
      lda  #$35                         
      sta  $D001,y                      ; Position Y sprite 0
      inc  $05                          
      beq  W89E4                        
W89D7:
      cmp  #$E8                         
      bcc  W89F3                        
      lda  #$E7                         
      sta  $D001,y                      ; Position Y sprite 0
      lda  #$04                         
      sta  $05                          
W89E4:
      lda  $04                          
      bne  W89EE                        
      lda  $03                          
      cmp  #$AA                         
      bcc  W8A1C                        
W89EE:
      inc  $05                          
      jmp  W8A1C                        

W89F3:
      lda  $04                          
      bne  W8A27                        
      lda  $03                          
      cmp  #$65                         
      bcc  W8A27                        
      cmp  #$F8                         
      bcs  W8A27                        
      lda  $02                          
      cmp  #$AC                         
      beq  W8A17                        
      cmp  #$AB                         
      beq  W8A17                        
      cmp  #$70                         
      beq  W8A13                        
      cmp  #$71                         
      bne  W8A27                        
W8A13:
      lda  #$6D                         
      bne  W8A19                        
W8A17:
      lda  #$AF                         
W8A19:
      sta  $D001,y                      ; Position Y sprite 0
W8A1C:
      sec                               
      lda  #$08                         
      sbc  $9F,x                        
      and  #$0F                         
      sta  $9F,x                        
      bpl  W8A83                        
W8A27:
      lda  $04                          
      beq  W8A3C                        
      lda  $03                          
      cmp  #$47                         
      bcc  W8A55                        
      lda  #$46                         
      sta  $D000,y                      ; Position X sprite 0
      lda  #$02                         
      sta  $05                          
      bpl  W8A4B                        
W8A3C:
      lda  $03                          
      cmp  #$1C                         
      bcs  W8A55                        
      lda  #$1D                         
      sta  $D000,y                      ; Position X sprite 0
      lda  #$06                         
      sta  $05                          
W8A4B:
      lda  $02                          
      cmp  #$8E                         
      bcc  W8A7A                        
      inc  $05                          
      bcs  W8A7A                        
W8A55:
      lda  $02                          
      cmp  #$70                         
      bcc  W8A97                        
      cmp  #$AD                         
      bcs  W8A97                        
      lda  $03                          
      cmp  #$67                         
      beq  W8A75                        
      cmp  #$68                         
      beq  W8A75                        
      cmp  #$F5                         
      beq  W8A71                        
      cmp  #$F6                         
      bne  W8A97                        
W8A71:
      lda  #$F7                         
      bne  W8A77                        
W8A75:
      lda  #$66                         
W8A77:
      sta  $D000,y                      ; Position X sprite 0
W8A7A:
      sec                               
      lda  #$00                         
      sbc  $9F,x                        
      and  #$0F                         
      sta  $9F,x                        
W8A83:
      cpx  #$00                         
      bne  W8A8B                        
      lda  #$04                         
      sta  $23                          
W8A8B:
      inc  $07                          
      lda  $05                          
      bmi  W8A97                        
      tay                               
      lda  #$0B                         
      sta  $0028,y                      
W8A97:
      rts                               

W8A98:
      lda  $CD                          
      bne  W8ADA                        
      lda  $32                          
      bne  W8ADA                        
      lda  $31                          
      sta  $32                          
      ldx  #$06                         
      lda  #$01                         
      cmp  $87,x                        
      bcs  W8AB3                        
      dex                               
      cmp  $87,x                        
      bcs  W8AB8                        
      bcc  W8ADA                        
W8AB3:
      lda  $88,x                        
      jmp  W8ABA                        

W8AB8:
      lda  $86,x                        
W8ABA:
      cmp  #$02                         
      bcc  W8AC2                        
      cmp  #$05                         
      bcc  W8ADA                        
W8AC2:
      lda  #$02                         
      sta  $87,x                        
      lda  #$01                         
      sta  $8F,x                        
      ldy  $27                          
      cpy  #$06                         
      bcs  W8AD3                        
      lda  W9B87,y                      
W8AD3:
      sta  $97,x                        
      sta  $CD                          
      jsr  W8ADB                        
W8ADA:
      rts                               

W8ADB:
      stx  $02                          
      ldx  #$00                         
      stx  $03                          
      ldy  #$05                         
W8AE3:
      asl  $02                          
      rol  $03                          
      dey                               
      bpl  W8AE3                        
      inc  $03                          
      inc  $03                          
      ldy  #$3F                         
      txa                               
W8AF1:
      sta  ($02),y                      
      dey                               
      bpl  W8AF1                        
      rts                               

W8AF7:
      ldx  #$05                         
      lda  #$FF                         
      cmp  $87,x                        
      beq  W8B04                        
      inx                               
      cmp  $87,x                        
      bne  W8B83                        
W8B04:
      ldy  #$0A                         
W8B06:
      lda  $0039,y                      
      cmp  #$FF                         
      bne  W8B12                        
      dey                               
      bpl  W8B06                        
      bmi  W8B83                        
W8B12:
      txa                               
      asl                               
      tax                               
      lda  #$FF                         
      sta  $0039,y                      
      lda  $004C,y                      
      sta  $D001,x                      ; Position Y sprite 0
      lda  $005F,y                      ; Scratch for numeric operation
      sta  $D000,x                      ; Position X sprite 0
      txa                               
      lsr                               
      tax                               
      lda  $0072,y                      
      beq  W8B36                        
      lda  W9FF7,x                      
      ora  $D010                        ; Position X MSB sprites 0..7
      bne  W8B3E                        
W8B36:
      lda  W9FF7,x                      
      eor  #$FF                         
      and  $D010                        ; Position X MSB sprites 0..7
W8B3E:
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  #$01                         
      sta  $87,x                        
      sta  $8F,x                        
      lda  $33                          
      sta  $97,x                        
      lda  $D41B                        
      stx  $02                          
      lsr  $02                          
      clc                               
      ora  $02                          
      and  #$0F                         
      sta  $9F,x                        
      lda  $D015                        ; Sprites Abilitator
      ora  W9FF7,x                      
      sta  $D015                        ; Sprites Abilitator
      tya                               
      tax                               
      jsr  W883E                        
      lda  #$00                         
      tay                               
      sta  ($02),y                      
      iny                               
      sta  ($02),y                      
      iny                               
      sta  ($02),y                      
      ldy  #$28                         
      sta  ($02),y                      
      iny                               
      sta  ($02),y                      
      iny                               
      sta  ($02),y                      
      ldy  #$50                         
      sta  ($02),y                      
      iny                               
      sta  ($02),y                      
W8B83:
      rts                               

W8B84:
      lda  $25                          
      bmi  W8B83                        
      lda  $38                          
      bne  W8BE8                        
      lda  $37                          
      sta  $38                          
      lda  $D41B                        
      and  #$02                         
      bne  W8BE8                        
      ldx  #$05                         
      lda  $87,x                        
      bpl  W8BA2                        
      inx                               
      lda  $87,x                        
      bmi  W8BE8                        
W8BA2:
      ldy  #$07                         
W8BA4:
      lda  $0044,y                      
      cmp  #$FF                         
      beq  W8BB0                        
      dey                               
      bpl  W8BA4                        
      bmi  W8BE8                        
W8BB0:
      lda  $D41B                        
      and  #$01                         
      sta  $0044,y                      
      stx  $02                          
      txa                               
      asl                               
      tax                               
      clc                               
      lda  $D001,x                      ; Position Y sprite 0
      adc  #$08                         
      and  #$F8                         
      sta  $0057,y                      ; Scratch for numeric operation
      clc                               
      lda  $D000,x                      ; Position X sprite 0
      adc  #$08                         
      and  #$F8                         
      sta  $006A,y                      
      ldx  $02                          
      lda  #$00                         
      sta  $007D,y                      
      bcs  W8BE4                        
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9FF7,x                      
      beq  W8BE8                        
W8BE4:
      tya                               
      tax                               
      inc  $7D,x                        
W8BE8:
      rts                               

W8BE9:
      lda  $87                          
      bmi  W8BE8                        
      jsr  W9BF0                        
      ldx  $20                          
      bpl  W8C52                        
      lda  $23                          
      beq  W8BFC                        
      dec  $23                          
      bne  W8C4E                        
W8BFC:
      lda  $22                          
      beq  W8C44                        
      lda  #$03                         
      jsr  W9DA0                        
      ldx  $9F                          
      ldy  $1F                          
      clc                               
      lda  W9FE7,x                      
      adc  W9FE7,y                      
      cmp  #$FE                         
      bcs  W8C1B                        
      cmp  #$03                         
      bcc  W8C1B                        
      lda  W9FE7,y                      
W8C1B:
      sta  $02                          
      clc                               
      lda  W9FD7,x                      
      adc  W9FD7,y                      
      cmp  #$FE                         
      bcs  W8C2F                        
      cmp  #$03                         
      bcc  W8C2F                        
      lda  W9FD7,y                      
W8C2F:
      sta  $03                          
      ldx  #$0F                         
W8C33:
      lda  W9FE7,x                      
      cmp  $02                          
      bne  W8C41                        
      lda  W9FD7,x                      
      cmp  $03                          
      beq  W8C46                        
W8C41:
      dex                               
      bpl  W8C33                        
W8C44:
      ldx  $1F                          
W8C46:
      stx  $9F                          
      ldy  #$01                         
      sty  $97                          
      sty  $22                          
W8C4E:
      lda  #$10                         
      bne  W8C59                        
W8C52:
      lda  #$83                         
      jsr  W9DA0                        
      lda  #$00                         
W8C59:
      ora  $1F                          
      sta  $87                          
      jsr  W8C81                        
      ldy  $97                          
      dey                               
      bne  W8C6B                        
      lda  $14                          
      and  #$03                         
      beq  W8C80                        
W8C6B:
      lda  $22                          
      beq  W8C80                        
      ldx  #$00                         
      jsr  W8967                        
      lda  $07                          
      bmi  W8C80                        
      ldy  $97                          
      cpy  #$03                         
      beq  W8C80                        
      inc  $97                          
W8C80:
      rts                               

W8C81:
      lda  $87                          
      bmi  W8CB9                        
      and  #$1F                         
      asl                               
      asl                               
      asl                               
      sta  $04                          
      asl                               
      sta  $02                          
      lda  #$96                         
      adc  #$00                         
      sta  $03                          
      clc                               
      lda  $02                          
      adc  $04                          
      sta  $02                          
      lda  $03                          
      adc  #$00                         
      sta  $03                          
      ldy  #$00                         
      ldx  #$00                         
W8CA6:
      lda  ($02),y                      
      sta  $0206,x                      
      iny                               
      inx                               
      lda  ($02),y                      
      sta  $0206,x                      
      iny                               
      inx                               
      inx                               
      cpy  #$18                         
      bne  W8CA6                        
W8CB9:
      rts                               

W8CBA:
      lda  $87                          
      bmi  W8D30                        
      lda  $1E                          
      beq  W8D30                        
      ldx  #$04                         
W8CC4:
      lda  $87,x                        
      cmp  #$FF                         
      beq  W8CD1                        
      dex                               
      bne  W8CC4                        
      stx  $1E                          
      beq  W8D30                        
W8CD1:
      lda  #$00                         
      sta  $1E                          
      sta  $87,x                        
      lda  $1F                          
      sta  $9F,x                        
      lda  #$02                         
      jsr  W9DA0                        
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9FF7                        
      beq  W8CF1                        
      lda  $D010                        ; Position X MSB sprites 0..7
      ora  W9FF7,x                      
      sta  $D010                        ; Position X MSB sprites 0..7
W8CF1:
      txa                               
      asl                               
      tay                               
      lda  $D000                        ; Position X sprite 0
      sta  $D000,y                      ; Position X sprite 0
      lda  $D001                        ; Position Y sprite 0
      sta  $D001,y                      ; Position Y sprite 0
W8D00:
      lda  $D015                        ; Sprites Abilitator
      ora  W9FF7,x                      
      sta  $D015                        ; Sprites Abilitator
      lda  $9F,x                        
      and  #$07                         
      asl                               
      asl                               
      asl                               
      tax                               
      lda  W9BC0,y                      
      sta  $02                          
      lda  W9BC1,y                      
      sta  $03                          
      ldy  #$15                         
W8D1D:
      lda  W9F00,x                      
      sta  ($02),y                      
      inx                               
      iny                               
      lda  W9F00,x                      
      sta  ($02),y                      
      inx                               
      iny                               
      iny                               
      cpy  #$21                         
      bne  W8D1D                        
W8D30:
      rts                               

W8D31:
      ldx  #$04                         
      stx  $86                          
W8D35:
      ldx  $86                          
      lda  $87,x                        
      bpl  W8D42                        
W8D3B:
      dec  $86                          
      bpl  W8D35                        
      jmp  W90CE                        

W8D42:
      cpx  #$00                         
      beq  W8D68                        
      jsr  W8967                        
      lda  $07                          
      bmi  W8D68                        
      lda  #$FF                         
      sta  $87,x                        
      eor  W9FF7,x                      
      and  $D015                        ; Sprites Abilitator
      sta  $D015                        ; Sprites Abilitator
      lda  W9FF7,x                      
      eor  #$FF                         
      and  $D010                        ; Position X MSB sprites 0..7
      sta  $D010                        ; Position X MSB sprites 0..7
      jmp  W8ED5                        

W8D68:
      lda  $87                          
      bmi  W8D3B                        
      ldx  $86                          
      txa                               
      asl                               
      tay                               
      lda  #$00                         
      sta  $03                          
      lda  W9FF7,x                      
      and  $D010                        ; Position X MSB sprites 0..7
      beq  W8D7F                        
      inc  $03                          
W8D7F:
      lda  $D000,y                      ; Position X sprite 0
      sta  $02                          
      lda  $D001,y                      ; Position Y sprite 0
      sta  $04                          
      lda  $0F                          
      and  W9FF7,x                      
      bne  W8D93                        
      jmp  W8E38                        

W8D93:
      ldx  #$07                         
W8D95:
      lda  $87,x                        
      bpl  W8DA1                        
W8D99:
      dex                               
      cpx  #$04                         
      bne  W8D95                        
      jmp  W8E38                        

W8DA1:
      jsr  W8DAA                        
      lda  $87,x                        
      bpl  W8D99                        
      bmi  W8D3B                        
W8DAA:
      txa                               
      pha                               
      lda  $0F                          
      and  W9FF7,x                      
      bne  W8DB6                        
      jmp  W8E35                        

W8DB6:
      lda  $87,x                        
      bmi  W8E35                        
      txa                               
      asl                               
      tay                               
      lda  $D001,y                      ; Position Y sprite 0
      sta  $07                          
      lda  $D000,y                      ; Position X sprite 0
      sta  $05                          
      lda  #$00                         
      sta  $06                          
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9FF7,x                      
      beq  W8DD5                        
      inc  $06                          
W8DD5:
      lda  $87,x                        
      cmp  #$02                         
      bcc  W8DFC                        
      lda  #$08                         
      sta  $08                          
      lda  #$04                         
      sta  $09                          
      lda  #$06                         
      sta  $0A                          
      lda  #$0C                         
      sta  $0B                          
      jsr  W8F4C                        
      bcc  W8E35                        
      lda  #$00                         
      sta  $CD                          
      lda  $31                          
      sta  $32                          
      lda  #$25                         
      bne  W8E15                        
W8DFC:
      lda  #$0A                         
      sta  $08                          
      sta  $0A                          
      lda  #$0B                         
      sta  $09                          
      lda  #$15                         
      sta  $0B                          
      jsr  W8F4C                        
      bcc  W8E35                        
      lda  #$15                         
      cpx  #$07                         
      beq  W8E18                        
W8E15:
      jsr  W8F90                        
W8E18:
      lda  #$FF                         
      sta  $87,x                        
      eor  W9FF7,x                      
      and  $D015                        ; Sprites Abilitator
      sta  $D015                        ; Sprites Abilitator
      lda  #$80                         
      cpx  #$07                         
      bne  W8E31                        
      ldx  $86                          
      beq  W8E31                        
      lda  #$C7                         
W8E31:
      ldx  $86                          
      sta  $87,x                        
W8E35:
      pla                               
      tax                               
      rts                               

W8E38:
      ldx  $86                          
      lda  $10                          
      and  W9FF7,x                      
      bne  W8E44                        
      jmp  W8D3B                        

W8E44:
      ldx  #$0A                         
W8E46:
      lda  $39,x                        
      cmp  #$FF                         
      bne  W8E52                        
W8E4C:
      dex                               
      bpl  W8E46                        
      jmp  W8ED5                        

W8E52:
      lda  $5F,x                        
      sta  $05                          
      lda  $72,x                        
      sta  $06                          
      lda  $4C,x                        
      sta  $07                          
      lda  #$08                         
      sta  $08                          
      lda  #$07                         
      sta  $09                          
      lda  #$09                         
      sta  $0A                          
      lda  #$0F                         
      sta  $0B                          
      jsr  W8F4C                        
      bcc  W8E4C                        
      lda  #$10                         
      jsr  W8F90                        
      lda  #$FF                         
      sta  $39,x                        
      lda  $86                          
      jsr  W8FDF                        
      jsr  W883E                        
      clc                               
      lda  $02                          
      sta  $B8                          
      adc  #$28                         
      sta  $BE                          
      lda  $03                          
      sta  $B9                          
      adc  #$00                         
      sta  $BF                          
      clc                               
      lda  $02                          
      adc  #$50                         
      sta  $C4                          
      lda  $03                          
      adc  #$00                         
      sta  $C5                          
      lda  #$00                         
      sta  $BA                          
      sta  $BB                          
      sta  $BC                          
      sta  $C0                          
      sta  $C1                          
      sta  $C2                          
      sta  $C6                          
      sta  $C7                          
      sta  $C8                          
      ldy  #$FE                         
      sty  $BD                          
      sty  $C3                          
      iny                               
      sty  $C9                          
      ldx  #$B8                         
      ldy  #$00                         
      jsr  W828F                        
      ldx  #$56                         
      ldy  #$93                         
      jsr  W828F                        
      ldx  $86                          
      lda  #$80                         
      sta  $87,x                        
      bne  W8EDE                        
W8ED5:
      ldx  $86                          
      lda  $10                          
      and  W9FF7,x                      
      bne  W8EE1                        
W8EDE:
      jmp  W8D3B                        

W8EE1:
      ldx  #$07                         
W8EE3:
      lda  $44,x                        
      cmp  #$FF                         
      bne  W8EEE                        
W8EE9:
      dex                               
      bpl  W8EE3                        
      bmi  W8EDE                        
W8EEE:
      lda  $57,x                        
      sta  $07                          
      lda  $6A,x                        
      sta  $05                          
      lda  $7D,x                        
      sta  $06                          
      lda  #$06                         
      sta  $08                          
      lda  #$0C                         
      sta  $09                          
      lda  #$09                         
      sta  $0A                          
      lda  #$12                         
      sta  $0B                          
      jsr  W8F4C                        
      bcc  W8EE9                        
      lda  $44,x                        
      and  #$01                         
      bne  W8F17                        
      dec  $CC                          
W8F17:
      lda  #$05                         
      jsr  W8F90                        
      lda  #$FF                         
      sta  $44,x                        
      txa                               
      clc                               
      adc  #$0B                         
      tax                               
      lda  $86                          
      jsr  W8FDF                        
      jsr  W883E                        
      lda  $02                          
      sta  $B8                          
      lda  $03                          
      sta  $B9                          
      ldy  #$00                         
      sty  $BA                          
      dey                               
      sty  $BB                          
      ldx  #$B8                         
      ldy  #$00                         
      jsr  W828F                        
      ldx  $86                          
      lda  #$80                         
      sta  $87,x                        
      jmp  W8D3B                        

W8F4C:
      sec                               
      lda  $07                          
      sbc  $08                          
      cmp  $04                          
      bcs  W8F8E                        
      clc                               
      lda  $07                          
      adc  $09                          
      cmp  $04                          
      bcc  W8F8E                        
      sec                               
      lda  $05                          
      sbc  $0A                          
      sta  $05                          
      lda  $06                          
      sbc  #$00                         
      sta  $06                          
      sec                               
      lda  $05                          
      sbc  $02                          
      lda  $06                          
      sbc  $03                          
      bcs  W8F8E                        
      lda  $05                          
      adc  $0B                          
      sta  $05                          
      lda  $06                          
      adc  #$00                         
      sta  $06                          
      sec                               
      lda  $05                          
      sbc  $02                          
      lda  $06                          
      sbc  $03                          
      bcc  W8F8E                        
      rts                               

W8F8E:
      clc                               
      rts                               

W8F90:
      stx  $B8                          
      cmp  #$10                         
      bcc  W8FA6                        
      dec  $25                          
      bpl  W8FA6                        
      ldx  #$40                         
      stx  $12                          
      ldx  #$7F                         
      stx  $13                          
      ldx  #$0F                         
      stx  $A7                          
W8FA6:
      clc                               
      sed                               
      bit  $CC                          
      bpl  W8FB4                        
      lda  #$50                         
      adc  $1A                          
      sta  $1A                          
      lda  #$03                         
W8FB4:
      adc  $1B                          
      sta  $1B                          
      lda  #$00                         
      sta  $CC                          
      adc  $1C                          
      sta  $1C                          
      cld                               
      jsr  W85EA                        
      lda  $26                          
      bne  W8FDC                        
      lda  $1C                          
      cmp  #$04                         
      bcc  W8FDC                        
      lda  #$01                         
      sta  $26                          
      inc  $24                          
      jsr  W8632                        
      lda  #$01                         
      jsr  W9DA0                        
W8FDC:
      ldx  $B8                          
      rts                               

W8FDF:
      sta  $02                          
      asl                               
      tay                               
      lda  $4C,x                        
      sta  $D001,y                      ; Position Y sprite 0
      lda  $5F,x                        
      sta  $D000,y                      ; Position X sprite 0
      ldy  $02                          
      lda  $72,x                        
      beq  W8FFB                        
      lda  W9FF7,y                      
      ora  $D010                        ; Position X MSB sprites 0..7
      bne  W9003                        
W8FFB:
      lda  W9FF7,y                      
      eor  #$FF                         
      and  $D010                        ; Position X MSB sprites 0..7
W9003:
      sta  $D010                        ; Position X MSB sprites 0..7
      rts                               

W9007:
      ldx  #$07                         
W9009:
      lda  $87,x                        
      bmi  W9011                        
W900D:
      dex                               
      bpl  W9009                        
      rts                               

W9011:
      cmp  #$FF                         
      beq  W900D                        
      inc  $87,x                        
      lda  $87,x                        
      cmp  #$82                         
      beq  W908A                        
      cmp  #$89                         
      beq  W9084                        
      cmp  #$90                         
      beq  W9087                        
      cmp  #$98                         
      bne  W902D                        
      cpx  #$00                         
      bne  W9049                        
W902D:
      cmp  #$98                         
      beq  W9084                        
      cmp  #$A0                         
      beq  W9087                        
      cmp  #$A8                         
      beq  W9084                        
      cmp  #$B0                         
      beq  W9087                        
      cmp  #$B8                         
      beq  W9084                        
      cmp  #$C0                         
      beq  W9087                        
      cmp  #$C8                         
      bne  W900D                        
W9049:
      lda  #$FF                         
      sta  $87,x                        
      lda  W9FF7,x                      
      eor  #$FF                         
      and  $D015                        ; Sprites Abilitator
      sta  $D015                        ; Sprites Abilitator
      lda  W9A78,x                      
      sta  $AF,x                        ; Addresses of Tape end/Program end
      lda  W9FF7,x                      
      eor  #$FF                         
      and  $D010                        ; Position X MSB sprites 0..7
      sta  $D010                        ; Position X MSB sprites 0..7
      cpx  #$00                         
      bne  W907E
      ; change to lda $24 for infinitite lives (originally dec $24)                   
      dec  $24				; reduce lives (originally dec $24)                          
      lda  #$40                         
      sta  $12                          
      lda  #$7F                         
      sta  $13                          
      jsr  W8ADB                        
      lda  #$85                         
      jsr  W9DA0                        
W907E:
      jsr  W8ADB                        
      jmp  W900D                        

W9084:
      jmp  W90AE                        

W9087:
      jmp  W90BC                        

W908A:
      ldy  #$F8                         
      cpx  #$00                         
      bne  W90A3                        
      ldy  #$FA                         
      lda  #$83                         
      jsr  W9DA0                        
      ldx  #$02                         
      jsr  W843E                        
      lda  #$05                         
      jsr  W9DA0                        
      bne  W90A8                        
W90A3:
      lda  #$04                         
      jsr  W9DA0                        
W90A8:
      tya                               
      sta  $AF,x                        
      jmp  W900D                        

W90AE:
      ldy  #$F9                         
      cpx  #$00                         
      bne  W90B6                        
      iny                               
      iny                               
W90B6:
      tya                               
      sta  $AF,x                        
      jmp  W900D                        

W90BC:
      ldy  #$F8                         
      cpx  #$00                         
      bne  W90C8                        
      lda  #$02                         
      sta  $13                          
      iny                               
      iny                               
W90C8:
      tya                               
      sta  $AF,x                        
      jmp  W900D                        

W90CE:
      lda  $8E                          
      bmi  W90FA                        
      ldx  #$07                         
      jsr  W8967                        
      inc  $B7                          
      lda  $B7                          
      beq  W90E1                        
      lda  $07                          
      bmi  W90F9                        
W90E1:
      lda  #$FF                         
      sta  $87,x                        
      eor  W9FF7,x                      
      and  $D015                        ; Sprites Abilitator
      sta  $D015                        ; Sprites Abilitator
      lda  W9FF7,x                      
      eor  #$FF                         
      and  $D010                        ; Position X MSB sprites 0..7
      sta  $D010                        ; Position X MSB sprites 0..7
W90F9:
      rts                               

W90FA:
      lda  $25                          
      bmi  W90F9                        
      lda  $12                          
      and  #$08                         
      beq  W90F9                        
      ldx  #$05                         
      lda  $87,x                        
      bpl  W910F                        
      inx                               
      lda  $87,x                        
      bmi  W90F9                        
W910F:
      ldy  #$00                         
      sty  $8E                          
      iny                               
      sty  $96                          
      sty  $9E                          
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9FF7,x                      
      beq  W9129                        
      lda  $D010                        ; Position X MSB sprites 0..7
      ora  W9FFE                        
      sta  $D010                        ; Position X MSB sprites 0..7
W9129:
      txa                               
      asl                               
      tay                               
      lda  $D000,y                      ; Position X sprite 0
      sta  $D00E                        ; Position X sprite 7
      lda  $D001,y                      ; Position Y sprite 0
      sta  $D00F                        ; Position Y sprite 7
      lda  #$00                         
      sta  $03                          
      sta  $06                          
      sta  $07                          
      sta  $0B                          
      lda  $D010                        ; Position X MSB sprites 0..7
      and  W9FF7,x                      
      beq  W914C                        
      inc  $03                          
W914C:
      sec                               
      lda  $D000                        ; Position X sprite 0
      sbc  $D000,y                      ; Position X sprite 0
      sta  $02                          
      lda  $D010                        ; Position X MSB sprites 0..7
      and  #$01                         
      sbc  $03                          
      bcs  W916A                        
      inc  $06                          
      lda  #$FF                         
      eor  $02                          
      sta  $02                          
      lda  #$FF                         
      eor  $03                          
W916A:
      sta  $03                          
      cmp  #$40                         
      bcs  W9172                        
      sta  $0B                          
W9172:
      sec                               
      lda  $D001                        ; Position Y sprite 0
      sbc  $D001,y                      ; Position Y sprite 0
      bcs  W9181                        
      inc  $07                          
      lda  #$FF                         
      eor  $04                          
W9181:
      sta  $04                          
      cmp  #$40                         
      bcs  W9189                        
      sta  $0B                          
W9189:
      ldy  $0B                          
      beq  W918E                        
      rts                               

W918E:
      lsr  $03                          
      ror  $02                          
      ldy  #$00                         
W9194:
      clc                               
      lda  $04                          
      sbc  $02                          
      sta  $04                          
      bcc  W91A2                        
      iny                               
      cpy  #$06                         
      bne  W9194                        
W91A2:
      lda  W9A30,y                      
      sta  $08                          
      ldy  $06                          
      beq  W91B4                        
      clc                               
      lda  #$00                         
      sbc  $08                          
      and  #$0F                         
      sta  $08                          
W91B4:
      ldy  $07                          
      beq  W91BF                        
      clc                               
      lda  #$08                         
      sbc  $08                          
      and  #$0F                         
W91BF:
      sta  $A6                          
      ldx  #$B0                         
      stx  $B7                          
      ldx  #$07                         
      ldy  #$0E                         
      jmp  W8D00                        

W91CC:
      jsr  W8222                        
      ldx  #$FA                         
      ldy  #$91                         
      jsr  W828F                        
      ldx  #$00                         
      lda  $CE                          
      and  #$F0                         
      beq  W91E4                        
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      tax                               
      inx                               
W91E4:
      stx  $05A9                        
      lda  $CE                          
      and  #$0F                         
      tax                               
      inx                               
      stx  $05AA                        
      ldx  #$FF                         
      jsr  W843E                        
      lda  #$50                         
      jmp  W8FA6                        

      .byte $9D, $05, $0E, $1C, $19, $13, $0E, $00 
      .byte $10, $19, $1C, $0D, $0F, $FE, $EF, $05 
      .byte $0F, $16, $13, $17, $13, $18, $0B, $1E 
      .byte $0F, $0E, $FE, $3B, $06, $06, $01, $01 
      .byte $01, $00, $0C, $19, $18, $1F, $1D, $00 
      .byte $1A, $19, $13, $18, $1E, $1D, $FF 
W9229:
      .byte $0B, $00, $1E, $FF, $00, $00, $00, $00 
      .byte $00, $00, $01, $01, $00, $00, $00, $00 
      .byte $00, $01, $01, $01, $01, $01, $01, $01 
      .byte $01                         
W9242:
      .byte $00, $20, $00, $00, $20, $00, $F9, $FF 
      .byte $00, $00, $00, $20, $00, $FD, $FF, $FF 
      .byte $00, $00, $80, $00, $F0, $FF, $FF, $07 
      .byte $1F                         
W925B:
      .byte $2A, $3C, $29, $3C, $2B, $3C, $2C, $3C 
      .byte $2D, $3C, $3C, $3C, $2E, $3C, $2D, $3C 
      .byte $2C, $3C, $2B               
W926E:
      .byte $2F, $3D, $30, $3D, $31, $3D, $2F, $3D 
      .byte $30, $3D, $3D, $3D, $30, $3D, $30, $3D 
      .byte $43, $3D, $31, $1E, $05, $10, $02, $00 
      .byte $15, $0F, $23, $1D, $00, $00, $16, $27 
      .byte $10, $13, $1C, $0F, $00, $00, $28, $27 
      .byte $1E, $12, $1C, $1F, $1D, $1E, $FE, $4F 
      .byte $05, $0B, $27, $16, $0F, $10, $1E, $00 
      .byte $00, $0E, $27, $1C, $13, $11, $12, $1E 
      .byte $FE, $BE, $05, $10, $02, $00, $14, $19 
      .byte $23, $1D, $1E, $13, $0D, $15, $FE, $36 
      .byte $06, $10, $04, $00, $1A, $0B, $0E, $0E 
      .byte $16, $0F, $FE, $AE, $06, $10, $06, $00 
      .byte $1D, $12, $13, $1A, $00, $0D, $19, $16 
      .byte $19, $1C, $FE, $26, $07, $10, $08, $00 
      .byte $1D, $0D, $1C, $0F, $0F, $18, $00, $0D 
      .byte $19, $16, $19, $1C, $FE, $9D, $07, $25 
      .byte $0D, $26, $00, $02, $0A, $09, $03, $00 
      .byte $0D, $19, $17, $17, $19, $0E, $19, $1C 
      .byte $0F, $00, $16, $1E, $0E, $FE, $C5, $07 
      .byte $25, $0D, $26, $00, $02, $0A, $09, $02 
      .byte $00, $0C, $0B, $16, $16, $23, $27, $17 
      .byte $13, $0E, $21, $0B, $23, $FF, $00, $04 
      .byte $32, $FE, $13, $04, $33, $FE, $27, $04 
      .byte $34, $FE, $9F, $05, $1D, $0D, $19, $1C 
      .byte $0F, $FE, $E0, $05, $39, $FE, $EC, $05 
      .byte $12, $13, $27, $1D, $0D, $19, $1C, $0F 
      .byte $FE, $07, $06, $35, $FE, $3C, $06, $1D 
      .byte $12, $13, $1A, $FE, $C0, $07, $38, $FE 
      .byte $D3, $07, $37, $FE, $E7, $07, $36, $FE 
      .byte $73, $05, $41, $3C, $3C, $3C, $3C, $3C 
      .byte $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C 
      .byte $3C, $3C, $40, $FE, $9B, $05, $3B, $FE 
      .byte $AB, $05, $3A, $FE, $C3, $05, $3B, $FE 
      .byte $D3, $05, $3A, $FE, $EB, $05, $3B, $FE 
      .byte $FB, $05, $3A, $FE, $13, $06, $3B, $FE 
      .byte $23, $06, $3A, $FE, $3B, $06, $3B, $FE 
      .byte $4B, $06, $3A, $FE, $63, $06, $3F, $3D 
      .byte $3D, $3D, $3D, $3D, $3D, $3D, $3D, $3D 
      .byte $3D, $3D, $3D, $3D, $3D, $3D, $3E, $FF 
      .byte $23, $05, $11, $00, $0B, $00, $17, $00 
      .byte $0F, $00, $00, $00, $19, $00, $20, $00 
      .byte $0F, $00, $1C, $FF, $78, $94, $83, $94 
      .byte $8E, $94, $9A, $94, $01, $04, $3D, $3D 
      .byte $3D, $3D, $3D, $3D, $3D, $3D, $3D, $3D 
      .byte $3D, $3D, $3D, $3D, $3D, $3D, $3D, $3D 
      .byte $FF, $14, $04, $3D, $3D, $3D, $3D, $3D 
      .byte $3D, $3D, $3D, $3D, $3D, $3D, $3D, $3D 
      .byte $3D, $3D, $3D, $3D, $3D, $3D, $FF, $4F 
      .byte $04, $3B, $FD, $3B, $FD, $3B, $FD, $3B 
      .byte $FD, $3B, $FD, $3B, $FD, $3B, $FD, $3B 
      .byte $FD, $3B, $FD, $3B, $FD, $3B, $FF, $2F 
      .byte $06, $3B, $FD, $3B, $FD, $3B, $FD, $3B 
      .byte $FD, $3B, $FD, $3B, $FD, $3B, $FD, $3B 
      .byte $FD, $3B, $FD, $3B, $FD, $3B, $FF, $D4 
      .byte $07, $3C, $3C, $3C, $3C, $3C, $3C, $3C 
      .byte $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C 
      .byte $3C, $3C, $3C, $3C, $FF, $C1, $07, $3C 
      .byte $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C 
      .byte $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C 
      .byte $3C, $FF, $08, $06, $3A, $FD, $3A, $FD 
      .byte $3A, $FD, $3A, $FD, $3A, $FD, $3A, $FD 
      .byte $3A, $FD, $3A, $FD, $3A, $FD, $3A, $FD 
      .byte $3A, $FF, $28, $04, $3A, $FD, $3A, $FD 
      .byte $3A, $FD, $3A, $FD, $3A, $FD, $3A, $FD 
      .byte $3A, $FD, $3A, $FD, $3A, $FD, $3A, $FD 
      .byte $3A, $FF, $07, $04, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $FF, $19, $04, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $FF 
      .byte $C7, $04, $00, $FD, $00, $FD, $00, $FD 
      .byte $00, $FD, $00, $FF, $A7, $06, $00, $FD 
      .byte $00, $FD, $00, $FD, $00, $FD, $00, $FF 
      .byte $D9, $07, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $FF, $C7, $07, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $FF, $80, $06 
      .byte $00, $FD, $00, $FD, $00, $FD, $00, $FD 
      .byte $00, $FF, $A0, $04, $00, $FD, $00, $FD 
      .byte $00, $FD, $00, $FD, $00, $FF, $01, $04 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $FF, $14, $04, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $FF, $4F, $04, $00, $FD, $00, $FD, $00 
      .byte $FD, $00, $FD, $00, $FD, $00, $FD, $00 
      .byte $FD, $00, $FD, $00, $FD, $00, $FD, $00 
      .byte $FF, $2F, $06, $00, $FD, $00, $FD, $00 
      .byte $FD, $00, $FD, $00, $FD, $00, $FD, $00 
      .byte $FD, $00, $FD, $00, $FD, $00, $FD, $00 
      .byte $FF, $D4, $07, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $FF, $C1 
      .byte $07, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $FF, $08, $06, $00, $FD 
      .byte $00, $FD, $00, $FD, $00, $FD, $00, $FD 
      .byte $00, $FD, $00, $FD, $00, $FD, $00, $FD 
      .byte $00, $FD, $00, $FF, $28, $04, $00, $FD 
      .byte $00, $FD, $00, $FD, $00, $FD, $00, $FD 
      .byte $00, $FD, $00, $FD, $00, $FD, $00, $FD 
      .byte $00, $FD, $00, $FF, $8E, $8A, $8C, $90 
      .byte $93, $8D, $8A, $92, $87, $92, $85 
W9595:
      .byte $1B, $19, $1F, $21, $1F, $17, $1B, $1B 
      .byte $15, $17, $17               
W95A0:
      .byte $0F, $0D, $13, $15, $13, $0B, $0F, $0F 
      .byte $09, $0B, $0B               
W95AB:
      .byte $07
W95AC:
      .byte $EF
W95AD:
      .byte $15, $07, $7D, $15, $06, $4C, $15, $07 
      .byte $7D, $15, $00, $00, $00, $15, $2E, $10 
      .byte $13, $FD, $10, $15, $2E, $10, $16, $70 
      .byte $13, $19, $30, $1E, $10, $CF, $1E, $15 
      .byte $2E, $10, $13, $FD, $10, $15, $2E, $10 
      .byte $16, $70, $13, $19, $30, $1E, $10, $CF 
      .byte $1E, $15, $2E, $10, $13, $FD, $10, $15 
      .byte $2E, $10, $16, $70, $13, $19, $30, $1E 
      .byte $10, $CF, $1E, $15, $2E, $10, $16, $70 
      .byte $10, $15, $2E, $10, $16, $70, $10, $12 
      .byte $DE, $30, $00, $00, $00, $01, $00, $01 
      .byte $00, $02, $80, $02, $80, $04, $40, $04 
      .byte $40, $08, $20, $0F, $E0, $10, $10, $10 
      .byte $10, $00, $00, $00, $00, $00, $40, $00 
      .byte $C0, $01, $40, $02, $40, $04, $40, $08 
      .byte $40, $18, $40, $27, $C0, $40, $40, $00 
      .byte $40, $00, $00, $00, $00, $00, $10, $00 
      .byte $E0, $03, $20, $0C, $20, $30, $40, $C8 
      .byte $40, $04, $80, $02, $80, $01, $00, $01 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $04, $00, $78, $03, $90, $3C, $20, $04 
      .byte $40, $04, $80, $03, $00, $02, $00, $04 
      .byte $00, $00, $00, $00, $00, $00, $00, $3C 
      .byte $00, $07, $80, $04, $70, $04, $0F, $04 
      .byte $70, $07, $80, $3C, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $04, $00, $02 
      .byte $00, $03, $00, $04, $80, $04, $40, $3C 
      .byte $20, $03, $90, $00, $78, $00, $04, $00 
      .byte $00, $00, $00, $01, $00, $01, $00, $02 
      .byte $80, $04, $80, $C8, $40, $30, $40, $0C 
      .byte $20, $03, $20, $00, $E0, $00, $10, $00 
      .byte $00, $00, $00, $00, $40, $40, $40, $27 
      .byte $C0, $18, $40, $08, $40, $04, $40, $02 
      .byte $40, $01, $40, $00, $C0, $00, $40, $00 
      .byte $00, $00, $00, $10, $10, $10, $10, $0F 
      .byte $E0, $08, $20, $04, $40, $04, $40, $02 
      .byte $80, $02, $80, $01, $00, $01, $00, $00 
      .byte $00, $00, $00, $04, $00, $04, $04, $07 
      .byte $C8, $04, $30, $04, $20, $04, $40, $04 
      .byte $80, $05, $00, $06, $00, $04, $00, $00 
      .byte $00, $00, $00, $02, $00, $02, $00, $05 
      .byte $00, $04, $80, $08, $4C, $08, $30, $10 
      .byte $C0, $13, $00, $1C, $00, $20, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $20, $00 
      .byte $40, $00, $C0, $01, $20, $02, $20, $04 
      .byte $3C, $09, $C0, $1E, $00, $20, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $3C, $01, $E0, $0E, $20, $F0 
      .byte $20, $0E, $20, $01, $E0, $00, $3C, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $20 
      .byte $00, $1E, $00, $09, $C0, $04, $3C, $02 
      .byte $20, $01, $20, $00, $C0, $00, $40, $00 
      .byte $20, $00, $00, $00, $00, $20, $00, $1C 
      .byte $00, $13, $00, $10, $C0, $08, $30, $08 
      .byte $4C, $04, $80, $05, $00, $02, $00, $02 
      .byte $00, $00, $00, $00, $00, $04, $00, $06 
      .byte $00, $05, $00, $04, $80, $04, $40, $04 
      .byte $20, $04, $30, $07, $C8, $04, $04, $04 
      .byte $00, $00, $00, $00, $00, $01, $00, $01 
      .byte $00, $02, $80, $02, $80, $04, $40, $04 
      .byte $40, $08, $20, $0F, $E0, $17, $D0, $13 
      .byte $90, $01, $00, $00, $00, $00, $40, $00 
      .byte $C0, $01, $40, $02, $40, $04, $40, $08 
      .byte $40, $18, $40, $2F, $C0, $47, $40, $06 
      .byte $40, $04, $00, $00, $00, $00, $10, $00 
      .byte $E0, $03, $20, $0C, $20, $30, $40, $C8 
      .byte $40, $1C, $80, $1E, $80, $39, $00, $01 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $04, $00, $78, $03, $90, $3C, $20, $04 
      .byte $40, $0C, $80, $1F, $00, $32, $00, $04 
      .byte $00, $00, $00, $00, $00, $00, $00, $3C 
      .byte $00, $07, $80, $1C, $70, $7C, $0F, $1C 
      .byte $70, $07, $80, $3C, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $04, $00, $32 
      .byte $00, $1F, $00, $0C, $80, $04, $40, $3C 
      .byte $20, $03, $90, $00, $78, $00, $04, $00 
      .byte $00, $00, $00, $01, $00, $39, $00, $1E 
      .byte $80, $1C, $80, $C8, $40, $30, $40, $0C 
      .byte $20, $03, $20, $00, $E0, $00, $10, $00 
      .byte $00, $00, $00, $04, $00, $06, $40, $47 
      .byte $40, $2F, $C0, $18, $40, $08, $40, $04 
      .byte $40, $02, $40, $01, $40, $00, $C0, $00 
      .byte $40, $00, $00, $01, $00, $13, $90, $17 
      .byte $D0, $0F, $E0, $08, $20, $04, $40, $04 
      .byte $40, $02, $80, $02, $80, $01, $00, $01 
      .byte $00, $00, $00, $00, $40, $04, $C0, $05 
      .byte $C4, $07, $E8, $04, $30, $04, $20, $04 
      .byte $40, $04, $80, $05, $00, $06, $00, $04 
      .byte $00, $00, $00, $00, $00, $02, $00, $02 
      .byte $70, $05, $E0, $04, $E0, $08, $4C, $08 
      .byte $30, $10, $C0, $13, $00, $1C, $00, $20 
      .byte $00, $00, $00, $00, $00, $00, $20, $00 
      .byte $4C, $00, $F8, $01, $30, $02, $20, $04 
      .byte $3C, $09, $C0, $1E, $00, $20, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $3C, $01, $E0, $0E, $38, $F0 
      .byte $3E, $0E, $38, $01, $E0, $00, $3C, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $20 
      .byte $00, $1E, $00, $09, $C0, $04, $3C, $02 
      .byte $20, $01, $30, $00, $F8, $00, $4C, $00 
      .byte $20, $00, $00, $00, $00, $20, $00, $1C 
      .byte $00, $13, $00, $10, $C0, $08, $30, $08 
      .byte $4C, $04, $E0, $05, $E0, $02, $70, $02 
      .byte $00, $00, $00, $00, $00, $04, $00, $06 
      .byte $00, $05, $00, $04, $80, $04, $40, $04 
      .byte $20, $04, $30, $07, $E8, $05, $C4, $04 
      .byte $C0, $00, $80, $0D, $0F, $13, $11, $0C 
      .byte $0A, $13, $09, $0E, $05, $12
W990B:
      .byte $C8, $C0, $D8, $E0, $D8, $B8, $C8, $C8 
      .byte $B0, $B8, $B8, $B0, $98, $90, $A8, $C8 
      .byte $B8, $80, $D0, $90, $E0, $78, $FF, $FF 
      .byte $FF, $FF, $FF, $FF, $FF, $0C, $18, $30 
      .byte $30, $30, $18, $0C, $00, $30, $18, $0C 
      .byte $0C, $0C, $18, $30, $00, $00, $00, $00 
      .byte $7E, $00, $00, $00, $00, $00, $00, $18 
      .byte $00, $00, $18, $18, $30, $FF, $00, $81 
      .byte $C3, $E7, $FF, $DB, $C3, $FF, $00, $7E 
      .byte $FF, $E6, $E7, $E7, $E7, $FF, $00, $FF 
      .byte $FF, $E0, $E0, $F8, $F8, $FF, $00, $7E 
      .byte $FF, $E7, $E0, $E0, $E0, $FF, $00, $7E 
      .byte $FF, $E7, $E7, $FF, $FF, $FF, $00, $FE 
      .byte $FF, $E7, $E7, $FF, $FE, $E7, $E7, $E7 
      .byte $E7, $FF, $7E, $00, $FF, $E7, $E7, $E7 
      .byte $E7, $E7, $E7, $00, $FF, $E0, $E0, $E0 
      .byte $E0, $FF, $FF, $00, $FF, $00, $00, $00 
      .byte $00, $00, $00, $00, $03, $00, $00, $00 
      .byte $00, $00, $00, $00, $18, $00, $00, $00 
      .byte $00, $00, $00, $00, $C0, $00, $00, $00 
      .byte $C0, $00, $00, $00, $00, $C0, $00, $00 
      .byte $00, $00, $00, $00, $00, $18, $00, $00 
      .byte $00, $00, $00, $00, $00, $03, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $03, $00, $00, $00, $00, $03, $03, $03 
      .byte $03, $03, $03, $03, $03, $C0, $C0, $C0 
      .byte $C0, $C0, $C0, $C0, $C0, $FF, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $FF, $03, $03, $03 
      .byte $03, $03, $03, $03, $FF, $C0, $C0, $C0 
      .byte $C0, $C0, $C0, $C0, $FF, $FF, $03, $03 
      .byte $03, $03, $03, $03, $03, $FF, $C0, $C0 
      .byte $C0, $C0, $C0, $C0, $C0, $C0, $30, $6C 
      .byte $63, $6C, $30, $C0, $00, $E0, $E0, $E0 
      .byte $E7, $FF, $7E, $00, $FF, $00, $00, $04 
      .byte $03, $04, $28, $10, $10, $00, $00, $20 
      .byte $C0, $20, $14, $08, $08     
W9A30:
      .byte $04, $05, $06, $06, $07, $07, $08, $00 
      .byte $10, $10, $28, $04, $03, $04, $00, $00 
      .byte $08, $08, $14, $20, $C0, $20, $00, $00 
W9A48:
      .byte $00
W9A49:
      .byte $99, $8A, $95, $95, $95, $A0, $95, $00 
      .byte $00, $01, $01, $02, $04, $18, $08, $00 
      .byte $00, $20, $E0, $10, $08, $06, $04, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $08 
      .byte $18, $04, $02, $01, $01, $00, $00, $04 
      .byte $06, $08, $10, $E0, $20, $00
W9A77:
      .byte $00
W9A78:
      .byte $08, $09, $0A, $0B, $0C, $0D, $0E, $0F 
      .byte $00, $00, $01, $00, $01, $0A, $04, $04 
      .byte $00, $00, $08, $F0, $08, $05, $02, $02 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $04, $04, $0A, $01, $00, $01, $00, $00 
      .byte $02, $02, $05, $08, $F0, $08, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $01, $06, $02 
      .byte $00, $00, $48, $78, $84, $02, $01, $01 
      .byte $00, $00, $00, $00, $00, $00, $80, $00 
      .byte $02, $06, $01, $00, $00, $00, $00, $00 
      .byte $01, $01, $02, $84, $78, $48, $00, $00 
      .byte $00, $80, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $02, $01, $01 
      .byte $00, $00, $42, $3C, $42, $81, $00, $00 
      .byte $00, $00, $00, $00, $00, $40, $80, $80 
      .byte $01, $01, $02, $00, $00, $00, $00, $00 
      .byte $00, $00, $81, $42, $3C, $42, $00, $00 
      .byte $80, $80, $40, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $01, $00 
      .byte $00, $00, $12, $1E, $21, $40, $80, $80 
      .byte $00, $00, $00, $00, $00, $80, $60, $40 
      .byte $00, $01, $00, $00, $00, $00, $00, $00 
      .byte $80, $80, $40, $21, $1E, $12, $00, $00 
      .byte $40, $60, $80, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $10, $0F, $10, $A0, $40, $40 
      .byte $00, $00, $80, $00, $80, $50, $20, $20 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $40, $40, $A0, $10, $0F, $10, $00, $00 
      .byte $20, $20, $50, $80, $00, $80, $00 
W9B6F:
      .byte $00, $02, $02, $01          
W9B73:
      .byte $01, $05, $04, $03, $02, $00, $00, $04 
      .byte $07, $08, $10, $60, $20, $00, $00, $80 
      .byte $80, $40, $20, $18          
W9B87:
      .byte $10, $06, $05, $04, $03, $02, $00, $00 
      .byte $00, $20, $60, $10, $08, $07, $04, $00 
      .byte $00, $10, $18, $20, $40, $80, $80, $00 
      .byte $00, $00, $00, $04, $03, $04, $28, $10 
      .byte $10, $00, $00, $20, $C0, $20, $14, $08 
      .byte $08, $10, $10, $28, $04, $03, $04, $00 
      .byte $00, $08, $08, $14, $20, $C0, $20, $00 
      .byte $00                         
W9BC0:
      .byte $00
W9BC1:
      .byte $02, $40, $02, $80, $02, $C0, $02, $00 
      .byte $03, $40, $03, $80, $03, $C0, $03, $00 
      .byte $00, $00, $02, $03, $04, $08, $30, $00 
      .byte $00, $00, $40, $C0, $20, $10, $0C, $10 
      .byte $10, $30, $08, $04, $03, $02, $00, $08 
      .byte $08, $0C, $10, $20, $C0, $40, $00 
W9BF0:
      .byte $A5, $0E, $D0, $03, $4C, $15, $83, $4C 
      .byte $D5, $83, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $04, $03, $04, $28 
      .byte $00, $00, $00, $00, $20, $C0, $20, $14 
      .byte $10, $10, $10, $10, $28, $04, $03, $04 
      .byte $08, $08, $08, $08, $14, $20, $C0 
W9C1F:
      .byte $20, $05, $07, $09          
W9C23:
      .byte $0B, $1E, $14, $0F          
W9C27:
      .byte $0A, $10, $0C, $0A          
W9C2B:
      .byte $07, $09, $06, $04, $03, $00, $00, $00 
      .byte $00, $00, $02, $03, $04, $00, $00, $00 
      .byte $00, $00, $40, $C0, $20, $08, $30, $10 
      .byte $10, $30, $08, $04, $03, $10, $0C, $08 
      .byte $08, $0C, $10, $20, $C0, $02, $00, $00 
      .byte $00, $00, $00, $00, $00, $40, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $04, $03, $00, $00, $00 
      .byte $00, $00, $00, $20, $C0, $04, $28, $10 
      .byte $10, $10, $10, $28, $04, $20, $14, $08 
      .byte $08, $08, $08, $14, $20, $03, $04, $00 
      .byte $00, $00, $00, $00, $00, $C0, $20, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $02, $00, $00, $00 
      .byte $00, $00, $00, $00, $40, $03, $04, $08 
      .byte $30, $10, $10, $30, $08, $C0, $20, $10 
      .byte $0C, $08, $08, $0C, $10, $04, $03, $02 
      .byte $00, $00, $00, $00, $00, $20, $C0, $40 
      .byte $00, $00, $00, $00, $00     
W9CC0:
      .byte $78
W9CC1:
      .byte $94, $83, $94, $8E, $94, $9A, $94, $B1 
      .byte $94, $A6, $94, $C8, $94, $BC, $94, $04 
      .byte $03, $04, $28, $10, $10, $10, $10, $20 
      .byte $C0, $20, $14, $08, $08, $08, $08, $28 
      .byte $04, $03, $04, $00, $00, $00, $00, $14 
      .byte $20, $C0, $20, $00, $00, $00
W9CEF:
      .byte $00, $08, $10, $18, $20, $28, $30, $38 
      .byte $40, $48, $50, $58, $60, $68, $70, $78 
      .byte $80, $00, $02, $03, $04, $08, $30, $10 
      .byte $10, $00, $40, $C0, $20, $10, $0C, $08 
      .byte $08, $30, $08, $04, $03, $02, $00, $00 
      .byte $00, $0C, $10, $20, $C0, $40, $00, $00 
      .byte $00, $10, $28, $44, $FE, $00, $00, $00 
      .byte $00, $10, $28, $44, $FE, $44, $28, $10 
      .byte $00, $08, $20, $08, $20, $04, $40, $03 
      .byte $80, $06, $C0, $01, $00, $01, $00, $01 
      .byte $00, $00, $20, $10, $40, $08, $80, $07 
      .byte $80, $06, $C0, $00, $80, $00, $40, $00 
      .byte $20, $01, $00, $01, $00, $01, $00, $02 
      .byte $80, $07, $C0, $02, $80, $04, $40, $08 
      .byte $20, $00, $00, $00, $03, $0C, $08, $10 
      .byte $10, $13, $17, $08, $0C, $03, $00, $00 
      .byte $00, $00, $00, $00, $C0, $30, $10, $08 
      .byte $08, $C8, $E8, $10, $30, $C0, $00, $00 
      .byte $00, $00, $00, $02, $03, $04, $08, $30 
      .byte $10, $13, $37, $08, $04, $03, $02, $00 
      .byte $00, $00, $00, $40, $C0, $20, $10, $0C 
      .byte $08, $C8, $EC, $10, $20, $C0, $40, $00 
      .byte $00                         
W9DA0:
      cmp  #$01                         
      bne  W9DA9                        
      lda  #$08                         
      sta  $A7                          ; Input bit of RS-232/Transient cassette
      rts                               

W9DA9:
      cmp  #$02                         
      bne  W9DBC                        
      lda  #$0F                         
      sta  $A9                          ; RS-232 indicator: Control of starting bit
      lda  #$F2                         
      sta  $D40D                        ; Generator 2: Sustain/Release
      lda  #$21                         
      sta  $D40B                        ; Voice 2: Control registers
      rts                               

W9DBC:
      cmp  #$03                         
      bne  W9DCE                        
      lda  #$81                         
      sta  $D414                        ; Generator 3: Sustain/Release
      sta  $D412                        ; Voice 3: Control registers
      inc  $AB                          ; RS-232 input parity/Cassette short counter
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      rts                               

W9DCE:
      cmp  #$04                         
      bne  W9DDC                        
      lda  #$07                         
      sta  $AA                          ; Buffer for RS-232 input byte/Transient cassette
      lda  #$21                         
      sta  $D404                        ; Voice 1: Control registers
      rts                               

W9DDC:
      cmp  #$05                         
      bne  W9DF4                        
      lda  #$0F                         
      sta  $AC                          ; Pointer: Tape buffer/Screen scrolling
      lda  #$FD                         
      sta  $D414                        ; Generator 3: Sustain/Release
      lda  #$81                         
      sta  $D412                        ; Voice 3: Control registers
      lda  #$20                         
      sta  $D404                        ; Voice 1: Control registers
      rts                               

W9DF4:
      jmp  W9FAB                        

W9DF7:
      .byte $D8, $80, $09, $80, $D8, $80, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $01, $00, $00, $09, $20, $00 
      .byte $05, $40, $00, $00, $00, $00, $1C, $70 
      .byte $00, $00, $00, $00, $05, $40, $00, $09 
      .byte $20, $00, $01, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00                         
W9E30:
      .byte $D4
W9E31:
      .byte $94, $E9, $94, $FF, $94, $17, $95, $45 
      .byte $95, $2F, $95, $72, $95, $5A, $95, $09 
      .byte $20, $00, $49, $24, $00, $25, $48, $00 
      .byte $10, $10, $00, $C0, $06, $00, $20, $08 
      .byte $00, $00, $00, $00, $E0, $0E, $00, $00 
      .byte $00, $00, $20, $08, $00, $C0, $06, $00 
      .byte $10, $10, $00, $25, $48, $00, $49, $24 
      .byte $00, $09, $20, $00, $00, $00, $00 
W9E70:
      .byte $C2
W9E71:
      .byte $93, $D7, $93, $ED, $93, $05, $94, $33 
      .byte $94, $1D, $94, $60, $94, $48, $94, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $10, $00, $00, $92, $00, $02, $54 
      .byte $80, $01, $55, $00, $00, $92, $00, $06 
      .byte $54, $C0, $00, $00, $00, $0F, $C7, $E0 
      .byte $00, $00, $00, $06, $54, $C0, $00, $92 
      .byte $00, $01, $55, $00, $00, $92, $00, $00 
      .byte $10, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $02 
      .byte $10, $80, $21, $11, $08, $11, $11, $10 
      .byte $08, $92, $20, $04, $44, $40, $02, $00 
      .byte $80, $60, $00, $0C, $18, $00, $30, $00 
      .byte $00, $00, $00, $00, $00, $F0, $00, $1E 
      .byte $00, $00, $00, $00, $00, $00, $18, $00 
      .byte $30, $60, $00, $0C, $02, $00, $80, $04 
      .byte $44, $40, $08, $92, $20, $11, $11, $10 
      .byte $21, $11, $08, $02, $10, $80, $00 
W9F00:
      .byte $01, $00, $01, $00, $01, $00, $00, $00 
      .byte $00, $80, $01, $00, $02, $00, $00, $00 
      .byte $00, $80, $01, $00, $02, $00, $00, $00 
      .byte $00, $80, $01, $00, $02, $00, $00, $00 
      .byte $01, $E0, $00, $00, $00, $00, $00, $00 
      .byte $01, $00, $00, $80, $00, $40, $00, $00 
      .byte $01, $00, $00, $80, $00, $40, $00, $00 
      .byte $01, $00, $00, $80, $00, $40, $00, $00 
W9F40:
      lda  $A9                          
      beq  W9F53                        
      asl                               
      asl                               
      asl                               
      sta  $D408                        ; Voice 2: Frequency control (hi byte)
      dec  $A9                          
      bne  W9F53                        
      lda  #$20                         
      sta  $D40B                        ; Voice 2: Control registers
W9F53:
      lda  $AA                          
      beq  W9F66                        
      asl                               
      asl                               
      asl                               
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      dec  $AA                          
      bne  W9F66                        
      lda  #$20                         
      sta  $D404                        ; Voice 1: Control registers
W9F66:
      lda  $AC                          
      beq  W9F70                        
      lda  $D003                        ; Position Y sprite 1
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
W9F70:
      lda  $AC                          
      ora  $AA                          
      bne  W9FAA                        
      lda  $8C                          
      ora  $8D                          
      cmp  #$02                         
      bcc  W9F80                        
      dec  $A8                          ; RS-232 input bits counter/Transient cassette
W9F80:
      dec  $A8                          ; RS-232 input bits counter/Transient cassette
      bpl  W9FAA                        
      ldx  #$21                         
      stx  $D404                        ; Voice 1: Control registers
      dex                               
      ldy  $A7                          
      inc  $A7                          
      inc  $A7                          
      inc  $A7                          
      lda  W95AD,y                      
      sta  $A8                          
      lda  W95AC,y                      
      sta  $D400                        ; Voice 1: Frequency control (lo byte)
      lda  W95AB,y                      
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      bne  W9FAA                        
      sta  $A7                          
      stx  $D404                        ; Voice 1: Control registers
W9FAA:
      rts                               

W9FAB:
      cmp  #$83                         
      bne  W9FBD                        
      lda  #$00                         
      sta  $AB                          
      lda  $AC                          
      bne  W9FBC                        
      lda  #$80                         
      sta  $D412                        ; Voice 3: Control registers
W9FBC:
      rts                               

W9FBD:
      cmp  #$85                         
      bne  W9FD6                        
W9FC1:
      lda  #$80                         
      sta  $D412                        ; Voice 3: Control registers
      lda  #$20                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $D40B                        ; Voice 2: Control registers
      lda  #$00                         
      sta  $AC                          
      sta  $AA                          
      sta  $A9                          
W9FD6:
      rts                               

W9FD7:
      .byte $FE, $FE, $FE, $FF, $00, $01, $02, $02 
      .byte $02, $02, $02, $01, $00, $FF, $FE, $FE 
W9FE7:
      .byte $00, $01, $02, $02, $02, $02, $02, $01 
      .byte $00, $FF, $FE, $FE, $FE, $FE, $FE, $FF 
W9FF7:
      .byte $01, $02, $04, $08, $10, $20, $40 
W9FFE:
      .byte $80, $2A                    
