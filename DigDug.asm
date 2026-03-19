;=============================================================================
; Dig Dug (1983, Atari)
;  
; Source in Dasm format
; To compile:
; a) dasm digdug.asm -odigdug.bin -f3
; b) cartconv -t normal -i digdug.bin -o digdug.crt
;=============================================================================

      processor 6502

      .org $8000

W8000:
      .word $8009
      .word $803C
      .byte $C3, $C2, $CD, $38, $30     ; CBM80
      lda  #$00                         
      sta  $D016                        ; VIC control register
      jsr  $FF84                        ; Routine: I/O initialization
      jsr  $FF87                        ; Routine: Initializes RAM/ creates tape buffer /Screen case 0x0400
      jsr  $FF8A                        ; Routine: Reset default I/O vector
      jsr  $FF81                        ; Routine: Initialize screen editor
      lda  #$3C                         
      sta  $0318                        ; Vector: Not maskerable Interrupt (NMI)
      lda  #$80                         
      sta  $0319                        ; Vector: Not maskerable Interrupt (NMI)
      sei                               
      lda  $01                          ; 6510 I/O register
      and  #$FB                         
      sta  $01                          ; 6510 I/O register
      ldy  #$2B                         
      jsr  W9AD1                        
      ldx  #$04                         
      jsr  W9ABD                        
      lda  $01                          ; 6510 I/O register
      ora  #$04                         
      sta  $01                          ; 6510 I/O register
      cli                               
W803C:
      lda  #$2B                         
      sta  $D011                        ; VIC control register
      lda  $DD02                        ; Data direction register port A #2
      ora  #$03                         
      sta  $DD02                        ; Data direction register port A #2
      lda  #$96                         
      sta  $DD00                        ; Data port A #2: serial bus, RS-232, VIC memory
      lda  #$00                         
      sta  $DC0E                        ; Control register A of CIA #1
      jsr  WA711                        
      lda  #$00                         
      sta.w  $00FA                        
      sta  $FB                          
      sta  $FC                          
      lda  #$0B                         
      jsr  WBA0E                        
      lda  #$0C                         
      jsr  WBA0E                        
      lda  #$0D                         
      jsr  WBA0E                        
      lda  #$2B                         
      sta  $D011                        ; VIC control register
      lda  #$18                         
      sta  $D016                        ; VIC control register
      sta  $D018                        ; VIC memory control register
      sta  $BA                          
      jsr  W89BE                        
      jsr  W9CB9                        
      jmp  WA094                      

W8086:
      lda  #$00                         
      sta  $3F                          
      sta  $88                          
      sta  $83                          
      sta  $89                          
      sta  $3B                          
      sta  $59                          
      sta  $6D                          
      sta  $55                          
      sta  $45                          
      sta  $54                          
      sta  $5D                          
      sta  $BB                          
      sta  $BC                          
      sta  $9A                          
      inc  $9A                          
      jsr  W87E3                        
      lda  #$08                         
      jsr  WBA0E                        
      lda  #$09                         
      jsr  WBA0E                        
      lda  #$0D                         
      jsr  WBA0E                        
      lda  #$3C                         
      sta  $60                          
W80BC:
      sei                               
      lda  #$7F                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      and  #$10                         
      bne  W80CD                        
      lda  #$80                         
      sta  $47                          
W80CD:
      lda  #$FF                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      and  #$1F                         
      cmp  #$1F                         
      beq  W80DF                        
      lda  #$00                         
      sta  $47                          
W80DF:
      cli                               
      bit  $47                          
      bpl  W80EB                        
      lda  #$00                         
      sta  $C01F                        
      beq  W80BC                        
W80EB:
      lda  #$3B                         
      sta  $C01F                        
      jsr  W99A2                      
      lda  $88                          
      beq  W80FE                        
      lda  #$00                         
      sta  $88                          
      jsr  W8211                        
W80FE:
      lda  $58                          
      bne  W810E                        
      lda  #$01                         
      sta  $3B                          
      ldx  #$FF                         
      jsr  W9AB5                        
      jmp  WA0AF                        

W810E:
      lda  $59                          
      beq  W8117                        
      sta  $3B                          
      jmp  WB894                        

W8117:
      lda  $6D                          
      beq  W811E                        
      jmp  W80BC                        

W811E:
      jsr  W96D1                        
      lda  $2B                          
      bne  W8128                        
      jmp  W81C6                        

W8128:
      lda  $D010                        ; Position X MSB sprites 0..7
      and  #$80                         
      bne  W8181                        
      lda  $D00F                        ; Position Y sprite 7
      cmp  $C01E                        
      bne  W8181                        
      lda  $C01D                        
      cmp  $C01E                        
      beq  W8181                        
      lda  $D00E                        ; Position X sprite 7
      cmp  $C05E                        
      bne  W8181                        
      sec                               
      sbc  #$08                         
      sta  $C05E                        
      lda  #$8E                         
      sta  $C01D                        
      lda  $48                          
      sta  $41                          
      cmp  #$10                         
      bcc  W8161                        
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      inc  $C11D                        
W8161:
      clc                               
      adc  #$75                         
      sta  $C11E                        
      lda  #$00                         
      sta  $C0DE                        
      sta  $40                          
      jsr  W996F                        
      jsr  W99A2                      
      lda  #$02                         
      jsr  WBA0E                        
      lda  #$3C                         
      sta  $5D                          
      lda  #$02                         
      sta  $5E                          
W8181:
      lda  $5D                          
      bpl  W8199                        
      lda  $5E                          
      bmi  W8191                        
      dec  $5E                          
      lda  #$3C                         
      sta  $5D                          
      bne  W8199                        
W8191:
      lda  #$00                         
      sta  $C01E                        
      sta  $C01D                        
W8199:
      lda  $2B                          
      cmp  #$05                         
      beq  W81A8                        
      jsr  W8211                        
      jsr  W98D7                        
      jmp  W81ED                        

W81A8:
      lda  $88                          
      bne  W81BC                        
      ldy  $2D                          
      dey                               
      tya                               
      asl                               
      asl                               
      tay                               
      iny                               
      sty  $47FF                        
      lda  #$06                         
      jsr  WBA0E                        
W81BC:
      jsr  W84A0                        
      lda  $83                          
      bne  W81C6                        
      jsr  W8244                        
W81C6:
      lda  $47FF                        
      cmp  #$10                         
      bmi  W81D0                        
      jsr  W8244                        
W81D0:
      lda  #$00                         
      sta  $2C                          
      lda  $60                          
      bne  W81EA                        
      lda  $9A                          
      bmi  W81EA                        
      eor  #$FF                         
      sta  $9A                          
      lda  #$0A                         
      jsr  WBA0E                        
      lda  #$0C                         
      jsr  WBA0E                        
W81EA:
      jmp  W80BC                        

W81ED:
      lda  #$02                         
      clc                               
      adc  $BC                          
      sta  $5B                          
W81F4:
      lda  $5B                          
      bne  W81F4                        
      lda  #$3C                         
      sta  $60                          
      lda  $9A                          
      bpl  W820E                        
      eor  #$FF                         
      sta  $9A                          
      lda  #$08                         
      jsr  WBA0E                        
      lda  #$09                         
      jsr  WBA0E                        
W820E:
      jmp  W80BC                        

W8211:
      lda  $83                          
      bne  W8216                        
      rts                               

W8216:
      jsr  W8244                        
      lda  #$00                         
      sta  $83                          
      jsr  W823C                      
      cpy  #$08                         
      bcc  W8227                        
      inc  $D021                        
W8227:
      lda  W8234,y                      
      sta  $19                          
      lda  W8234+1,y                    
      sta  $1A                          
      jmp  ($0019)                      
W8234:
      .byte $99, $85, $25, $85, $AF, $87, $E1, $86
W823C:
      lda  $2D                          
      sec                        
      sbc  #$01
      asl                      
      tay                               
      rts                               
W8244:
      ldy  $2D                          
      dey                               
      cpy  #$02                         
      bmi  W8252                        
      iny                               
      tya                               
      and  #$03                         
      ora  #$02                         
      tay                               
W8252:
      tya                               
      asl                               
      asl                               
      clc                               
      adc  #$20                         
      sta  $47FF                        
      lda  #$00                         
      sta  $2C                          
      rts                               

      jsr  W991D                        
      ldy  #$01                         
      jsr  W8353                        
      jsr  W8418                        
      jsr  W8435                        
      jsr  W9707                        
      lda  $09                          
      beq  W8286                        
      jsr  W9936                      
      lda  $47FF                        
      cmp  #$22                         
      bpl  W8282                        
      jsr  W8461                        
W8282:
      jsr  W9742                        
      rts                               

W8286:
      lda  $47FF                        
      cmp  #$22                         
      bmi  W8290                        
      jsr  W846C                        
W8290:
      jsr  W9742                        
      rts                               

W8294:
      jsr  W991D                        
      ldy  #$02                         
      jsr  W8353                        
      jsr  W8418                        
      jsr  W8477                        
      jsr  W9701                        
      lda  $09                          
      beq  W82BA                        
      jsr  W9936                      
      lda  $47FF                        
      cmp  #$26                         
      bpl  W82B6                        
      jsr  W8461                        
W82B6:
      jsr  W9755                        
      rts                               

W82BA:
      lda  $47FF                        
      cmp  #$26                         
      bmi  W82C4                        
      jsr  W846C                        
W82C4:
      jsr  W9755                        
      rts                               

      jsr  W98C1                        
      ldy  #$04                         
      jsr  W8353                        
      jsr  W8418                        
      lda  $D00F                        ; Position Y sprite 7
      cmp  #$41                         
      bne  W82E1                        
      lda  #$01                         
      sta  $2B                          
      jsr  W98D5                        
W82E1:
      jsr  W836A                        
      lda  $09                          ; Screen column after last TAB
      bne  W8303                        
      dec  $D00F                        ; Position Y sprite 7
      jsr  W97E7                        
      lda  $09                          ; Screen column after last TAB
      beq  W8303                        
      jsr  W9936                      
      lda  $47FF                        
      cmp  #$2A                         
      bpl  W82FF                        
      jsr  W8461                        
W82FF:
      jsr  W97FD                        
      rts                               

W8303:
      lda  $47FF                        
      cmp  #$2A                         
      bmi  W830D                        
      jsr  W846C                        
W830D:
      jsr  W97FD                        
      rts                               

W8311:
      jsr  W98C1                        
      ldy  #$03                         
      jsr  W8353                        
      jsr  W8418                        
      lda  $D00F                        ; Position Y sprite 7
      cmp  #$DB                         
      beq  W832D                        
      jsr  W8381                        
      lda  $09                          ; Screen column after last TAB
      bne  W832D                        
      inc  $D00F                        ; Position Y sprite 7
W832D:
      jsr  W97E3                      
      lda  $09                          
      beq  W8345                        
      jsr  W9936                      
      lda  $47FF                        
      cmp  #$2E                         
      bpl  W8341                        
      jsr  W8461                        
W8341:
      jsr  W980C                        
      rts                               

W8345:
      lda  $47FF                        
      cmp  #$2E                         
      bmi  W834F                        
      jsr  W846C                        
W834F:
      jsr  W980C                        
      rts                               

W8353:
      cpy  $2D                          
      php                               
      sty  $2D                          
      plp                               
      beq  W8365                        
      lda  W8365,y                      
      sta  $47FF                        
      lda  #$00                         
      sta  $2C                          
W8365:
      rts                               

      jsr  $2C24                        
      plp                               
W836A:
      jsr  W8411                        
W836D:
      lda  $C000,x                      
      clc                               
      adc  #$0D                         
      cmp  $D00F                        ; Position Y sprite 7
      bne  W837B                        
      jsr  W8398                        
W837B:
      inx                               
      cpx  #$07                         
      bne  W836D                        
      rts                               

W8381:
      jsr  W8411                        
      lda  $D00F                        ; Position Y sprite 7
      clc                               
      adc  #$09                         
W838A:
      cmp  $C000,x                      
      bne  W8392                        
      jsr  W8398                        
W8392:
      inx                               
      cpx  #$07                         
      bne  W838A                        
      rts                               

W8398:
      pha                               
      lda  $D00E                        ; Position X sprite 7
      cmp  $C040,x                      
      bne  W83A3                        
      inc  $09                          
W83A3:
      pla                               
      rts                               

W83A5:
      jsr  W8411                        
W83A8:
      jsr  W9A41                        
      sta  $19                          
      lda  $C040,x                      
      clc                               
      adc  #$16                         
      bcc  W83BA                        
      lda  #$01                         
      jmp  W83BD                        

W83BA:
      lda  $C080,x                      
W83BD:
      cmp  $19                          
      bne  W83CF                        
      lda  $C040,x                      
      clc                               
      adc  #$16                         
      cmp  $D00E                        ; Position X sprite 7
      bne  W83CF                        
      jsr  W8401                        
W83CF:
      inx                               
      cpx  #$07                         
      bne  W83A8                        
      rts                               

W83D5:
      jsr  W8411                        
W83D8:
      lda  $D00E                        ; Position X sprite 7
      clc                               
      adc  #$16                         
      bcc  W83E5                        
      lda  #$01                         
      jmp  W83E8                        

W83E5:
      jsr  W9A41                        
W83E8:
      cmp  $C080,x                      
      bne  W83FB                        
      lda  $D00E                        ; Position X sprite 7
      clc                               
      adc  #$16                         
      cmp  $C040,x                      
      bne  W83FB                        
      jsr  W8401                        
W83FB:
      inx                               
      cpx  #$07                         
      bne  W83D8                        
      rts                               

W8401:
      pha                               
      lda  $C000,x                      
      clc                               
      adc  #$02                         
      cmp  $D00F                        ; Position Y sprite 7
      bne  W840F                        
      inc  $09                          
W840F:
      pla                               
      rts                               

W8411:
      lda  #$00                         
      sta  $09                          
      ldx  #$02                         
      rts                               

W8418:
      inc  $2C                          
      lda  $2C                          
      cmp  #$02                         
      bne  W8426                        
      inc  $47FF                        
      jmp  W8431                        

W8426:
      cmp  #$04                         
      bne  W8431                        
      dec  $47FF                        
      lda  #$00                         
      sta  $2C                          
W8431:
      rts                               

W8432:
      jmp  W8432                        

W8435:
      lda  $D010                        ; Position X MSB sprites 0..7
      and  #$80                         
      beq  W8446                        
      lda  $D00E                        ; Position X sprite 7
      cmp  #$3C                         
      bmi  W8446                        
      jmp  W8460                        

W8446:
      jsr  W83D5                        
      lda  $09                          
      bne  W8460                        
W844D:
      inc  $D00E                        ; Position X sprite 7
      inc  $D00E                        ; Position X sprite 7
      lda  $D00E                        ; Position X sprite 7
      bne  W8460                        
      lda  $D010                        ; Position X MSB sprites 0..7
      ora  #$80                         
      sta  $D010                        ; Position X MSB sprites 0..7
W8460:
      rts                               

W8461:
      lda  #$01                         
      sta  $BC                          
      inc  $47FF                        
      inc  $47FF                        
      rts                               

W846C:
      lda  #$00                         
      sta  $BC                          
      dec  $47FF                        
      dec  $47FF                        
      rts                               

W8477:
      lda  $D010                        ; Position X MSB sprites 0..7
      and  #$80                         
      bne  W8485                        
      lda  $D00E                        ; Position X sprite 7
      cmp  #$1E                         
      beq  W849F                        
W8485:
      jsr  W83A5                        
      lda  $09                          
      bne  W849F                        
      lda  $D00E                        ; Position X sprite 7
      bne  W8499                        
      lda  $D010                        ; Position X MSB sprites 0..7
      and  #$7F                         
      sta  $D010                        ; Position X MSB sprites 0..7
W8499:
      dec  $D00E                        ; Position X sprite 7
      dec  $D00E                        ; Position X sprite 7
W849F:
      rts                               

W84A0:
      lda  $83                          
      beq  W84A5                        
      rts                               

W84A5:
      jsr  W9A13                        
      lda  $15                          
      clc                               
      adc  #$04                         
      sta  $15                          
      sta  $8C                          
      jsr  W823C                      
      lda  W84C1,y                      
      sta  $23                          
      lda  W84C1+1,y                    
      sta  $24                          
      jmp  ($0023)                      

W84C1:
      bmi  W8446+2                      
      cmp  #$84                         
      eor  W8887                        
      stx  $A5                          
      rla  $85                          
      stx  $16A4                        
      sty  $8D                          
      iny                               
      sty  $8F                          
      tya                               
      sec                               
      sbc  #$09                         
      sta  $33                          
      lda  $15                          
      sta  $82                          
W84DE:
      lda  $8E                          
      sta  $27                          
      tay                               
      lda  W87F4,y                      
      sta  $85                          
      lda  W87F5,y                      
      sta  $86                          
      lda  $8D                          
      sta  $16                          
      ldx  #$00                         
      jsr  W85CF                        
W84F6:
      inx                               
      inc  $16                          
      lda  $16                          
      cmp  $8F                          
      beq  W8505                        
      jsr  W8661                        
      jmp  W84F6                        

W8505:
      jsr  W85A4                        
      lda  $8D                          
      cmp  $33                          
      bne  W84DE                        
W850E:
      jsr  W87D1+2                      
      ldx  #$00                         
      jsr  W85CF                        
W8516:
      lda  $16                          
      cmp  $8F                          
      beq  W8524                        
      inc  $16                          
      jsr  W8661                        
      jmp  W8516                        

W8524:
      rts                               

      lda  $83                          
      beq  W852A                        
      rts                               

W852A:
      jsr  W85B2                        
      jmp  W850E                        

      lda  $27                          
      clc                               
      adc  #$04                         
      cmp  #$08                         
      bmi  W853D                        
      inc  $16                          
      and  #$07                         
W853D:
      sta  $27                          
      sta  $8E                          
      ldy  $16                          
      iny                               
      sty  $8F                          
      iny                               
      sty  $8D                          
      tya                               
      adc  #$08                         
      sta  $33                          
      lda  $15                          
      sta  $82                          
W8552:
      lda  $8E                          
      sta  $27                          
      tay                               
      lda  W87EC,y                      
      sta  $85                          
      lda  W87ED,y                      
      sta  $86                          
      lda  $8D                          
      sta  $16                          
      ldx  #$00                         
      jsr  W85CF                        
W856A:
      inx                               
      dec  $16                          
      lda  $16                          
      cmp  $8F                          
      beq  W8579                        
      jsr  W8661                        
      jmp  W856A                        

W8579:
      jsr  W85B2                        
      lda  $8D                          
      cmp  $33                          
      bne  W8552                        
W8582:
      jsr  W87D1+2                      
      ldx  #$00                         
      jsr  W85CF                        
W858A:
      lda  $16                          
      cmp  $8F                          
      beq  W8598                        
      dec  $16                          
      jsr  W8661                        
      jmp  W858A                        

W8598:
      rts                               

      lda  $83                          
      beq  W859E                        
      rts                               

W859E:
      jsr  W85A4                        
      jmp  W8582                        

W85A4:
      lda  $8E                          
      sec                               
      sbc  #$02                         
      bcs  W85AF                        
      dec  $8D                          
      lda  #$06                         
W85AF:
      sta  $8E                          
      rts                               

W85B2:
      lda  $8E                          
      clc                               
      adc  #$02                         
      cmp  #$08                         
      bmi  W85BF                        
      inc  $8D                          
      and  #$07                         
W85BF:
      sta  $8E                          
      rts                               

W85C2:
      txa                               
      asl                               
      tay                               
      lda  ($85),y                      
      sta  $28                          
      iny                               
      lda  ($85),y                      
      sta  $29                          
      rts                               

W85CF:
      jsr  W85C2                        
      lda  #$00                         
      sta  $0A                          
W85D6:
      jsr  W9C6B                        
      lda  $8E                          
      lsr                               
      tay                               
      lda  $2D                          
      cmp  #$01                         
      bne  W85E9                        
      lda  W867C,y                      
      jmp  W85EC                        

W85E9:
      lda  W8680,y                      
W85EC:
      sta  $87                          
      lda  #$FC                         
      cmp  $85                          
      bne  W85FB                        
      lda  #$00                         
      sta  $36                          
      jmp  W861E                        

W85FB:
      lda  $83                          
      beq  W8611                        
      lda  $2D                          
      cmp  #$02                         
      bne  W860B                        
      jsr  W85A4                        
      jmp  W8628                        

W860B:
      jsr  W85B2                        
      jmp  W8628                        

W8611:
      lda  $16                          
      sta  $80                          
      lda  $8E                          
      sta  $81                          
      lda  W8684,y                      
      sta  $36                          
W861E:
      ldy  #$00                         
      lda  ($0F),y                      
      pha                               
      and  $36                          
      beq  W8641+1                      
      pla                               
W8628:
      pla                               
      pla                               
      lda  $2D                          
      sec                               
      sbc  #$01                         
      asl                               
      tay                               
      lda  W863E,y                      
      sta  $23                          
      lda  W863E+1,y                    
      sta  $24                          
      jmp  ($0023)                      

W863E:
      sta  $2585,y                      
W8641:
      sta  $68                          
      and  $87                          
      ldy  $0A                          
      ora  ($28),y                      
      jsr  W8654                        
      bpl  W8651                        
      jmp  W85D6                        

W8651:
      jmp  W8674                        

W8654:
      ldy  #$00                         
      sta  ($0F),y                      
      inc  $15                          
      inc  $0A                          
      lda  $0A                          
      cmp  #$05                         
      rts                               

W8661:
      jsr  W85C2                        
      lda  #$00                         
      sta  $0A                          
W8668:
      jsr  W9C6B                        
      ldy  $0A                          
      lda  ($28),y                      
      jsr  W8654                        
      bmi  W8668                        
W8674:
      lda  $15                          
      sec                               
      sbc  #$05                         
      sta  $15                          
      rts                               

W867C:                                  
      .byte $3F, $0F, $03, $00          
W8680:
      .byte $00, $C0, $F0, $FC          
W8684:
      .byte $C0, $30, $0C, $03, $E6, $16, $A5, $16 
      .byte $85, $8C, $A5, $15, $85, $8F, $38, $E9 
      .byte $03, $85, $8D, $85, $15, $E9, $1F, $85 
      .byte $33, $20, $21, $87          
W86A0:
      .byte $A9
      brk                               
      sta  $0A                          
W86A4:
      jsr  W9C6B                        
      lda  $83                          
      beq  W86AE                        
      jmp  W86E1                        

W86AE:
      ldy  #$08                         
      lda  ($0F),y                      
      pha                               
      lda  $0A                          
      bne  W86C3                        
      pla                               
      pha                               
      and  $36                          
      beq  W86C3                        
      pla                               
      inc  $8D                          
      jmp  W86E1                        

W86C3:
      pla                               
      jsr  W86FD                        
      inc  $0A                          
      inc  $15                          
      lda  $15                          
      cmp  $8F                          
      bne  W86A4                        
      dec  $8D                          
      lda  $8D                          
      sta  $15                          
      sta  $82                          
      cmp  #$0E                         
      beq  W86E1                        
      cmp  $33                          
      bne  W86A0                        
W86E1:
      lda  $8C                          
      sta  $16                          
      lda  $8D                          
      sta  $15                          
      lda  $83                          
      beq  W86EE                        
      rts                               

W86EE:
      jsr  W8710                        
      inc  $15                          
      lda  $15                          
      cmp  $8F                          
      bne  W86EE                        
      jsr  W87E3                        
      rts                               

W86FD:
      and  $87                          
      ldy  $0A                          
      ora  ($28),y                      
      ldy  #$08                         
      sta  ($0F),y                      
      ldy  $0A                          
      lda  ($85),y                      
      ldy  #$00                         
      sta  ($0F),y                      
      rts                               

W8710:
      jsr  W9C6B                        
      lda  #$00                         
      tay                               
      sta  ($0F),y                      
      ldy  #$08                         
      lda  ($0F),y                      
      and  $87                          
      sta  ($0F),y                      
      rts                               

W8721:
      ldy  $27                          
      lda  W87FE,y                      
      sta  $85                          
      lda  W87FF,y                      
      sta  $86                          
      lda  W8806,y                      
      sta  $28                          
      lda  W8807,y                      
      sta  $29                          
      tya                               
      lsr                               
      tay                               
      lda  W87CB,y                      
      sta  $87                          
      lda  W87CF,y                      
      sta  $36                          
      lda  $16                          
      sta  $80                          
      lda  $27                          
      sta  $81                          
      rts                               

      inc  $16                          
      lda  $16                          
      sta  $8C                          
      lda  $15                          
      clc                               
      adc  #$05                         
      sta  $8F                          
      adc  #$03                         
      sta  $8D                          
      sta  $15                          
      cmp  #$B4                         
      bcc  W8765                        
      rts                               

W8765:
      adc  #$1F                         
      sta  $33                          
      jsr  W8721                        
W876C:
      lda  #$24                         
      sta  $0A                          
W8770:
      jsr  W9C6B                        
      lda  $83                          
      beq  W877A                        
      jmp  W87AF                        

W877A:
      ldy  #$08                         
      lda  ($0F),y                      
      pha                               
      lda  $0A                          
      cmp  #$24                         
      bne  W8791                        
      pla                               
      pha                               
      and  $36                          
      beq  W8791                        
      pla                               
      dec  $8D                          
      jmp  W87AF                        

W8791:
      pla                               
      jsr  W86FD                        
      dec  $0A                          
      dec  $15                          
      lda  $15                          
      cmp  $8F                          
      bne  W8770                        
      inc  $8D                          
      lda  $8D                          
      sta  $15                          
      sta  $82                          
      cmp  #$B9                         
      beq  W87AF                        
      cmp  $33                          
      bne  W876C                        
W87AF:
      lda  $8C                          
      sta  $16                          
      lda  $8D                          
      sta  $15                          
      lda  $83                          
      beq  W87BC                        
      rts                               

W87BC:
      jsr  W8710                        
      dec  $15                          
      lda  $15                          
      cmp  $8F                          
      bne  W87BC                        
      jsr  W87E3                        
      rts                               

W87CB:
      .byte $0F, $03, $00, $00          
W87CF:
      .byte $F0, $FC                    
W87D1:
      .byte $FF, $FF                    
      lda  #$FC                         
      sta  $85                          
      lda  #$87                         
      sta  $86                          
      lda  $8C                          
      sta  $15                          
      lda  $8D                          
      sta  $16                          
W87E3:
      lda  #$00                         
      sta  $80                          
      sta  $82                          
      sta  $81                          
      rts                               

W87EC:
      .byte $B4
W87ED:
      .byte $07, $C6, $07, $D8, $07, $A2, $07 
W87F4:
      .byte $5A
W87F5:
      .byte $07, $6C, $07, $7E, $07, $90, $07, $00 
      .byte $04                         
W87FE:
      .byte $82
W87FF:
      .byte $04, $CC, $04, $16, $05, $60, $05 
W8806:
      .byte $A7
W8807:
      .byte $04, $F1, $04, $3B, $05, $85, $05, $10 
      .byte $02, $10, $03, $40, $03, $10, $03, $40 
      .byte $03, $40, $01, $50, $01, $40, $01, $50 
      .byte $01, $50, $61, $70, $61, $50, $61, $70 
      .byte $61, $70, $21, $00, $21, $70, $21, $15 
      .byte $61, $17, $01, $17, $21, $10, $61, $10 
      .byte $31, $40, $21, $40, $11, $50, $31, $11 
      .byte $13, $11, $18, $60, $00, $61, $11, $32 
      .byte $31, $11, $00, $00, $01, $13, $26, $23 
      .byte $31, $00, $00, $01, $12, $60, $62, $11 
      .byte $00, $00, $01, $85, $70, $75, $18, $00 
      .byte $00, $03, $14, $57, $54, $11, $00, $00 
      .byte $01, $11, $45, $41, $11, $00, $00, $03 
      .byte $11, $14, $11, $11, $70, $00, $71, $FF 
      .byte $01, $11, $11, $02, $11, $11, $12, $30 
      .byte $33, $33, $04, $44, $44, $42, $65, $50 
W8887:
      .byte $11, $62, $11, $75, $57, $65, $50, $55 
      .byte $62, $11, $21, $12, $53, $01, $65, $52 
      .byte $28, $87, $22, $61, $16, $55, $67, $55 
      .byte $71, $12, $30, $16, $11, $02, $55, $79 
      .byte $12, $65, $55, $30, $07, $11, $24, $55 
      .byte $01, $10, $11, $02, $11, $21, $12, $01 
      .byte $16, $55, $02, $11, $71, $24, $61, $16 
      .byte $61, $17, $11, $74, $21, $61, $11, $11 
      .byte $67, $11, $11, $17, $11, $11, $11, $01 
      .byte $11, $11, $12, $11, $66, $11, $11, $11 
      .byte $77, $19, $61, $11, $11, $62, $71, $11 
      .byte $72, $61, $16, $11, $17, $11, $75, $55 
      .byte $FF, $00, $00, $03, $49, $43, $00, $01 
      .byte $86, $32, $10, $A3, $60, $00, $06, $00 
      .byte $2A, $5B, $20, $00, $65, $72, $10, $01 
      .byte $23, $60, $06, $76, $01, $1A, $CD, $00 
      .byte $63, $A8, $10, $00, $01, $23, $66, $78 
      .byte $76, $00, $12, $70, $63, $21, $56, $00 
      .byte $00, $01, $27, $00, $10, $03, $78, $E3 
      .byte $24, $94, $26, $67, $FD, $01, $A1, $01 
      .byte $A5, $A1, $25, $92, $10, $00, $12, $36 
      .byte $66, $32, $10, $00, $12, $36, $66, $32 
      .byte $10, $00, $12, $95, $20, $06, $00, $66 
      .byte $60, $00, $00, $00, $00, $66, $60, $00 
      .byte $00, $00, $00, $66, $60, $06, $00, $1A 
      .byte $51, $00, $00, $01, $23, $33, $21, $00 
      .byte $00, $01, $23, $33, $21, $00, $00, $01 
      .byte $5A, $10, $67, $06, $33, $36, $00, $00 
      .byte $00, $06, $33, $36, $00, $00, $00, $06 
      .byte $33, $36, $07, $60, $01, $A0, $00, $00 
      .byte $00, $12, $22, $10, $00, $00, $00, $12 
      .byte $22, $10, $00, $00, $00, $A1, $06, $78 
      .byte $63, $22, $23, $60, $00, $00, $63, $22 
      .byte $23, $60, $00, $00, $63, $22, $23, $68 
      .byte $76, $00, $10, $00, $00, $00, $01, $11 
      .byte $00, $00, $00, $00, $01, $11, $00, $00 
      .byte $00, $00, $10, $03, $89, $32, $11, $12 
      .byte $36, $00, $06, $32, $11, $12, $36, $00 
      .byte $06, $32, $11, $12, $39, $83, $FF 
W89BE:
      ldy  #$00                         
      jsr  W9AE6                        
      ldy  #$33                         
      jsr  W8B25                        
      lda  #$21                         
      sta  $18                          
W89CC:
      ldy  $18                          
      cpy  #$25                         
      beq  W89D9                        
      jsr  W9436                        
      inc  $18                          
      bne  W89CC                        
W89D9:
      lda  #$02                         
      sta  $BE                          
W89DD:
      ldy  $BE                          
      jsr  W8C36                        
      dec  $BE                          
      bpl  W89DD                        
      ldy  #$04                         
      jsr  W9AE6                        
      ldy  #$38                         
      jsr  WA7A5                        
      ldy  #$34                         
      jsr  W8B25                        
      ldy  #$35                         
      jsr  W8B25                        
      jmp  W8AE5+2                      

      .byte $AA, $69, $50, $60, $A6, $99, $A9, $6A 
      .byte $5A, $A5, $0A, $2A, $00, $EB, $9A, $59 
      .byte $00, $CB, $AA, $00, $AA, $80, $96, $A0 
      .byte $69, $A0, $69, $A0, $69, $A0, $69, $A0 
      .byte $69, $A0, $96, $A0, $AA, $80, $AA, $00 
      .byte $00, $EB, $AA, $AA, $80, $AA, $AA, $A0 
      .byte $96, $A5, $A8, $69, $9A, $68, $69, $9A 
      .byte $68, $69, $9A, $68, $69, $9A, $68, $69 
      .byte $9A, $68, $96, $A5, $A8, $AA, $AA, $A0 
      .byte $AA, $AA, $80, $CD, $A0, $0B, $00, $07 
      .byte $86, $14, $01, $40, $14, $01, $40, $14 
      .byte $68, $8B, $00, $A0, $0C, $DA, $00, $B0 
      .byte $06, $78, $45, $40, $54, $01, $46, $64 
      .byte $46, $49, $88, $B0, $0A, $00, $CD, $A0 
      .byte $0B, $00, $67, $84, $54, $05, $40, $14 
      .byte $05, $44, $54, $68, $8B, $00, $A0, $0C 
      .byte $DA, $00, $B0, $04, $E8, $45, $44, $54 
      .byte $9F, $40, $54, $05, $40, $E8, $B0, $0A 
      .byte $00, $CD, $A0, $0B, $00, $98, $84, $64 
      .byte $91, $40, $54, $05, $44, $54, $67, $8B 
      .byte $00, $A0, $0C, $DA, $00, $B0, $06, $78 
      .byte $45, $44, $64, $91, $44, $54, $45, $46 
      .byte $78, $B0, $0A, $00, $CD, $A0, $0B, $00 
      .byte $98, $84, $54, $05, $40, $14, $01, $46 
      .byte $64, $60, $8B, $00, $A0, $0C, $DA, $00 
      .byte $B0, $06, $78, $45, $44, $54, $61, $44 
      .byte $54, $45, $46, $78, $B0, $0A, $00, $CD 
      .byte $CA, $0C, $B0, $C0, $3C, $63, $C0, $3C 
      .byte $03, $C0, $3C, $03, $C6, $2C, $B0, $CA 
W8AE5:
      .byte $0C, $FF                    
      ldy  #$01                         
      jsr  W9AE6                        
      ldy  #$36                         
      jsr  W8B25                        
      lda  #$25                         
      sta  $18                          
W8AF5:
      ldy  $18                          
      cpy  #$29                         
      beq  W8B02                        
      jsr  W9436                        
      inc  $18                          
      bne  W8AF5                        
W8B02:
      ldy  #$03                         
      jsr  W8C36                        
      ldy  #$04                         
      jsr  W8C36                        
      ldy  #$02                         
      jsr  W9AE6                        
      ldy  #$14                         
      jsr  W9B04                        
      ldy  #$15                         
      jmp  W9B04                        

W8B1B:                                  
      .byte $25
W8B1C:
      .byte $91, $48, $8A, $3B, $C9, $62, $93, $E5 
      .byte $92                         
W8B25:
      jsr  W9AD1                        
      tya                               
      sec                               
      sbc  #$33                         
      asl                               
      tay                               
      lda  W8B1B,y                      
      sta  $1C                          
      lda  W8B1C,y                      
      sta  $1D                          
      ldy  #$00                         
W8B3A:
      lda  $04                          
      cmp  $1D                          
      bne  W8B47                        
      lda  $03                          
      cmp  $1C                          
      bne  W8B47                        
      rts                               

W8B47:
      lda  ($03),y                      
      php                               
      and  #$7F                         
      sta  $13                          
      beq  W8B5D                        
      asl                               
      clc                               
      adc  $13                          
      clc                               
      adc  $05                          
      sta  $05                          
      bcc  W8B5D                        
      inc  $06                          
W8B5D:
      plp                               
      php                               
      bpl  W8B6E                        
      ldx  #$0B                         
W8B63:
      lda  W8BC2,x                      
      sta  ($05),y                      
      jsr  W8BD5                        
      dex                               
      bpl  W8B63                        
W8B6E:
      jsr  W8BCD+1                      
      lda  ($03),y                      
      sta  $19                          
      and  #$1F                         
      sta  $18                          
      lda  #$15                         
      plp                               
      sec                               
      bpl  W8B81                        
      sbc  #$04                         
W8B81:
      sbc  $13                          
      sbc  $18                          
      sta  $13                          
      asl                               
      clc                               
      adc  $13                          
      adc  #$01                         
      sta  $13                          
      jsr  W8BCD+1                      
W8B92:
      lda  #$80                         
      sta  $20                          
      lda  #$03                         
      sta  $0A                          
W8B9A:
      lda  $19                          
      and  $20                          
      beq  W8BA7                        
      lda  ($03),y                      
      sta  ($05),y                      
      jsr  W8BCD+1                      
W8BA7:
      jsr  W8BD5                        
      lsr  $20                          
      dec  $0A                          
      bne  W8B9A                        
      dec  $18                          
      bne  W8B92                        
      lda  $05                          
      clc                               
      adc  $13                          
      sta  $05                          
      bcc  W8BBF                        
      inc  $06                          
W8BBF:
      jmp  W8B3A                        

W8BC2:
      .byte $00, $A8, $56, $00, $22, $5A, $00, $55 
      .byte $15, $00, $00               
W8BCD:
      .byte $05
      inc  $03                          
      bne  W8BD4                        
      inc  $04                          
W8BD4:
      rts                               

W8BD5:
      inc  $05                          
      bne  W8BDB                        
      inc  $06                          
W8BDB:
      rts                               

W8BDC:
      ldy  #$03                         
      jsr  W9AE6                        
      lda  $49                          
      ldy  #$14                         
      ldx  #$0A                         
W8BE7:
      cmp  W8C15,x                      
      bcs  W8BF1                        
      dey                               
      dey                               
      dex                               
      bne  W8BE7                        
W8BF1:
      lda  W8C20,x                      
      sta  $C0DE                        
      lda  W8C2B,x                      
      sta  $48                          
      lda  W9125,y                      
      sta  $03                          
      lda  W9126,y                      
      sta  $04                          
      lda  #$80                         
      sta  $05                          
      lda  #$54                         
      sta  $06                          
      lda  #$1D                         
      sta  $07                          
      jmp  W9B0C                        

W8C15:
      .byte $01, $02, $03, $04, $06, $08, $0A, $0C 
      .byte $0E, $10, $12               
W8C20:                                  
      .byte $05, $05, $09, $05, $04, $05, $05, $08 
      .byte $05, $0E, $07               
W8C2B:
      .byte $04, $06, $08, $10, $20, $30, $40, $50 
      .byte $60, $70, $80               
W8C36:
      lda  W8C68,y                      
      sta  $19                          
      lda  W8C6F,y                      
      sta  $1A                          
      lda  W8C76,y                      
      sta  $1C                          
      lda  W8C7D,y                      
      sta  $23                          
      lda  W8C84,y                      
      sta  $24                          
W8C4F:
      lda  $19                          
      sta  $04                          
      lda  $1A                          
      sta  $06                          
      jsr  W8C65                        
      inc  $19                          
      inc  $1A                          
      lda  $19                          
      cmp  $1C                          
      bne  W8C4F                        
      rts                               

W8C65:
      jmp  ($0023)                      

W8C68:
      .byte $30, $20, $28, $00, $0C, $01, $0D 
W8C6F:
      .byte $53, $24, $2C, $04, $08, $05, $09 
W8C76:
      .byte $4D, $24, $2C, $04, $10, $04, $10 
W8C7D:
      .byte $71, $71, $EA, $71, $EA, $71, $EA 
W8C84:
      .byte $93, $93, $93, $93, $93, $93, $93, $80 
      .byte $E6, $29, $54, $20, $A5, $55, $A0, $65 
      .byte $55, $80, $59, $54, $00, $55, $50, $00 
      .byte $40, $15, $00, $80, $E6, $25, $54, $00 
      .byte $A5, $55, $80, $6A, $55, $80, $55, $54 
      .byte $00, $15, $40, $00, $01, $50, $00, $80 
      .byte $E6, $25, $54, $C0, $A5, $54, $F0, $EA 
      .byte $FF, $FC, $55, $54, $F0, $15, $40, $C0 
      .byte $01, $50, $00, $80, $E6, $25, $54, $C0 
      .byte $A5, $54, $F0, $EA, $FF, $FC, $55, $54 
      .byte $F0, $50, $40, $C0, $54, $54, $00, $00 
      .byte $01, $00, $01, $00, $01, $00, $01, $00 
      .byte $01, $00, $01, $00, $01, $00, $01, $00 
      .byte $01, $00, $01, $00, $01, $00, $01, $00 
      .byte $E9, $03, $FF, $F0, $0F, $AA, $A8, $0A 
      .byte $95, $58, $0A, $92, $48, $0F, $AA, $A8 
      .byte $0F, $EB, $AC, $57, $FF, $F0, $40, $A8 
      .byte $A8, $00, $20, $20, $01, $E9, $03, $FF 
      .byte $F0, $0F, $AA, $A8, $0A, $95, $58, $0A 
      .byte $92, $48, $0F, $AA, $A8, $4F, $EB, $AC 
      .byte $57, $FF, $F0, $00, $80, $80, $00, $A8 
      .byte $A8, $00, $EA, $02, $AA, $00, $05, $A5 
      .byte $00, $11, $00, $00, $15, $00, $00, $02 
      .byte $A5, $40, $3F, $AA, $00, $3E, $B8, $00 
      .byte $FE, $B8, $00, $2A, $FB, $00, $A8, $C3 
      .byte $C0, $00, $EA, $02, $AA, $00, $05, $AA 
      .byte $80, $11, $95, $40, $15, $AA, $80, $3F 
      .byte $EA, $00, $FF, $A8, $00, $CC, $A8, $00 
      .byte $00, $EA, $0C, $82, $EA, $30, $2A, $FB 
      .byte $C0, $02, $E7, $0F, $FF, $C0, $3D, $55 
      .byte $F0, $36, $56, $70, $35, $55, $70, $35 
      .byte $FD, $70, $3F, $CF, $F0, $0F, $03, $C0 
      .byte $02, $E7, $03, $FF, $00, $0F, $57, $C0 
      .byte $3D, $99, $F0, $36, $56, $70, $35, $75 
      .byte $70, $35, $CD, $70, $0F, $03, $C0, $00 
      .byte $E9, $40, $00, $40, $54, $05, $40, $69 
      .byte $1A, $40, $19, $19, $00, $44, $04, $40 
      .byte $44, $04, $40, $11, $51, $00, $04, $04 
      .byte $00, $01, $50, $00, $00, $E9, $05, $14 
      .byte $00, $19, $19, $00, $69, $1A, $40, $14 
      .byte $05, $00, $00, $40, $00, $15, $15, $00 
      .byte $40, $00, $40, $14, $45, $00, $01, $50 
      .byte $00, $00, $E5, $3F, $FF, $00, $E5, $11 
      .byte $C0, $A5, $55, $C0, $3F, $FF, $00, $0A 
      .byte $0A, $00, $00, $E5, $54, $AA, $00, $42 
      .byte $AA, $80, $56, $66, $40, $2A, $AA, $80 
      .byte $AF, $AF, $00, $00, $EA, $03, $50, $00 
      .byte $0D, $14, $00, $35, $05, $00, $D0, $56 
      .byte $00, $D4, $5B, $00, $E5, $6F, $20, $AA 
      .byte $BE, $20, $2B, $FC, $80, $1F, $B0, $00 
      .byte $50, $A8, $00, $00, $EA, $0A, $A8, $00 
      .byte $2A, $AA, $40, $56, $A4, $00, $46, $62 
      .byte $00, $16, $08, $00, $0A, $A0, $00, $FE 
      .byte $80, $30, $3B, $AC, $30, $0A, $AE, $C0 
      .byte $A2, $B0, $00, $00, $ED, $00, $FF, $A0 
      .byte $0F, $FA, $44, $0F, $E5, $41, $3F, $90 
      .byte $57, $3E, $54, $7F, $3F, $95, $7F, $3E 
      .byte $A7, $FF, $3A, $FF, $FF, $0B, $FF, $FC 
      .byte $43, $FF, $F2, $15, $FF, $C0, $00, $08 
      .byte $00, $00, $0A, $80, $08, $83, $20, $20 
      .byte $80, $00, $EF, $00, $AA, $A0, $0A, $AA 
      .byte $AA, $55, $AA, $41, $41, $A8, $10, $55 
      .byte $A1, $AA, $2A, $82, $A0, $0A, $AA, $80 
      .byte $FE, $AA, $50, $FF, $A9, $56, $EE, $A5 
      .byte $55, $2A, $A5, $55, $2A, $95, $55, $0A 
      .byte $9D, $55, $8A, $F9, $54, $2B, $EA, $A0 
      .byte $09, $83, $30, $30, $C0, $00, $EF, $00 
      .byte $FF, $FF, $03, $FA, $AA, $3F, $E9, $55 
      .byte $3E, $A5, $05, $FA, $E5, $46, $AB, $F9 
      .byte $5B, $FF, $FE, $AF, $FF, $FF, $FF, $FF 
      .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
      .byte $3F, $FF, $FF, $5F, $FF, $FF, $40, $FB 
      .byte $FF, $00, $0A, $80, $00, $CE, $C0, $00 
      .byte $A0, $00, $16, $00, $06, $00, $56, $C0 
      .byte $AB, $C0, $FF, $C0, $FF, $C0, $FF, $C0 
      .byte $FF, $C0, $FF, $00, $FF, $00, $FC, $00 
      .byte $CA, $00, $00, $F1, $00, $AA, $AA, $0A 
      .byte $AA, $AA, $2A, $AA, $AA, $55, $AA, $AA 
      .byte $41, $AA, $80, $55, $AA, $04, $2A, $AA 
      .byte $AA, $2A, $AA, $A5, $0A, $AA, $95, $FF 
      .byte $AA, $55, $EE, $EA, $55, $EA, $AA, $55 
      .byte $2A, $AA, $55, $0A, $AA, $55, $82, $AA 
      .byte $55, $22, $AB, $D7, $0A, $AF, $EB, $01 
      .byte $D0, $A0, $00, $AA, $00, $41, $00, $10 
      .byte $00, $AA, $00, $A0, $00, $58, $00, $56 
      .byte $00, $55, $80, $55, $80, $55, $80, $55 
      .byte $80, $55, $80, $55, $00, $D6, $00, $F8 
      .byte $00, $00, $F0, $00, $FA, $80, $03, $E4 
      .byte $60, $0F, $94, $2C, $3E, $55, $6F, $39 
      .byte $05, $FD, $F9, $46, $F0, $F9, $56, $FF 
      .byte $FA, $56, $FC, $AB, $AB, $F0, $FF, $FF 
      .byte $CF, $FF, $FF, $FF, $FF, $FF, $F0, $FF 
      .byte $FF, $FF, $37, $FF, $FC, $1F, $FF, $BF 
      .byte $13, $FF, $AF, $01, $CE, $14, $00, $50 
      .byte $40, $54, $40, $45, $00, $01, $40, $00 
      .byte $55, $0C, $54, $F0, $14, $C0, $10, $00 
      .byte $14, $03, $55, $0D, $50, $3C, $04, $F0 
      .byte $00, $00, $F4, $00, $0A, $A0, $00, $AA 
      .byte $80, $0A, $AA, $00, $2A, $AA, $40, $55 
      .byte $6A, $01, $40, $6A, $1A, $51, $6A, $2A 
      .byte $95, $AA, $A9, $AA, $AA, $A9, $2A, $AA 
      .byte $9A, $0A, $AA, $96, $FF, $AA, $A5, $FE 
      .byte $EA, $A9, $CE, $AA, $A5, $0A, $AA, $A5 
      .byte $0A, $AA, $95, $0A, $AA, $A9, $82, $AA 
      .byte $AA, $80, $AB, $BE, $2A, $AB, $FA, $02 
      .byte $D2, $00, $01, $00, $00, $10, $00, $00 
      .byte $41, $05, $00, $94, $01, $55, $44, $50 
      .byte $50, $40, $15, $40, $05, $00, $14, $14 
      .byte $10, $50, $14, $40, $5D, $50, $5F, $56 
      .byte $7C, $98, $70, $80, $00, $00, $EB, $00 
      .byte $00, $03, $00, $03, $0C, $00, $0C, $3C 
      .byte $80, $3C, $30, $28, $2F, $F3, $2A, $AA 
      .byte $BF, $0A, $FE, $FC, $0A, $AA, $C0, $00 
      .byte $BF, $F0, $0C, $3C, $FC, $00, $F0, $03 
      .byte $00, $EB, $00, $00, $3C, $00, $00, $CE 
      .byte $00, $03, $03, $F0, $00, $03, $2A, $00 
      .byte $0F, $02, $F0, $FE, $00, $2A, $FB, $00 
      .byte $0B, $BF, $00, $03, $FA, $00, $00, $FA 
      .byte $00, $00, $3E, $00, $EB, $3F, $03, $03 
      .byte $03, $C0, $CC, $83, $F3, $B0, $8F, $BB 
      .byte $00, $BF, $BB, $0C, $FE, $AC, $03, $FA 
      .byte $BC, $03, $FA, $BF, $CF, $EE, $AF, $FB 
      .byte $F0, $BB, $EC, $BC, $3F, $F0, $03, $E8 
      .byte $A0, $03, $C0, $2A, $00, $C0, $02, $A2 
      .byte $E0, $00, $2A, $EC          
W9068:
      .byte $00, $0B, $FF, $00, $03, $FE, $00, $00 
      .byte $AE, $00, $00, $23, $00, $EB, $00, $0F 
      .byte $C0, $00, $33, $F0, $00, $00, $FC, $03 
      .byte $C0, $EF, $0C, $F0, $FB, $C0, $F3, $FF 
      .byte $33, $EF, $FB, $FF, $EB, $EB, $BF, $AA 
      .byte $AE, $EA, $AB, $AE, $EA, $AF, $FF, $00 
      .byte $EB, $3C, $0F, $F0, $C3, $3F, $FC, $03 
      .byte $3B, $03, $0B, $EC, $30, $2F, $BC, $0C 
      .byte $BF, $E0, $0B, $FE, $FE, $AB, $FA, $AF 
      .byte $BC, $AE, $EB, $C0, $AE, $EB, $0C, $FF 
      .byte $BA, $FC, $02, $E9, $00, $0A, $00, $08 
      .byte $0A, $80, $2A, $26, $A0, $26, $9A, $A0 
      .byte $A6, $A9, $68, $9A, $AA, $98, $AA, $AA 
      .byte $A8, $9A, $AA, $A0, $28, $AA, $80, $00 
      .byte $EB, $00, $28, $00, $00, $AA, $80, $00 
      .byte $AA, $80, $00, $9A, $A0, $28, $9A, $60 
      .byte $9A, $A9, $A8, $A6, $AA, $A0, $1A, $AA 
      .byte $A0, $2A, $AA, $00, $09, $A0, $00, $0A 
      .byte $00, $00, $02, $E9, $00, $00, $80, $08 
      .byte $00, $80, $28, $02, $A0, $98, $02, $60 
      .byte $68, $01, $A0, $AA, $06, $A0, $AA, $1A 
      .byte $60, $9A, $A9, $80, $2A, $2A, $00, $07 
      .byte $E4, $00, $00, $20, $00, $80, $A0, $40 
      .byte $60, $60, $A1, $A1, $A0     
W9125:
      .byte $3B
W9126:
      .byte $91, $59, $91, $77, $91, $95, $91, $B3 
      .byte $91, $D1, $91, $EF, $91, $0D, $92, $67 
      .byte $92, $2B, $92, $49, $92, $00, $08, $20 
      .byte $00, $08, $80, $03, $F6, $00, $03, $FD 
      .byte $A0, $0F, $FF, $00, $3F, $FF, $00, $3F 
      .byte $FF, $00, $FF, $F0, $00, $FF, $C0, $00 
      .byte $FC, $00, $00, $00, $08, $20, $00, $08 
      .byte $80, $05, $2A, $00, $15, $5A, $A0, $55 
      .byte $56, $00, $55, $54, $00, $55, $55, $00 
      .byte $55, $55, $00, $55, $54, $00, $55, $50 
      .byte $00, $03, $FC, $00, $0F, $7D, $00, $17 
      .byte $5F, $40, $DF, $FF, $F0, $FF, $7D, $F0 
      .byte $FD, $7D, $70, $3F, $FF, $C0, $00, $A0 
      .byte $00, $00, $94, $00, $00, $54, $00, $00 
      .byte $00, $80, $00, $01, $A0, $00, $00, $A0 
      .byte $00, $02, $90, $00, $09, $A0, $00, $2A 
      .byte $90, $6A, $99, $80, $A6, $AA, $80, $29 
      .byte $AA, $00, $0A, $A8, $00, $00, $00, $80 
      .byte $00, $02, $A0, $00, $0A, $A0, $00, $2A 
      .byte $A0, $0A, $AA, $A0, $29, $6A, $A0, $A6 
      .byte $AA, $80, $AA, $AA, $80, $AA, $AA, $00 
      .byte $2A, $A8, $00, $00, $80, $00, $28, $22 
      .byte $80, $AA, $AA, $A0, $A9, $A6, $A0, $A9 
      .byte $56, $A0, $0A, $5A, $00, $2A, $5A, $80 
      .byte $2A, $AA, $80, $0A, $AA, $00, $02, $08 
      .byte $00, $00, $80, $00, $00, $82, $00, $0B 
      .byte $BB, $00, $3E, $EF, $C0, $F7, $FF, $F0 
      .byte $DF, $FF, $F0, $FD, $FF, $F0, $3D, $FF 
      .byte $C0, $3F, $7F, $C0, $0F, $FF, $00, $00 
      .byte $A0, $00, $02, $B8, $00, $0A, $BA, $00 
      .byte $29, $AE, $80, $A6, $AB, $A0, $A6, $AA 
      .byte $E0, $A6, $AA, $E0, $2A, $AB, $80, $18 
      .byte $44, $40, $44, $44, $10, $00, $C0, $00 
      .byte $83, $F0, $80, $9D, $DD, $80, $95, $D5 
      .byte $80, $A5, $56, $80, $29, $5A, $00, $08 
      .byte $48, $00, $00, $40, $00, $00, $40, $00 
      .byte $00, $40, $00, $01, $04, $00, $10, $50 
      .byte $40, $05, $E5, $00, $0A, $AA, $00, $2E 
      .byte $AE, $80, $2A, $EA, $C0, $2E, $AE, $80 
      .byte $2A, $AA, $80, $0B, $BB, $00, $02, $A8 
      .byte $00, $00, $00, $00, $00, $00, $00, $7F 
      .byte $FF, $D0, $B3, $FC, $E0, $BF, $FF, $E0 
      .byte $BC, $F3, $E0, $2F, $FF, $80, $2F, $FF 
      .byte $80, $0B, $FE, $00, $02, $A8, $00, $00 
      .byte $EA, $05, $00, $00, $15, $55, $00, $5A 
      .byte $20, $20, $56, $A8, $80, $25, $54, $80 
      .byte $95, $55, $00, $95, $55, $10, $85, $55 
      .byte $50, $01, $40, $40, $00, $54, $00, $00 
      .byte $EA, $05, $00, $00, $15, $50, $00, $16 
      .byte $88, $A0, $58, $95, $00, $5A, $55, $10 
      .byte $55, $55, $50, $25, $55, $00, $20, $55 
      .byte $00, $80, $05, $50, $20, $00, $10, $00 
      .byte $EA, $05, $00, $00, $15, $50, $00, $16 
      .byte $88, $00, $58, $90, $00, $5A, $54, $40 
      .byte $55, $55, $40, $09, $54, $00, $29, $54 
      .byte $40, $85, $55, $40, $81, $55, $00, $40 
      .byte $40, $40, $10, $41, $00, $04, $44, $00 
      .byte $00, $00, $00, $54, $05, $40, $00, $00 
      .byte $00, $04, $44, $00, $10, $41, $00, $40 
      .byte $40, $40, $00, $EA, $14, $00, $00, $A5 
      .byte $55, $20, $AA, $22, $20, $26, $A8, $20 
      .byte $25, $54, $80, $09, $55, $00, $05, $55 
      .byte $00, $15, $55, $00, $15, $54, $00, $10 
      .byte $15, $00, $01, $E9, $05, $00, $00, $15 
      .byte $55, $28, $5A, $22, $28, $56, $A8, $20 
      .byte $65, $50, $80, $2A, $56, $00, $55, $54 
      .byte $00, $55, $55, $00, $40, $05, $40, $80 
      .byte $E6, $29, $54, $00, $16, $BE, $00, $55 
      .byte $5C, $00, $55, $5C, $30, $14, $1F, $C0 
      .byte $15, $3F, $00, $81, $E5, $29, $54, $00 
      .byte $56, $BE, $00, $55, $5F, $30, $54, $1F 
      .byte $C0, $15, $3F, $00, $15, $54, $00, $56 
      .byte $21, $00, $A5, $A9, $00, $19, $55, $00 
      .byte $54, $05, $40, $20, $15, $94, $A9, $15 
      .byte $85, $18                    
W9378:
      lda  #$00                         
      sta  $13                          
      lda  #$02                         
      sta  $14                          
W9380:
      ldy  $13                          
      lda  ($03),y                      
      ldx  #$04                         
W9386:
      asl                               
      php                               
      asl                               
      ror  $17                          
      plp                               
      ror  $17                          
      dex                               
      bne  W9386                        
      ldy  $14                          
      lda  $17                          
      sta  ($05),y                      
      inc  $13                          
      dec  $14                          
      bpl  W9380                        
      ldy  #$03                         
W939F:
      jsr  W8BCD+1                      
      jsr  W8BD5                        
      dey                               
      bne  W939F                        
      dec  $18                          
      bne  W9378                        
      rts                               

W93AD:
      ldy  #$00                         
      jsr  W93DF                        
      sta  $13                          
      and  #$1F                         
      sta  $14                          
W93B8:
      ldx  #$03                         
      lda  $13                          
      sta  $17                          
W93BE:
      asl  $17                          
      bcc  W93C7                        
      jsr  W93DF                        
      sta  ($05),y                      
W93C7:
      iny                               
      dex                               
      bne  W93BE                        
      dec  $14                          
      bne  W93B8                        
      clc                               
      lda  $05                          
      adc  #$40                         
      sta  $05                          
      bcc  W93DA                        
      inc  $06                          
W93DA:
      dec  $18                          
      bne  W93AD                        
      rts                               

W93DF:
      sty  $11                          
      ldy  #$00                         
      lda  ($03),y                      
      ldy  $11                          
      jmp  W8BCD+1                      

      jsr  W9415                        
      lda  #$02                         
      sta  $13                          
      lda  #$23                         
      sta  $14                          
W93F5:
      ldx  #$02                         
W93F7:
      ldy  $13                          
      lda  ($03),y                      
      ldy  $14                          
      sta  ($05),y                      
      dec  $13                          
      dec  $14                          
      dex                               
      bpl  W93F7                        
      lda  $14                          
      bmi  W9414                        
      lda  $13                          
      clc                               
      adc  #$06                         
      sta  $13                          
      jmp  W93F5                        

W9414:
      rts                               

W9415:
      lda  #$00                         
      sta  $03                          
      sta  $05                          
      lsr  $04                          
      ror  $03                          
      lda  $04                          
      lsr                               
      ora  #$40                         
      sta  $04                          
      ror  $03                          
      lsr  $06                          
      ror  $05                          
      lda  $06                          
      lsr                               
      ora  #$40                         
      sta  $06                          
      ror  $05                          
      rts                               

W9436:
      jsr  W9AD1                        
      lda  #$21                         
      sta  $8A                          
W943D:
      lda  #$02                         
      sta  $2A                          
W9441:
      lda  #$00                         
      sta  $1B                          
W9445:
      ldy  #$00                         
      sty  $19                          
      lda  #$03                         
      sec                               
      sbc  $1B                          
      tax                               
      lda  W94AC,x                      
      sta  $20                          
W9454:
      lda  W94A5,x                      
      sta  $0A                          
      php                               
      lda  ($03),y                      
      and  $20                          
      plp                               
      beq  W9467                        
      clc                               
W9462:
      ror                               
      dec  $0A                          
      bne  W9462                        
W9467:
      ora  $19                          
      sta  $19                          
      inx                               
      iny                               
      iny                               
      iny                               
      cpy  #$0B                         
      bmi  W9454                        
      ldy  $8A                          
      sta  ($05),y                      
      tya                               
      sec                               
      sbc  #$03                         
      sta  $8A                          
      bcs  W9489                        
      clc                               
      adc  #$25                         
      sta  $8A                          
      cmp  #$24                         
      bne  W9489                        
      rts                               

W9489:
      inc  $1B                          
      lda  $1B                          
      cmp  #$04                         
      bmi  W9445                        
      jsr  W8BCD+1                      
      dec  $2A                          
      bpl  W9441                        
      lda  $03                          
      clc                               
      adc  #$09                         
      sta  $03                          
      bcc  W943D                        
      inc  $04                          
      bne  W943D                        
W94A5:                                  
      .byte $03, $05, $07, $00, $02, $04, $06 
W94AC:                                  
      .byte $03, $0C, $30, $C0, $00, $00, $FF, $00 
      .byte $FF, $0F, $FF, $FF, $FF, $C0, $FF, $0F 
      .byte $FF, $FF, $FF, $F0, $F0, $00, $00, $00 
      .byte $03, $00, $FF, $3F, $FF, $00, $FF, $3F 
      .byte $FF, $00, $00, $00, $00, $00, $FF, $00 
      .byte $FF, $FF, $FC, $F0, $B1, $01, $A1, $A2 
      .byte $4F, $30, $2F, $01, $40, $50, $24, $20 
      .byte $42, $A3, $F0, $41, $31, $A1, $A1, $02 
      .byte $A2, $03, $03, $A3, $10, $4F, $A2, $42 
      .byte $90, $2A, $20, $30, $13, $04, $04, $A4 
      .byte $20, $1F, $A3, $03, $01, $31, $03, $14 
      .byte $02, $4F, $30, $2F, $01, $40, $50, $24 
      .byte $20, $42, $90, $3F, $04, $13, $1A, $1A 
      .byte $10, $20, $02, $03, $03, $A3, $10, $4F 
      .byte $A2, $42, $A2, $A2, $03, $01, $30, $40 
      .byte $4A, $42, $01, $FA, $30, $30, $13, $10 
      .byte $31, $40, $24, $F3, $03, $1A, $1A, $10 
      .byte $2F, $D0                    
      brk                               
W9537:
      ldy  #$20                         
      jsr  W9AD1                        
W953C:
      ldy  #$00                         
      lda  ($03),y                      
      beq  W9556                        
      tax                               
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      jsr  W9557                        
      txa                               
      and  #$0F                         
      jsr  W9557                        
      jsr  W8BCD+1                      
      jmp  W953C                        

W9556:
      rts                               

W9557:
      tay                               
      and  #$08                         
      bne  W9567                        
      lda  W957C,y                      
      ldy  #$00                         
      sta  ($05),y                      
      jsr  W8BD5                        
      rts                               

W9567:
      tya                               
      and  #$07                         
      sta  $0A                          
W956C:
      lda  #$55                         
      ldy  #$00                         
      sta  ($05),y                      
      jsr  W8BD5                        
      dec  $0A                          
      lda  $0A                          
      bne  W956C                        
      rts                               

W957C:
      eor  $57,x                        
      eor  $D575,x                      
      dcp  $A9,x                        
      lax  $85                          
      ora  W96A9,y                      
      sta  $1A                          
      ldy  $0A                          
      lda  ($28),y                      
      sta  $3A                          
      cmp  #$FF                         
      bne  W9598                        
      inc  $16                          
      inc  $16                          
W9598:
      rts                               

      jmp  W965E                        

W959C:
      lda  #$20                         
      sta  $03                          
      lda  #$48                         
      sta  $04                          
      jmp  W95AF                        

W95A7:
      lda  #$B3                         
      sta  $03                          
      lda  #$96                         
      sta  $04                          
W95AF:
      lda  $4A                          
      cmp  #$06                         
      bcs  W95DB                        
      asl                               
      clc                               
      adc  $4A                          
      sta  $16                          
      lda  #$BA                         
      sta  $15                          
      lda  #$00                         
      sta  $17                          
      sta  $0A                          
W95C5:
      lda  #$0A                         
      sta  $18                          
      ldy  $0A                          
      jsr  W9C2A                        
      inc  $16                          
      lda  $0A                          
      clc                               
      adc  #$0A                         
      sta  $0A                          
      cmp  #$1E                         
      bmi  W95C5                        
W95DB:
      rts                               

W95DC:
      lda  #$A7                         
      sta  $19                          
      lda  #$96                         
      sta  $1A                          
      lda  #$B8                         
      sta  $15                          
      lda  #$16                         
      sta  $16                          
      lda  #$00                         
      sta  $3A                          
W95F0:
      jsr  W965E                        
      inc  $3A                          
      lda  $3A                          
      cmp  #$05                         
      bne  W95F0                        
      inc  $16                          
      lda  #$00                         
      sta  $19                          
      inc  $49                          
      lda  $49                          
W9605:
      cmp  #$0A                         
      bcc  W9610                        
      sec                               
      sbc  #$0A                         
      inc  $19                          
      bne  W9605                        
W9610:
      pha                               
      lda  $19                          
      bne  W961C                        
      inc  $16                          
      inc  $16                          
      jmp  W962B                        

W961C:
      cmp  #$0A                         
      bcc  W9626                        
      sec                               
      sbc  #$0A                         
      jmp  W961C                        

W9626:
      sta  $3A                          
      jsr  W9656                        
W962B:
      pla                               
      sta  $3A                          
      jmp  W9656                        

W9631:
      lda  $3E                          
      sta  $3A                          
      lda  #$00                         
      sta  $15                          
      lda  #$05                         
      sta  $16                          
      jsr  W9656                        
      lda  #$A7                         
      sta  $19                          
      lda  #$96                         
      sta  $1A                          
      lda  #$02                         
      sta  $3A                          
      jsr  W965E                        
      lda  #$05                         
      sta  $3A                          
      jmp  W965E                        

W9656:
      lda  #$93                         
      sta  $19                          
      lda  #$96                         
      sta  $1A                          
W965E:
      lda  $03                          
      pha                               
      lda  $04                          
      pha                               
      tya                               
      pha                               
      lda  $3A                          
      asl                               
      tay                               
      lda  ($19),y                      
      sta  $03                          
      iny                               
      lda  ($19),y                      
      sta  $04                          
      lda  #$00                         
      sta  $17                          
      tay                               
      lda  #$07                         
      sta  $18                          
      jsr  W9C2A                        
      inc  $16                          
      ldy  #$07                         
      sty  $18                          
      jsr  W9C2A                        
      inc  $16                          
      pla                               
      tay                               
      pla                               
      sta  $04                          
      pla                               
      sta  $03                          
      rts                               

      .byte $7A, $06, $88, $06, $96, $06, $A4, $06 
      .byte $B2, $06, $C0, $06, $CE, $06, $DC, $06 
      .byte $EA, $06, $F8, $06, $06, $07
W96A9:
      .byte $14, $07, $22, $07, $30, $07, $3E, $07 
      .byte $4C, $07, $0A, $2A, $A5, $A9, $1A, $5A 
      .byte $D5, $AA, $A0, $A8, $00, $AA, $11, $54 
      .byte $A8, $A8, $FF, $A8, $80, $A0, $00, $00 
      .byte $00, $00, $C0, $F0, $FC, $F0, $C0, $00 
W96D1:
      lda  #$05                         
      sta  $2B                          
      lda  $DC01                        
      sta  $19                          
      and  #$10                         
      bne  W96E5                        
      lda  $57                          
      bne  W96FC                        
      inc  $57                          
      rts                               

W96E5:
      ldy  #$00                         
      sty  $57                          
      iny                               
      sty  $2B                          
      lda  #$08                         
      sta  $20                          
W96F0:
      lda  $19                          
      and  $20                          
      beq  W9700                        
      inc  $2B                          
      lsr  $20                          
      bne  W96F0                        
W96FC:
      lda  #$00                         
      sta  $2B                          
W9700:
      rts                               

W9701:
      jsr  W9A13                        
      jmp  W970A                        

W9707:
      jsr  W9728                        
W970A:
      lda  $27                          
      lsr                               
      tay                               
      lda  W8684,y                      
      sta  $20                          
      clc                               
      lda  $15                          
      adc  #$04                         
      sta  $15                          
      lda  #$00                         
      sta  $09                          
      jsr  W9C63                        
      and  $20                          
      beq  W9727                        
      inc  $09                          
W9727:
      rts                               

W9728:
      jsr  W9A13                        
      inc  $16                          
      inc  $16                          
      lda  $27                          
      clc                               
      adc  #$04                         
      sta  $27                          
      cmp  #$08                         
      bmi  W9741                        
      inc  $16                          
      sec                               
      sbc  #$08                         
      sta  $27                          
W9741:
      rts                               

W9742:
      jsr  W9728                        
      lda  #$D3                         
      sta  $19                          
      lda  #$97                         
      sta  $1A                          
      jsr  W9768                        
      dec  $16                          
      jmp  W977F                        

W9755:
      jsr  W9A13                        
      lda  #$DB                         
      sta  $19                          
      lda  #$97                         
      sta  $1A                          
      jsr  W9768                        
      inc  $16                          
      jmp  W977F                        

W9768:
      ldy  $27                          
      lda  ($19),y                      
      sta  $28                          
      iny                               
      lda  ($19),y                      
      sta  $29                          
      lda  #$00                         
      sta  $0A                          
      lda  #$03                         
      sta  $19                          
      lda  #$07                         
      sta  $1A                          
W977F:
      lda  $16                          
      sta  $3D                          
      lda  $15                          
      sta  $3C                          
      ldy  $0A                          
W9789:
      jsr  W97C1                        
      inc  $0A                          
      ldy  $0A                          
      cpy  $19                          
      bne  W9789                        
      lda  #$05                         
      sta  $2A                          
W9798:
      ldy  $0A                          
      jsr  W97C1                        
      dec  $2A                          
      bne  W9798                        
      inc  $0A                          
      ldy  $0A                          
W97A5:
      jsr  W97C1                        
      inc  $0A                          
      ldy  $0A                          
      cpy  $1A                          
      bne  W97A5                        
      lda  #$0A                         
      sta  $19                          
      lda  #$0E                         
      sta  $1A                          
      lda  $3D                          
      sta  $16                          
      lda  $3C                          
      sta  $15                          
      rts                               

W97C1:
      lda  ($28),y                      
      sta  $20                          
      jsr  W9C6B                        
      ldy  #$00                         
      lda  ($0F),y                      
      and  $20                          
      sta  ($0F),y                      
      inc  $15                          
      rts                               

      asl                               
      asl  $18                          
      asl  $26                          
      asl  $34                          
      asl  $42                          
      asl  $50                          
      asl  $5E                          
      asl  $6C
      .byte $06                      
W97E3:
      lda  #$0A                          
      bne  W97E9                        
W97E7:
      lda  #$00                         
W97E9:
      sta  $09                          
      jsr  W9868                        
      lda  $15                          
      clc                               
      adc  $09                          
      sta  $15                          
      inc  $16                          
      jsr  W9C63                        
      sta  $09                          
      rts                               

W97FD:
      lda  #$02                         
      jsr  W9823                        
      jsr  W983A                        
      dec  $15                          
      dec  $15                          
      jmp  W9813                        

W980C:
      lda  #$08                         
      jsr  W9823                        
      inc  $15                          
W9813:
      lda  $2E                          
      sta  $19                          
      lda  $2F                          
      sta  $1A                          
      jsr  W983A                        
      inc  $15                          
      jmp  W983E                        

W9823:
      sta  $09                          
      jsr  W9868                        
      lda  $15                          
W982A:
      clc                               
      adc  $09                          
      sta  $15                          
      lda  $28                          
      sta  $19                          
      lda  $29                          
      sta  $1A                          
      jmp  W983A                        

W983A:
      lda  #$00                         
      sta  $18                          
W983E:
      lda  $18                          
      clc                               
      adc  #$04                         
      sta  $1C                          
W9845:
      jsr  W9C6B                        
      ldy  $18                          
      lda  ($19),y                      
      sta  $20                          
      ldy  #$00                         
      lda  ($0F),y                      
      and  $20                          
      sta  ($0F),y                      
      inc  $16                          
      inc  $18                          
      lda  $18                          
      cmp  $1C                          
      bne  W9845                        
      lda  $16                          
      sec                               
      sbc  #$04                         
      sta  $16                          
      rts                               

W9868:
      jsr  W9A13                        
      ldy  #$00                         
W986D:
      lda  W990F,y                      
      cmp  $16                          
      beq  W9879                        
      iny                               
      cpy  #$0E                         
      bne  W986D                        
W9879:
      tya                               
      cmp  #$08                         
      bmi  W9881                        
      sec                               
      sbc  #$08                         
W9881:
      asl                               
      and  #$07                         
      tay                               
      lda  W9926,y                      
      sta  $28                          
      lda  W9927,y                      
      sta  $29                          
      lda  W992E,y                      
      sta  $2E                          
      lda  W992F,y                      
      sta  $2F                          
      lda  $15                          
      clc                               
      adc  $09                          
      and  #$F8                         
      sta  $19                          
      lda  $15                          
      clc                               
      adc  $09                          
      sec                               
      sbc  $19                          
      sta  $27                          
      cmp  #$04                         
      bmi  W98B3                        
      sec                               
      sbc  #$04                         
W98B3:
      asl                               
      asl                               
      sta  $27                          
      clc                               
      adc  $28                          
      bcc  W98BE                        
      inc  $29                          
W98BE:
      sta  $28                          
      rts                               

W98C1:
      jsr  W9A41                        
      sta  $19                          
      ldy  $D00E                        ; Position X sprite 7
      lda  $0E00,y                      
      cmp  $19                          
      bne  W98D1                        
      rts                               

W98D1:
      lda  $2D                          
      sta  $2B                          
W98D5:
      pla                               
      pla                               
W98D7:
      lda  $2B                          
      asl                               
      tay                               
      lda  W98E8,y                      
      sta  $23                          
      lda  W98E9,y                      
      sta  $24                          
      jmp  ($0023)                      

W98E8:
      rts                               

W98E9:                                  
      .byte $82, $60, $82, $94, $82, $11, $83, $C8 
      .byte $82                         
W98F2:
      .byte $1E, $34, $4A, $60, $76, $8C, $A2, $B8 
      .byte $CE, $E4, $FA, $10, $26, $3C
W9900:
      .byte $41, $4C, $57, $62, $6D, $78, $83, $8E 
      .byte $99, $A4, $AF, $BA, $C5, $D0, $DB 
W990F:
      .byte $00, $03, $06, $09, $0B, $0E, $11, $14 
      .byte $16, $19, $1C, $1F, $21, $24
W991D:
      .byte $AC, $0F, $D0, $B9, $00, $0F, $D0, $AC 
      .byte $60                         
W9926:
      .byte $AA
W9927:                                  
      .byte $05, $BA, $05, $CA, $05, $DA, $05 
W992E:
      .byte $EA
W992F:                                  
      .byte $05, $F2, $05, $FA, $05, $02, $06
W9936:                                  
      lda  $3B
      bne  W9954                        
      inc  $3F                          
      inc  $3F                          
      lda  $3F                          
      cmp  #$16                         
      bne  W9954                        
      lda  #$00                         
      sta  $3F                          
      sta  $41                          
      lda  #$10                         
      sta  $40                          
      jsr  W996F                        
      jsr  W99A2                      
W9954:
      rts                               

W9955:
      sed                               
      lda  $40                          ; DATA current line number
      clc                               
      adc  $42                          
      sta  $42                          
      lda  $41                          
      adc  $43                          
      sta  $43                          
      lda  #$00                         
      adc  $44                          
      sta  $44                          
      cld                               
      bcc  W996E                        
      inc  $BB                          
W996E:
      rts                               

W996F:
      jsr  W9955                        
      ldy  #$10                         
W9974:
      cmp  W9991,y                      
      beq  W9980                        
      dey                               
      bpl  W9974                        
      iny                               
      sty  $46                          
W997F:
      rts                               

W9980:
      lda  $46                          
      bne  W997F                        
      inc  $46                          
      lda  #$02                         
      jsr  WBA0E                        
      jsr  W95A7                        
      inc  $4A                          
      rts                               

W9991:                                  
      .byte $02, $06, $12, $18, $24, $30, $36, $42 
      .byte $48, $54, $60, $66, $72, $78, $84, $90 
      .byte $96
W99A2:                                  
      lda  $16
      pha                               
      lda  $15                          
      pha                               
      lda  $BB                          
      beq  W99CE                        
      lda  #$00                         
      sta  $BB                          
      lda  #$0C                         
      sta  $16                          
      lda  #$30                         
      sta  $03                          
      lda  #$48                         
      sta  $04                          
W99BC:
      lda  #$00                         
      sta  $17                          
      tay                               
      lda  #$08                         
      sta  $18                          
      sta  $15                          
      jsr  W9C2A                        
      dec  $16                          
      bne  W99BC                        
W99CE:
      lda  #$42                         
      sta  $03                          
      lda  #$00                         
      sta  $04                          
      lda  #$08                         
      sta  $15                          
      ldy  #$00                         
      sty  $09                          
      iny                               
      sty  $16                          
      iny                               
W99E2:
      jsr  W99EF                        
      dey                               
      bpl  W99E2                        
      pla                               
      sta  $15                          
      pla                               
      sta  $16                          
      rts                               

W99EF:
      lda  ($03),y                      
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      jsr  W9A00                        
      lda  ($03),y                      
      and  #$0F                         
      jsr  W9A00                        
      rts                               

W9A00:
      bne  W9A06                        
      ldx  $09                          
      beq  W9A0E                        
W9A06:
      inc  $09                          
      sta  $3A                          
      jsr  W9656                        
      rts                               

W9A0E:
      inc  $16                          
      inc  $16                          
      rts                               

W9A13:
      clc                               
      lda  $D010                        
      and  #$80                         
      beq  W9A1C                        
      sec                               
W9A1C:
      lda  $D00E                        
      ror                               
      lsr                               
      lsr                               
      pha                               
      sec                               
      sbc  #$03                         
      sta  $16                          
      pla                               
      asl                               
      asl                               
      asl                               
      sta  $19                          
      lda  $D00E                        
      sec                               
      sbc  $19                          
      and  #$FE                         
      sta  $27                          
      lda  $D00F                        
      sec                               
      sbc  #$32                         
      sta  $15                          
      rts                               

W9A41:
      lda  $D010                        
      and  #$80                         
      beq  W9A4A                        
      lda  #$01                         
W9A4A:
      rts                               

W9A4B:
      sta  $15                          
      sta  $3C                          
      lda  #$00                         
      sta  $16                          
W9A53:
      lda  $3C                          
      sta  $15                          
      jsr  W9A69                        
      jsr  W9A69                        
      jsr  W9A69                        
      inc  $16                          
      lda  $16                          
      cmp  #$28                         
      bne  W9A53                        
      rts                               

W9A69:
      jsr  W9C6B                        
      lda  #$FF                         
      ldy  #$00                         
      sta  ($0F),y                      
      inc  $15                          
      rts                               

W9A75:
      sta  $15                          
      sta  $3C                          
      lda  #$00                         
      sta  $16                          
      lda  #$B0                         
      sta  $03                          
      lda  #$94                         
      sta  $04                          
      jsr  W9A8C                        
      jsr  W9A8C                        
      rts                               

W9A8C:
      lda  #$00                         
      sta  $0A                          
W9A90:
      lda  $3C                          
      sta  $15                          
      jsr  W9AA3                        
      jsr  W9AA3                        
      inc  $16                          
      lda  $0A                          
      cmp  #$28                         
      bne  W9A90                        
      rts                               

W9AA3:
      jsr  W9C6B                        
      ldy  $0A                          
      lda  ($03),y                      
      ldy  #$00                         
      ora  ($0F),y                      
      sta  ($0F),y                      
      inc  $0A                          
      inc  $15                          
      rts                               

W9AB5:
      inc  $08                          
      bne  W9AB5                        
      dex                               
      bne  W9AB5                        
      rts                               

W9ABD:
      ldy  #$00                         
W9ABF:
      lda  ($03),y                      
      sta  ($05),y                      
      iny                               
      bne  W9ABF                        
      dex                               
      beq  W9AD0                        
      inc  $04                          
      inc  $06                          
      jmp  W9ABF                        

W9AD0:
      rts                               

W9AD1:
      lda  W9B1A,y                      
      sta  $03                          
      lda  W9B56,y                      
      sta  $04                          
      lda  W9B92,y                      
      sta  $05                          
      lda  W9BCE,y                      
      sta  $06                          
      rts                               

W9AE6:
      jsr  W9AD1                        
      lda  W9C0A,y                      
      sta  $02                          
W9AEE:
      lda  $02                          
      ldy  #$00                         
      sta  ($03),y                      
      jsr  W8BCD+1                      
      ldy  $06                          
      cpy  $04                          
      bne  W9AEE                        
      ldy  $05                          
      cpy  $03                          
      bne  W9AEE                        
      rts                               

W9B04:
      jsr  W9AD1                        
      lda  W9C0A,y                      
      sta  $07                          
W9B0C:
      inc  $07                          
      ldy  #$00                         
W9B10:
      lda  ($03),y                      
      sta  ($05),y                      
      iny                               
      cpy  $07                          
      bne  W9B10                        
      rts                               

W9B1A:
      brk                               
      brk                               
      rti                               

      .byte $80, $00, $00, $00, $00, $00, $36, $F0 
      .byte $00, $28, $98, $98, $00, $C0, $40, $00 
      .byte $00, $E5, $62, $00, $F9, $FF, $05, $5A 
      .byte $00, $00, $00, $00, $0B, $D8, $00, $40 
      .byte $80, $C0, $00, $40, $80, $C0, $FF, $00 
      .byte $00, $78, $18, $08, $D0, $00, $08, $D0 
      .byte $8B, $0D, $00, $00, $85, $48, $E8, $0E 
      .byte $30                         
W9B56:
      .byte $48, $40, $5C, $54, $5D, $60, $44, $45 
      .byte $D8, $DA, $44, $44, $44, $47, $DB, $C0 
      .byte $C0, $C1, $0E, $60, $92, $93, $40, $B9 
      .byte $B9, $BA, $07, $60, $44, $D8, $C0, $00 
      .byte $94, $48, $48, $48, $48, $40, $40, $40 
      .byte $40, $FF, $10, $D8, $44, $45, $46, $46 
      .byte $D8, $DA, $DA, $8C, $8A, $C8, $93, $92 
      .byte $8A, $88, $88, $A8          
W9B92:
      .byte $00, $FF, $C0, $C0, $00, $00, $00, $E8 
      .byte $F8, $9D, $F8, $28, $78, $E8, $E8, $A2 
      .byte $22, $62, $00, $00, $40, $80, $00, $C0 
      .byte $C0, $C0, $EA, $00, $00, $00, $00, $00 
      .byte $00, $00, $40, $80, $C0, $00, $40, $80 
      .byte $C0, $00, $00, $00, $18, $08, $D0, $98 
      .byte $08, $D0, $98, $00, $00, $80, $00, $40 
      .byte $00, $00, $AA, $5A          
W9BCE:
      .byte $5D, $43, $5C, $54, $60, $80, $45, $47 
      .byte $DB, $DB, $47, $44, $44, $47, $DB, $C0 
      .byte $C3, $C1, $10, $80, $5C, $5C, $41, $00 
      .byte $00, $00, $07, $13, $33, $37, $3B, $3F 
      .byte $C8, $4A, $4A, $4A, $4A, $43, $43, $43 
      .byte $43, $C5, $50, $10, $45, $46, $46, $47 
      .byte $DA, $DA, $DB, $48, $5D, $5D, $40, $40 
      .byte $C8, $04, $05, $07          
W9C0A:
      .byte $00, $00, $00, $00, $00, $00, $A2, $11 
      .byte $07, $03, $20, $73, $71, $E1, $08, $00 
      .byte $00, $FF, $FF, $00, $1B, $0F, $00, $06 
      .byte $06, $06, $04, $20, $04, $04, $04, $01 
W9C2A:
      .byte $20
      arr  #$9C                         ; Unusual operation
W9C2D:
      lda  ($03),y                      
      jsr  W9C3E                        
      iny                               
      cpy  $17                          
      bne  W9C39                        
      ldy  #$00                         
W9C39:
      dec  $18                          
      bne  W9C2D                        
      rts                               

W9C3E:
      sty  $11                          
      ldy  #$00                         
      sta  ($0F),y                      
      ldy  $11                          
      lda  $0F                          
      and  #$07                         
      cmp  #$07                         
      beq  W9C55                        
      inc  $0F                          
      bne  W9C54                        
      inc  $10                          
W9C54:
      rts                               

W9C55:
      clc                               
      lda  $0F                          
      adc  #$39                         
      sta  $0F                          
      lda  $10                          
      adc  #$01                         
      sta  $10                          
      rts                               

W9C63:
      jsr  W9C6B                        
      ldy  #$00                         
      lda  ($0F),y                      
      rts                               

W9C6B:
      stx  $12                          
      sty  $11                          
      ldy  $15                          
      ldx  $16                          
      clc                               
      lda  $0C00,y                      
      adc  $0B00,x                      
      sta  $0F                          
      lda  $0D00,y                      
      adc  $0B40,x                      
      sta  $10                          
      ldy  $11                          
      ldx  $12                          
      rts                               

W9C89:
      .byte $00
W9C8A:
      .byte $60, $40, $61, $80, $62, $C0, $63, $00 
      .byte $65, $40, $66, $80, $67, $C0, $68, $00 
      .byte $6A, $40, $6B, $80, $6C, $C0, $6D, $00 
      .byte $6F, $40, $70, $80, $71, $C0, $72, $00 
      .byte $74, $40, $75, $80, $76, $C0, $77, $00 
      .byte $79, $40, $7A, $80, $7B, $C0, $7C 
W9CB9:
      sei                               
      lda  #$00                         
      sta  $D020                        
      sta  $D021                        
      sta  $D418                        
      lda  #$05                         
      sta  $0A                          
W9CC9:
      ldy  $0A                          
      cpy  #$0A                         
      beq  W9CD6                        
      jsr  W9AE6                        
      inc  $0A                          
      bne  W9CC9                        
W9CD6:
      lda  #$01                         
      ldx  #$04                         
W9CDA:
      sta  $DB0A,x                      
      cpx  #$01                         
      beq  W9CEA                        
      sta  $DA3A,x                      ; Color RAM
      sta  $DB02,x                      ; Color RAM
      sta  $DB54,x                      ; Color RAM
W9CEA:
      dex                               
      bne  W9CDA                        
      lda  #$0A                         
      sta  $15                          
      lda  #$0B                         
      sta  $16                          
      lda  #$40                         
      sta  $03                          
      lda  #$9F                         
      sta  $04                          
      lda  #$00                         
      sta  $17                          
W9D01:
      lda  #$14                         
      sta  $18                          
      ldy  #$00                         
      jsr  W9C2A                        
      lda  $03                          
      clc                               
      adc  #$14                         
      sta  $03                          
      bcc  W9D15                        
      inc  $04                          
W9D15:
      inc  $16                          
      lda  $16                          
      cmp  #$1C                         
      bne  W9D01                        
      ldy  #$2A                         
      jsr  W9AD1                        
      ldx  #$04                         
      jsr  W9ABD                        
      lda  #$14                         
      sta  $D018                        ; VIC memory control register
      ldy  #$0A                         
      jsr  W9AE6                        
      lda  #$00                         
      sta  $0A                          
W9D35:
      ldy  $0A                          
      cpy  #$08                         
      beq  W9D5F                        
      lda  W9E9E,y                      
      sta  $07                          
      tya                               
      asl                               
      tay                               
      lda  W9E8E,y                      
      sta  $03                          
      lda  W9E8F,y                      
      sta  $04                          
      lda  W9E7E,y                      
      sta  $05                          
      lda  W9E7F,y                      
      sta  $06                          
      jsr  W9B0C                        
      inc  $0A                          
      jmp  W9D35                        

W9D5F:
      lda  #$01                         
      sta  $49                          
      sta  $D025                        ; Multicolor animation 0 register
      jsr  W8BDC                        
      lda  $C0DE                        
      sta  $D02A                        ; Color sprite 3
      lda  #$0A                         
      sta  $D026                        ; Multicolor animation 1 register
      lda  #$07                         
      sta  $D028                        ; Color sprite 1
      lda  #$05                         
      sta  $D029                        ; Color sprite 2
      lda  #$0E                         
      sta  $D015                        ; Sprites Abilitator
      lda  #$FF                         
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
      lda  #$5C                         
      sta  $D002                        ; Position X sprite 1
      lda  #$7A                         
      sta  $D003                        ; Position Y sprite 1
      lda  #$FF                         
      sta  $D004                        ; Position X sprite 2
      lda  #$7A                         
      sta  $D005                        ; Position Y sprite 2
      lda  #$AC                         
      sta  $D006                        ; Position X sprite 3
      lda  #$B2                         
      sta  $D007                        ; Position Y sprite 3
      lda  #$00                         
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  #$02                         
      sta  $9B                          ; Parity tape char
      lda  #$30                         
      sta  $47F9                        
      lda  #$32                         
      sta  $47FA                        
      lda  #$52                         
      sta  $47FB                        
      lda  #$FE                         
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  #$E1                         
      sta  $0314                        ; Vector: Hardware Interrupt (IRQ)
      lda  #$9D                         
      sta  $0315                        ; Vector: Hardware Interrupt (IRQ)
      lda  #$20                         
      sta  $D012                        ; Reading/Writing IRQ balance value
      lda  #$01                         
      sta  $D019                        ; Interrupt indicator register
      sta  $D01A                        ; IRQ mask register
      lda  $DC0D                        ; Interrupt control register CIA #1
      cli                               
      jmp  W9E12                        

      lda  $DC0D                        ; Interrupt control register CIA #1
      lda  $D019                        ; Interrupt indicator register
      and  #$01                         
      beq  W9E0F                        
      lda  $D011                        ; VIC control register
      cmp  #$1B                         
      beq  W9DFA                        
      ldx  #$1B                         
      ldy  #$14                         
      lda  #$20                         
      bne  W9E00                        
W9DFA:
      ldx  #$3B                         
      ldy  #$18                         
      lda  #$62                         
W9E00:
      stx  $D011                        ; VIC control register
      sty  $D018                        ; VIC memory control register
      sta  $D012                        ; Reading/Writing IRQ balance value
      lda  #$01                         
      sta  $D019                        ; Interrupt indicator register
      cli                               
W9E0F:
      jmp  WAA62                        

W9E12:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      cmp  $9C                          
      beq  W9E12                        
      sta  $9C                          
      cmp  #$DF                         
      beq  W9E29                        
      cmp  #$EF                         
      beq  W9E4D                        
      cmp  #$BF                         
      beq  W9E5B                        
      bne  W9E12                        
W9E29:
      ldx  #$03                         
      lda  $9B                          
      cmp  #$02                         
      bne  W9E3E                        
W9E31:
      lda  W9F3C,x                      
      sta  $470A,x                      
      dex                               
      bne  W9E31                        
      lda  #$01                         
      bne  W9E49                        
W9E3E:
      lda  W9F38,x                      
      sta  $470A,x                      
      dex                               
      bne  W9E3E                        
      lda  #$02                         
W9E49:
      sta  $9B                          
      bne  W9E12                        
W9E4D:
      sei                               
      lda  #$2B                         
      sta  $D011                        ; VIC control register
      lda  #$18                         
      sta  $D018                        ; VIC memory control register
      jmp  W89BE                        

W9E5B:
      ldy  $49                          
      dey                               
      lda  W9E6E,y                      
      sta  $49                          
      jsr  W8BDC                        
      lda  $C0DE                        
      sta  $D02A                        ; Color sprite 3
      bne  W9E12                        
W9E6E:
      .byte $02, $03, $04, $06, $06, $08, $08, $0A 
      .byte $0A, $0C, $0C, $0E, $0E, $10, $10, $01 
W9E7E:
      .byte $28
W9E7F:                                  
      .byte $45, $C0, $45, $D4, $45, $36, $46, $FE 
      .byte $46, $50, $47, $9D, $47, $CA, $47 
W9E8E:
      .byte $A6
W9E8F:
      .byte $9E, $AF, $9E, $B4, $9E, $B9, $9E, $D6 
      .byte $9E, $F2, $9E, $08, $9F, $25, $9F 
W9E9E:
      .byte $08, $04, $04, $1C, $1B, $15, $1C, $12 
      .byte $43, $48, $41, $52, $41, $43, $54, $45 
      .byte $52, $50, $4F, $4F, $4B, $41, $46, $59 
      .byte $47, $41, $52, $50, $12, $05, $13, $13 
      .byte $20, $46, $35, $20, $14, $0F, $20, $03 
      .byte $08, $01, $0E, $07, $05, $20, $04, $09 
      .byte $06, $06, $09, $03, $15, $0C, $14, $19 
      .byte $50, $12, $05, $13, $13, $20, $46, $33 
      .byte $20, $06, $0F, $12, $20, $4F, $4E, $45 
      .byte $20, $50, $0C, $01, $19, $05, $12, $20 
      .byte $47, $01, $0D, $05, $50, $12, $05, $13 
      .byte $13, $20, $46, $31, $20, $14, $0F, $20 
      .byte $53, $14, $01, $12, $14, $20, $47, $01 
      .byte $0D, $05, $28, $43, $29, $20, $31, $39 
      .byte $38, $32, $20, $4E, $01, $0D, $03, $0F 
      .byte $20, $28, $43, $29, $20, $31, $39, $38 
      .byte $33, $20, $41, $54, $41, $52, $49, $41 
      .byte $0C, $0C, $20, $52, $09, $07, $08, $14 
      .byte $13, $20, $52, $05, $13, $05, $12, $16 
      .byte $05, $04                    
W9F38:
      .byte $20, $4F, $4E, $45          
W9F3C:
      .byte $20, $54, $57, $4F, $00, $00, $00, $00 
      .byte $00, $00, $05, $0F, $3F, $3F, $3F, $3F 
      .byte $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F 
      .byte $00, $00, $00, $01, $05, $15, $55, $FF 
      .byte $FF, $FF, $BF, $AF, $AF, $AF, $9F, $5F 
      .byte $7F, $FF, $FF, $FF, $00, $05, $55, $55 
      .byte $55, $56, $6A, $AA, $EA, $FA, $FA, $FA 
      .byte $FA, $FA, $FA, $FA, $FA, $F8, $C0, $C0 
      .byte $55, $55, $55, $5A, $6A, $A5, $95, $B6 
      .byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE 
      .byte $FE, $FE, $FE, $30, $55, $5A, $AA, $A5 
      .byte $55, $5A, $A9, $AB, $AF, $BF, $BF, $BF 
      .byte $BF, $BF, $BF, $BF, $BF, $BF, $3F, $0F 
      .byte $00, $05, $55, $5A, $A9, $95, $55, $FF 
      .byte $FF, $FF, $EA, $A9, $AB, $AF, $AB, $A5 
      .byte $D5, $FF, $FF, $FF, $54, $68, $A5, $95 
      .byte $55, $55, $56, $FE, $FF, $FD, $55, $56 
      .byte $FE, $FF, $FF, $7F, $7F, $FF, $FE, $F8 
      .byte $04, $55, $55, $55, $59, $6A, $AA, $AA 
      .byte $9A, $5A, $6A, $AA, $AA, $AA, $AA, $AA 
      .byte $AA, $A2, $80, $00, $01, $42, $52, $55 
      .byte $55, $55, $A5, $AB, $AF, $AF, $AF, $AF 
      .byte $AF, $AF, $AF, $AF, $AF, $AF, $2F, $03 
      .byte $40, $54, $A5, $6A, $56, $55, $55, $FF 
      .byte $FF, $FF, $EF, $EB, $EB, $EB, $DB, $D7 
      .byte $DF, $FF, $FF, $FF, $54, $A5, $6A, $56 
      .byte $95, $A5, $6A, $EA, $FA, $FE, $FE, $FE 
      .byte $FE, $FE, $FE, $FE, $FE, $FE, $F0, $C0 
      .byte $00, $42, $56, $A5, $A9, $5A, $5E, $AE 
      .byte $BF, $BF, $BF, $BF, $BF, $BF, $BF, $BF 
      .byte $BF, $BF, $BF, $03, $55, $95, $A5, $6A 
      .byte $5A, $95, $A5, $AB, $AB, $AB, $AB, $AB 
      .byte $AB, $AB, $6B, $57, $DF, $FF, $FF, $FF 
      .byte $55, $55, $55, $55, $A5, $AA, $EA, $EA 
      .byte $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA 
      .byte $FA, $FA, $C2, $00, $00, $00, $50, $54 
      .byte $55, $55, $A5, $AF, $BF, $FF, $FF, $FE 
      .byte $FE, $FD, $FD, $FE, $FF, $FF, $FF, $3F 
      .byte $00, $00, $00, $00, $80, $54, $55, $FF 
      .byte $FF, $FF, $55, $95, $AF, $BF, $5F, $55 
      .byte $95, $FF, $FF, $FF, $00, $00, $00, $00 
      .byte $00, $00, $40, $F0, $FC, $F0, $00, $50 
      .byte $F0, $FC, $FC, $FC, $FC, $FC, $F0, $C0
WA094:
      lda  #$00                         
      sta  $42                          
      sta  $43                          
      sta  $44                          
      sta  $98                          
      sta  $56                          
      sta  $B9                          
      dec  $49                          
      lda  #$01                         
      sta  $3E                          
      lda  #$04                         
      sta  $4A                          
      jmp  WA0BC                        

WA0AF:
      lda  #$01                         
      sta  $98                          
      sta  $56                          
      dec  $56                          
WA0B7:
      ldx  #$50                         
      jsr  W9AB5                        
WA0BC:
      lda  #$2B                         
      sta  $D011                        ; VIC control register
      lda  #$06                         
      sta  $D021                        ; Background 0 color
      lda  #$00                         
      sta  $D020                        ; Border color
      sta  $D418                        ; Select volume and filter mode
      sta  $5F                          
      dec  $5F                          
      sta  $3B                          
      inc  $3B                          
      sta  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      sta  $D017                        ; (2X) vertical expansion (Y) sprite 0..7
      sta  $D015                        ; Sprites Abilitator
      dec  $D015                        ; Sprites Abilitator
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
      dec  $D01C                        ; Set multicolor mode for sprite 0..7
      sta  $5A                          ; Scratch for numeric operation
      sei                               
      ldx  #$FF                         
      txs                               
      jsr  WA616                        
      jsr  W8AE5+2                      
      lda  #$0E                         
      sta  $D02E                        ; Color sprite 7
      lda  $98                          ; Open files number/Index of files table
      beq  WA101                        ; BASIC ROM
      and  #$01                         
      beq  WA125                        
WA101:
      jsr  WA2B0+1                      
      jsr  W95DC                        
      jsr  WA241                        
      jsr  WA354+1                      
      jsr  W9631                        
      lda  $4A                          
      beq  WA125                        
      pha                               
      lda  #$00                         
      sta  $4A                          
      pla                               
WA11A:
      pha                               
      jsr  W95A7                        
      inc  $4A                          
      pla                               
      cmp  $4A                          
      bne  WA11A                        
WA125:
      jsr  WA3E8                        
      jsr  W8BDC                        
      jsr  W99A2                      
      lda  #$01                         
      sta  $3B                          
      jsr  WA857+2                      
      lda  #$00                         
      sta  $4D                          
      sta  $7E                          
      sta  $7F                          
      sta  $CC00                        
      sta  $59                          
      sta  $5B                          
      sta  $60                          
      sta.w  $00D0                        
      lda  #$FF                         
      sta  $0314                        
      lda  #$A9                         
      sta  $0315                        
      lda  #$FB                         
      sta  $D012                        
      lda  $BA                          
      beq  WA18A                        
      lda  #$00                         
      sta  $BA                          
      lda  #$1B                         
      sta  $0A                          
WA164:
      ldy  $0A                          
      cpy  #$20                         
      beq  WA177                        
      jsr  W9AD1                        
      ldx  W9C0A,y                      
      jsr  W9ABD                        
      inc  $0A                          
      bne  WA164                        
WA177:
      lda  #$02                         
      sta  $3F33                        
      dec  $3F3E                        
      lda  $9B                          
      cmp  #$02                         
      beq  WA18A                        
      lda  #$00                         
      sta  $3F3F                        
WA18A:
      lda  #$01                         
      sta  $D01A                        
      sta  $D019                        
      cli                               
      lda  $DC0D                        ; Interrupt control register CIA #1
      lda  $98                          
      bne  WA19F                        
      lda  #$3B                         
      sta  $D011                        ; VIC control register
WA19F:
      lda  #$24                         
      sta  $47FF                        
      lda  #$80                         
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  #$3C                         
      sta  $D00E                        ; Position X sprite 7
      lda  #$41                         
      sta  $D00F                        ; Position Y sprite 7
WA1B3:
      jsr  W8294                        
      jsr  WA234                        
      lda  $D00E                        ; Position X sprite 7
      cmp  #$A2                         
      bne  WA1B3                        
WA1C0:
      jsr  W8311                        
      jsr  WA234                        
      lda  $D00F                        ; Position Y sprite 7
      cmp  #$8E                         
      bne  WA1C0                        ; BASIC ROM
      lda  #$3B                         
      sta  $D011                        ; VIC control register
      lda  #$01                         
      sta  $2D                          
      lda  #$20                         
      sta  $47FF                        
      lda  $98                          
      bpl  WA1E4                        
      dec  $4A                          
      jsr  W959C                        
WA1E4:
      lda  #$80                         
      sta  $98                          
      jmp  W8086                        

WA1EB:
      .byte $00, $00, $00, $00, $F2     
WA1F0:                                  
      .byte $80, $48, $DC, $C4, $00     
WA1F5:
      lda  #$1B                         
      sta  $0A                          
WA1F9:
      ldy  $0A                          
      cpy  #$20                         
      beq  WA233                        
      jsr  W9AD1                        
      tya                               
      sec                               
      sbc  #$1B                         
      tay                               
      lda  WA1EB,y                      
      sta  $08                          
      lda  WA1F0,y                      
      sta  $09                          
      ldy  #$00                         
WA213:
      lda  ($03),y                      
      pha                               
      lda  ($05),y                      
      sta  ($03),y                      
      pla                               
      sta  ($05),y                      
      jsr  W8BCD+1                      
      jsr  W8BD5                        
      lda  $03                          
      cmp  $08                          
      bne  WA213                        
      lda  $04                          
      cmp  $09                          
      bne  WA213                        
      inc  $0A                          
      bne  WA1F9                        
WA233:
      rts                               

WA234:
      lda  $98                          
      bne  WA23C                        
      lda  #$02                         
      sta  $5B                          
WA23C:
      lda  $5B                          
      bne  WA23C                        
      rts                               

WA241:
      lda  #$0B                         
      sta  $0A                          
WA245:
      lda  $0A                          
      cmp  #$0F                         
      beq  WA253                        
      tay                               
      jsr  W9AE6                        
      inc  $0A                          
      bne  WA245                        
WA253:
      lda  #$00                         
      sta  $0A                          
WA257:
      jsr  WA288                        
      ldy  $0A                          
      lda  ($03),y                      
      sta  $02                          
      tya                               
      clc                               
      adc  #$2C                         
      tay                               
      jsr  W9AD1                        
      jsr  W9AEE                        
      lda  $02                          
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      sta  $02                          
      lda  $0A                          
      cmp  #$03                         
      beq  WA287                        
      clc                               
      adc  #$30                         
      tay                               
      jsr  W9AD1                        
      jsr  W9AEE                        
      inc  $0A                          
      bne  WA257                        
WA287:
      rts                               

WA288:
      lda  $49                          
      and  #$0C                         
      lsr                               
      cmp  #$06                         
      bne  WA293                        
      lda  #$00                         
WA293:
      tay                               
      lda  WA29F,y                      
      sta  $03                          
      lda  WA29F+1,y                    
      sta  $04                          
      rts                               

WA29F:
      lda  $A2                          
      lda  #$A2                         
      lda  $71A2                        
      sta  ($21,x)                      
      sta  ($11),y                      
      sbc  ($31),y                      
      sbc  ($F1,x)                      
      and  ($71,x)                      
WA2B0:
      eor  ($A0),y                      
      slo  ($20),y                      
      inc  $9A                          
      jsr  W9537                        
      lda  #$0B                         
      sta  $17                          
      lda  #$19                         
      sta  $15                          
      lda  #$00                         
      sta  $16                          
      tay                               
      jsr  WA322                        
      ldy  #$01                         
      jsr  WA322                        
      ldy  #$02                         
      jsr  WA322                        
      lda  #$00                         
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  #$18                         
      sta  $D00E                        ; Position X sprite 7
      lda  #$41                         
      sta  $D00F                        ; Position Y sprite 7
      jsr  W9755                        
WA2E5:
      jsr  W9742                        
      jsr  W844D                        
      lda  $D00E                        ; Position X sprite 7
      cmp  #$44                         
      bne  WA2E5                        
      lda  $D010                        ; Position X MSB sprites 0..7
      and  #$80                         
      beq  WA2E5                        
      lda  #$38                         
      jsr  W9A4B                        
      lda  #$3B                         
      jsr  W9A75                        
      lda  #$68                         
      jsr  W9A75                        
      lda  #$90                         
      jsr  W9A75                        
      rts                               

      lda  #$00                         
      sta  $0A                          
      ldy  $0A                          
WA314:
      lda  ($03),y                      
      jsr  W9C3E                        
      inc  $0A                          
      ldy  $0A                          
      cpy  #$0E                         
      bne  WA314                        
      rts                               

WA322:
      lda  WA34C,y                      
      sta  $0A                          
      lda  WA34D+2,y                    
      sta  $03                          
      lda  WA352,y                      
      sta  $04                          
WA331:
      lda  #$9C                         
      sta  $18                          
      ldy  #$00                         
      jsr  W9C2A                        
      lda  $03                          
      clc                               
      adc  #$0B                         
      sta  $03                          
      bcc  WA345                        
      inc  $04                          
WA345:
      inc  $16                          
      dec  $0A                          
      bne  WA331                        
      rts                               

WA34C:
      clc                               
WA34D:
      asl.w  $0002                        
      asl  $08,x                        
WA352:
      iny                               
      iny                               
WA354:
      cmp  #$20                         
      cld                               
      ldx  $E0                          
      ora  ($D0,x)                      
      ora  ($CA,x)                      
      stx  $97                          
WA35F:
      lda  WA5B5,x                      
      sta  $90                          
      txa                               
      pha                               
      asl                               
      tax                               
      lda  WA5C5,x                      
      sta  $95                          
      lda  WA5C5+1,x                    
      sta  $96                          
      pla                               
      tax                               
      ldy  WA481,x                      
      sty  $94                          
WA379:
      lda  #$00                         
      sta  $D010                        
      jsr  WA45E                        
      asl  $90                          
      bcc  WA3AF                        
      ldx  $92                          
      lda  W9900,x                      
      clc                               
      adc  #$07                         
      sta  $D00F                        
      jsr  WA46F                        
      sta  $D00E                        
      ldx  #$08                         
WA398:
      dec  $D00F                        
      jsr  W97FD                        
      dex                               
      bne  WA398                        
      ldx  #$15                         
WA3A3:
      inc  $D00F                        
      jsr  W980C                        
      dex                               
      bne  WA3A3                        
      jmp  WA3D9                        

WA3AF:
      jsr  WA46F                        
      clc                               
      adc  #$04                         
      bcc  WA3BA                        
      jsr  WA456                        
WA3BA:
      sta  $D00E                        ; Position X sprite 7
      ldx  $92                          ; Constant (timeout) of time misure for tape
      lda  W9900,x                      
      sta  $D00F                        ; Position Y sprite 7
      jsr  W9755                        
      jsr  W8477                        
      lda  #$15                         
      sta  $2C                          ; Pointer: BASIC starting programs
WA3CF:
      jsr  W9742                        
      jsr  W8435                        
      dec  $2C                          
      bne  WA3CF                        
WA3D9:
      dec  $94                          
      bpl  WA379                        
      ldx  $97                          
      bne  WA3E7                        
      inx                               
      stx  $97                          
      jmp  WA35F                        

WA3E7:
      rts                               

WA3E8:
      jsr  WA6D8                        
      stx  $97                          
      lda  $98                          
      bmi  WA3F4                        
      jsr  WA604+1                      
WA3F4:
      lda  $97                          
      asl                               
      tax                               
      lda  WA5E5,x                      
      sta  $95                          
      lda  WA5E6,x                      
      sta  $96                          
      ldy  #$0D                         
      sty  $94                          
      ldy  #$15                         
      sty  $99                          
WA40A:
      lda  #$00                         
      sta  $D010                        ; Position X MSB sprites 0..7
      dec  $94                          ; Flag: Serail Bus - Bufferized char in out
      jsr  WA45E                        
      ldx  $92                          
      ldy  $99                          
      lda  $98                          
      bpl  WA421                        
      lda  $C000,y                      
      beq  WA449                        
WA421:
      lda  W9900,x                      
      cpx  #$00                         
      bne  WA429                        
      txa                               
WA429:
      sta  $C000,y                      
      beq  WA438                        
      cpy  #$07                         
      bpl  WA438                        
      sec                               
      sbc  #$02                         
      sta  $C000,y                      
WA438:
      jsr  WA46F                        
      cpx  #$00                         
      bne  WA440                        
      txa                               
WA440:
      sta  $C040,y                      
      jsr  W9A41                        
      sta  $C080,y                      
WA449:
      cpy  #$08                         
      bcc  WA44E                        
      dey                               
WA44E:
      dey                               
      sty  $99                          
      cpy  #$01                         
      bne  WA40A                        
      rts                               

WA456:
      pha                               
      lda  #$80                         
      sta  $D010                        
      pla                               
      rts                               

WA45E:
      ldy  $94                          
      lda  ($95),y                      
      pha                               
      and  #$0F                         
      sta  $92                          
      pla                               
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      sta  $93                          
      rts                               

WA46F:
      lda  #$00                         
      sta  $D010                        
      ldx  $93                          
      cpx  #$0B                         
      bmi  WA47D                        
      jsr  WA456                        
WA47D:
      lda  W98F2,x                      
      rts                               

WA481:
      .byte $06, $01, $05, $05, $05, $06, $05, $04 
      .byte $06, $06, $06, $05, $05, $05, $05, $06 
      .byte $12, $14, $92, $A2, $99, $9B, $2A, $3A 
      .byte $57, $A3, $16, $57, $19, $69, $AB, $A2 
      .byte $73, $15, $57, $59, $8C, $33, $73, $57 
      .byte $B7, $3A, $7C, $92, $13, $53, $A6, $57 
      .byte $29, $AA, $33, $25, $57, $98, $19, $5B 
      .byte $52, $93, $57, $29, $8B, $13, $53, $94 
      .byte $57, $28, $9A, $4C, $43, $85, $C5, $57 
      .byte $59, $1B, $AB, $B2, $74, $35, $96, $57 
      .byte $3A, $9B, $34, $94, $16, $C6, $57, $29 
      .byte $24, $C4, $75, $57, $9A, $3B, $93, $35 
      .byte $B6, $57, $5A, $AC, $33, $73, $C4, $57 
      .byte $98, $3A, $A2, $53, $96, $17, $57, $59 
      .byte $79, $00, $00, $43, $A9, $3B, $00, $12 
      .byte $B2, $9C, $00, $00, $00, $3A, $00, $22 
      .byte $83, $C8, $4B, $00, $26, $79, $1A, $00 
      .byte $00, $B3, $BB, $00, $22, $B6, $39, $CB 
      .byte $00, $74, $25, $5A, $00, $00, $B2, $9C 
      .byte $A2, $24, $B5, $38, $CB, $00, $33, $74 
      .byte $8C, $00, $00, $B7, $4A, $82, $C3, $26 
      .byte $5A, $AB, $00, $23, $93, $54, $00, $A7 
      .byte $39, $BA, $00, $72, $A6, $69, $2B, $00 
      .byte $00, $43, $43, $26, $A8, $29, $6B, $00 
      .byte $82, $15, $C6, $BA, $52, $53, $A3, $29 
      .byte $00, $B3, $39, $AB, $00, $35, $C6, $59 
      .byte $7B, $54, $54, $A4, $5C, $00, $23, $2A 
      .byte $AA, $72, $B3, $17, $97, $5B, $44, $95 
      .byte $95, $C6, $69, $2B, $2B, $BB, $00, $33 
      .byte $17, $B8, $7B, $B2, $B2, $84, $AB, $84 
      .byte $36, $96, $4A, $00, $23, $A3, $5A, $BB 
      .byte $44, $26, $26, $96, $44, $96, $C6, $2A 
      .byte $00, $83, $A7, $18, $9C, $34, $85, $85 
      .byte $C5, $34, $AA, $AA, $4B, $00, $82, $13 
      .byte $2A, $9B, $A3, $36, $B6, $B6, $7A, $7A 
      .byte $AC, $AC, $00, $13, $A4, $28, $8B, $83 
      .byte $83, $34, $C5, $34, $A8, $4A, $4A, $00 
      .byte $83, $15, $99, $3B, $B2, $53, $53, $A6 
      .byte $27, $27, $5A, $7A          
WA5B5:
      .byte $66, $00, $20, $48, $28, $1A, $08, $08 
      .byte $24, $0A, $1A, $A8, $08, $18, $14, $C4 
WA5C5:
      .byte $91
      ldy  $98                          ; Open files number/Index of files table
      ldy  $9A                          
      ldy  $A0                          
      ldy  $A6                          
      ldy  $AC                          
      ldy  $B3                          
      ldy  $B9                          
      ldy  $BE                          
      ldy  $C5                          
      ldy  $CC                          
      ldy  $D3                          
      ldy  $D9                          
      ldy  $DF                          
      ldy  $E5                          
      ldy  $EB                          
      .byte $A4                         
WA5E5:
      .byte $00
WA5E6:
      .byte $00, $F2                    
      ldy  $FF                          
      ldy  $0C                          
      lda  $19                          
      lda  $26                          
      lda  $33                          
      lda  $40                          
      lda  $4D                          
      lda  $5A                          
      lda  $67                          
      lda  $74                          
      lda  $81                          
      lda  $8E                          
      lda  $9B                          
      lda  $A8                          
WA604:
      lda  $A0                          
      ora  $A9,x                        
      brk                               
WA609:
      sta  $C001,y                      
      sta  $C041,y                      
      sta  $C081,y                      
      dey                               
      bne  WA609                        
      rts                               

WA616:
      lda  $98                          
      bmi  WA61F                        
      ldy  #$0F                         
      jsr  W9AE6                        
WA61F:
      ldy  #$10                         
      jsr  W9AE6                        
      ldy  #$11                         
      jsr  W9AE6                        
      ldx  #$04                         
      lda  #$1F                         
      sta  $0A                          
WA62F:
      lda  #$C0                         
      sta  $04                          
      sta  $06                          
      lda  #$C0                         
      sta  $03                          
      clc                               
      adc  $0A                          
      sta  $05                          
      lda  WA6BD,x                      
      sta  $02                          
      jsr  W9AEE                        
      lda  #$C1                         
      sta  $04                          
      sta  $06                          
      lda  #$00                         
      sta  $03                          
      clc                               
      adc  $0A                          
      sta  $05                          
      lda  WA6C1,x                      
      sta  $02                          
      jsr  W9AEE                        
      lda  $0A                          
      sec                               
      sbc  #$08                         
      sta  $0A                          
      dex                               
      bne  WA62F                        
      ldy  #$00                         
      ldx  #$01                         
WA66B:
      lda  #$FF                         
      sta  $C0C0,x                      
      lda  WA6C6,y                      
      sta  $C000,x                      
      lda  WA6CC,y                      
      sta  $C040,x                      
      lda  WA6D2,y                      
      sta  $C080,x                      
      iny                               
      dex                               
      php                               
      cpx  #$1C                         
      beq  WA690                        
      plp                               
      bpl  WA66B                        
      ldx  #$20                         
      bpl  WA66B                        
WA690:
      plp                               
      lda  #$74                         
      sta  $C11D                        
      lda  #$00                         
      sta  $C0DD                        
      lda  #$52                         
      sta  $C11E                        
      ldx  #$06                         
      ldy  #$03                         
WA6A4:
      lda  WA6B6,y                      
      sta  $C147,x                      
      lda  WA6BA,y                      
      sta  $C14F,x                      
      dex                               
      dex                               
      dey                               
      bpl  WA6A4                        
      rts                               

WA6B6:                                  
      .byte $10, $0C, $07, $04          
WA6BA:                                  
      .byte $14, $0E, $0B               
WA6BD:
      .byte $08, $0C, $07, $05          
WA6C1:
      .byte $07, $4E, $30, $32, $00     
WA6C6:                                  
      .byte $36, $E5, $0B, $3B, $00, $00
WA6CC:                                  
      .byte $B6, $81, $77, $DB, $A2, $B2
WA6D2:
      .byte $AA, $A8, $BA, $AA, $00, $00
WA6D8:
      lda  $49                          
WA6DA:
      cmp  #$10                         
      bcc  WA6E4                        
      sec                               
      sbc  #$04                         
      jmp  WA6DA                        

WA6E4:
      tax                               
      rts                               

WA6E6:
      .byte $FD, $EE, $FE, $07          
WA6EA:
      .byte $89, $A6, $A6, $A7, $00, $02, $08, $20 
      .byte $28, $2A, $80, $A0, $A8, $AA, $0A, $8A 
      .byte $22, $82, $A2, $88, $00, $FF, $0F, $3F 
      .byte $FC, $F0, $03, $C0, $F3, $0A, $28, $A0 
      .byte $02, $80, $00, $2A, $A8, $20, $08 
WA711:
      .byte $A0, $39, $20, $A5, $A7, $A0, $3A, $20 
      .byte $A5, $A7, $20, $CE, $8B, $A0, $03, $20 
      .byte $AD, $A7, $20, $DF, $A7, $A0, $12, $20 
      .byte $E6, $9A, $A9, $00, $A8     
WA72E:
      ldx  W98F2,y                      
      sta  $0E00,x                      
      iny                               
      cpy  #$0B                         
      bmi  WA72E                        
      lda  #$01                         
      cpy  #$0E                         
      bmi  WA72E                        
      lda  #$00                         
      tay                               
WA742:
      ldx  W9900,y                      
      sta  $0F00,x                      
      iny                               
      cpy  #$0F                         
      bmi  WA742                        
      ldy  #$00                         
WA74F:
      lda  #$00                         
      sta  $AD                          
      tya                               
      asl                               
      rol  $AD                          
      asl                               
      rol  $AD                          
      asl                               
      rol  $AD                          
      sta  $0B00,y                      
      lda  $AD                          
      sta  $0B40,y                      
      iny                               
      cpy  #$39                         
      bmi  WA74F                        
      lda  #$00                         
      sta  $0A                          
WA76E:
      lda  $0A                          
      asl                               
      tax                               
      asl                               
      asl                               
      tay                               
      lda  W9C8A,x                      
      sta  $0D00,y                      
      lda  W9C89,x                      
      sta  $0C00,y                      
      ldx  #$00                         
WA783:
      iny                               
      clc                               
      adc  #$01                         
      sta  $0C00,y                      
      pha                               
      lda  $0CFF,y                      
      sta  $0D00,y                      
      pla                               
      inx                               
      cpx  #$08                         
      bmi  WA783                        
      inc  $0A                          
      ldy  $0A                          
      cpy  #$18                         
      bmi  WA76E                        
      lda  #$20                         
      sta  $C2CF                        
      rts                               

WA7A5:
      jsr  W9AD1                        
      tya                               
      sec                               
      sbc  #$38                         
      tay                               
      lda  WA6E6,y                      
      sta  $19                          
      lda  WA6EA,y                      
      sta  $1A                          
WA7B7:
      ldy  #$00                         
      lda  ($03),y                      
      cmp  #$FF                         
      beq  WA7D3                        
      tax                               
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      jsr  WA7D4                        
      txa                               
      and  #$0F                         
      jsr  WA7D4                        
      jsr  W8BCD+1                      
      jmp  WA7B7                        

WA7D3:
      rts                               

WA7D4:
      tay                               
      lda  ($19),y                      
      ldy  #$00                         
      sta  ($05),y                      
      jsr  W8BD5                        
      rts                               

      ldy  #$1A                         
      jsr  W9AE6                        
      ldy  #$3B                         
      jsr  W9AD1                        
      ldy  #$00                         
WA7EB:
      lda  #$05                         
      sta  $0A                          
      jsr  WA81E                        
      lda  #$02                         
      sta  $2A                          
WA7F6:
      lda  #$03                         
      sta  $0A                          
      lda  $03                          
      sec                               
      sbc  #$03                         
      sta  $03                          
      bcs  WA805                        
      dec  $04                          
WA805:
      jsr  WA81E                        
      dec  $2A                          
      bne  WA7F6                        
      lda  $05                          
      sec                               
      sbc  #$04                         
      sta  $05                          
      bcs  WA817                        
      dec  $06                          
WA817:
      lda  ($03),y                      
      cmp  #$FF                         
      bne  WA7EB                        
      rts                               

WA81E:
      lda  ($03),y                      
      sta  ($05),y                      
      jsr  W8BCD+1                      
      jsr  W8BD5                        
      jsr  W8BD5                        
      dec  $0A                          
      bne  WA81E                        
      rts                               

      .byte $6E, $23, $2D, $28, $23, $7D, $3C, $46 
      .byte $41, $3C, $78, $73, $5F, $5A, $55, $64 
      .byte $69, $0A, $14, $0F, $04, $0A, $0F, $14 
      .byte $0A, $19, $1E, $23, $28, $2D, $32, $37 
      .byte $3C, $41, $46, $4B, $50, $55, $5A 
WA857:                                  
      .byte $5F, $FF                    
      lda  #$21                         
      sta  $4C                          
      ldx  #$FF                         
      stx  $CD00                        
      inx                               
      stx  $4B                          
      stx  $66                          
      stx  $4D                          
      stx  $CC00                        
WA86C:
      dex                               
      txa                               
      inx                               
      sta  $C240,x                      
      inx                               
      txa                               
      sta  $C1FF,x                      
      cmp  $4C                          
      bmi  WA86C                        
      lda  #$FF                         
      sta  $C1FF,x                      
      rts                               

      lda  #$06                         
      sta  $D021                        
WA886:
      lda  $66                          
      sta  $4B                          
      tax                               
      stx  $62                          
WA88D:
      ldy  $C200,x                      
      cpy  #$FF                         
      bne  WA897                        
      jmp  WA92D                        

WA897:
      lda  $C000,y                      
      cmp  $C000,x                      
      bcc  WA8A4                        
      tya                               
      tax                               
      jmp  WA88D                        

WA8A4:
      stx  $62                          
      sty  $63                          
      sty  $64                          
      ldx  $64                          
WA8AC:
      ldy  $C200,x                      
      cpy  #$FF                         
      beq  WA8C0                        
      lda  $C000,x                      
      cmp  $C000,y                      
      bne  WA8C0                        
      tya                               
      tax                               
      jmp  WA8AC                        

WA8C0:
      stx  $64                          
      ldx  $62                          
      stx  $65                          
WA8C6:
      ldx  $65                          
      ldy  $C240,x                      
      cpy  #$FF                         
      beq  WA8D9                        
      cmp  $C000,x                      
      bcs  WA8D9                        
      sty  $65                          
      jmp  WA8C6                        

WA8D9:
      ldx  $64                          
      lda  $C200,x                      
      ldy  $62                          
      sta  $C200,y                      
      tax                               
      cpx  #$FF                         
      beq  WA8EF                        
      tya                               
      sta  $C240,x                      
      jmp  WA8F1                        

WA8EF:
      sty  $4C                          
WA8F1:
      ldx  $64                          
      lda  $C000,x                      
      ldy  $65                          
      cmp  $C000,y                      
      bcc  WA919                        
      lda  $C200,y                      
      sta  $C200,x                      
      lda  $63                          
      sta  $C200,y                      
      txa                               
      ldy  $C200,x                      
      sta  $C240,y                      
      lda  $65                          
      ldy  $63                          
      sta  $C240,y                      
      jmp  WA92A                        

WA919:
      tya                               
      sta  $C200,x                      
      txa                               
      sta  $C240,y                      
      lda  #$FF                         
      ldx  $63                          
      sta  $C240,x                      
      stx  $4B                          
WA92A:
      jmp  WA88D                        

WA92D:
      lda  $4B                          
      sta  $66                          
      ldx  $4B                          
WA933:
      lda  $C000,x                      
      bne  WA940                        
      ldy  $C200,x                      
      tya                               
      tax                               
      jmp  WA933                        

WA940:
      stx  $4B                          
      lda  $59                          
      bne  WA953                        
      lda  #$06                         
      asl                               
      tay                               
      lda  #$00                         
WA94C:
      sta  $D001,y                      
      dey                               
      dey                               
      bpl  WA94C                        
WA953:
      ldx  #$00                         
      stx  $4E                          
      stx  $52                          
      lda  $4B                          
      sta  $4F                          
      sta  $50                          
      lda  #$06                         
      sta  $51                          
WA963:
      ldy  $50                          
      lda  $C0C0,y                      
      bmi  WA9D4                        
      bit  $52                          
      bmi  WA98E                        
      tya                               
      sta  $CC00,x                      
      lda  $51                          
      sta  $CD00,x                      
      lda  #$00                         
      sta  $CAFF,x                      
      inx                               
      dec  $51                          
      bpl  WA9D4                        
      lda  #$06                         
      sta  $51                          
      lda  $52                          
      ora  #$80                         
      sta  $52                          
      jmp  WA9D4                        

WA98E:
      ldy  $4F                          
      cpy  #$FF                         
      beq  WA9E2                        
      lda  $C200,y                      
      sta  $4F                          
      lda  $C0C0,y                      
      bpl  WA9B4                        
      lda  #$FF                         
      sta  $CD00,x                      
      tya                               
      sta  $CC00,x                      
      lda  $C000,y                      
      clc                               
      adc  #$15                         
      sta  $CAFF,x                      
      inx                               
      jmp  WA98E                        

WA9B4:
      lda  $50                          
      cmp  #$FF                         
      beq  WA98E                        
      sta  $CC00,x                      
      lda  $51                          
      sta  $CD00,x                      
      dec  $51                          
      bpl  WA9CA                        
      lda  #$06                         
      sta  $51                          
WA9CA:
      lda  $C000,y                      
      clc                               
      adc  #$15                         
      sta  $CAFF,x                      
      inx                               
WA9D4:
      ldy  $50                          
      bmi  WA98E                        
      lda  $C200,y                      
      sta  $50                          
      bmi  WA98E                        
      jmp  WA963                        

WA9E2:
      lda  #$00                         
      sta  $4D                          
WA9E6:
      ldx  $4D                          
      lda  $CD00,x                      
      bmi  WA9F8                        
      ldy  $CC00,x                      
      jsr  WAA6B                        
      inc  $4D                          
      jmp  WA9E6                        

WA9F8:
      lda  $CAFF,x                      
      sta  $D012                        
      rts                               

      cld                               
      lda  $DC0D                        
      lda  $D019                        
      and  #$01                         
      bne  WAA0D                        
      jmp  WAA62                        

WAA0D:
      ldx  $4D                          
      lda  $CB00,x                      
      inc  $4D                          
      sta  $D012                        
      lda  #$01                         
      sta  $D019                        
      ldy  $CC00,x                      
      lda  $CD00,x                      
      bmi  WAA2A                        
      jsr  WAA6B                        
      jmp  WAA58                        

WAA2A:
      lda  $C040,y                      
      sta  $21                          
      lda  $C080,y                      
      sta  $22                          
      tya                               
      pha                               
      ldy  #$00                         
WAA38:
      lda  WA6CC,y                      
      cmp  $21                          
      beq  WAA46                        
      iny                               
      cpy  #$04                         
      beq  WAA4D                        
      bne  WAA38                        
WAA46:
      lda  WA6D2,y                      
      cmp  $22                          
      beq  WAA52                        
WAA4D:
      pla                               
      sei                               
      jmp  WA886                        

WAA52:
      pla                               
      tay                               
      jsr  WAA68                        
      sei                               
WAA58:
      ldx  $4D                          
      lda  $CAFF,x                      
      cmp  $D012                        
      bcc  WAA0D                        
WAA62:
      pla                               
      tay                               
      pla                               
      tax                               
      pla                               
      rti                               

WAA68:
      jmp  ($0021)                      

WAA6B:
      lda  $45                          
      beq  WAA70                        
      rts                               

WAA70:
      lda  $CD00,x                      
      sta  $4E                          
      tax                               
      lda  $C0C0,y                      
      sta  $D027,x                      
      lda  $C080,y                      
      php                               
      lda  $D010                        
      and  WAAA6,x                      
      plp                               
      beq  WAA8C                        
      ora  WAAAE,x                      
WAA8C:
      sta  $D010                        
      lda  $C100,y                      
      sta  $47F8,x                      
      asl  $4E                          
      ldx  $4E                          
      lda  $C000,y                      
      sta  $D001,x                      
      lda  $C040,y                      
      sta  $D000,x                      
      rts                               

WAAA6:
      .byte $FE, $FD, $FB, $F7, $EF, $DF
WAAAC:
      .byte $BF, $7F                    
WAAAE:
      .byte $01, $02, $04, $08, $10, $20, $40, $80 
      .byte $AD, $12, $D0, $C9, $4B, $F0, $F9, $A9 
      .byte $00, $8D, $21, $D0, $A5, $5B, $F0, $02 
      .byte $C6, $5B                    
      lda  $5D                          
      bmi  WAACE                        
      dec  $5D                          
WAACE:
      lda  $60                          
      beq  WAAD4                        
      dec  $60                          
WAAD4:
      lda  $B9                          
      eor  #$FF                         
      sta  $B9                          
      rts                               

      lda  $DC0D                        
      cli                               
      ldx  #$02                         
WAAE1:
      lda  $C000,x                      
      beq  WAAE9                        
      jsr  WB599                        
WAAE9:
      inx                               
      cpx  #$07                         
      bne  WAAE1                        
      lda  #$00                         
      sta  $7D                          
      sta  $58                          
      lda  $7E                          
      sta  $7C                          
      ldx  #$07                         
WAAFA:
      lda  $C000,x                      
      beq  WAB0C                        
      lda  $C100,x                      
      cmp  #$52                         
      beq  WAB0C                        
      cmp  #$2F                         
      beq  WAB0C                        
      inc  $58                          
WAB0C:
      inx                               
      inx                               
      cpx  #$17                         
      bmi  WAAFA                        
      ldx  #$07                         
WAB14:
      jsr  WABA9                        
      inx                               
      inx                               
      cpx  #$0F                         
      bne  WAB21                        
      lda  $7F                          
      sta  $7C                          
WAB21:
      cpx  #$17                         
      bmi  WAB14                        
      ldy  $54                          
      beq  WAB58                        
      lda  $C180,y                      
      cmp  #$80                         
      bne  WAB58                        
      lda  $D00F                        
      sec                               
      sbc  $C000,y                      
      bcc  WAB58                        
      sbc  #$08                         
      bcc  WAB58                        
      cmp  #$04                         
      bpl  WAB58                        
      lda  $C040,y                      
      clc                               
      adc  #$14                         
      sec                               
      sbc  $D00E                        
      cmp  #$2A                         
      bcs  WAB58                        
      lda  #$72                         
      sta  $47FF                        
      lda  #$01                         
      sta  $6D                          
WAB58:
      lda  $3B                          
      bne  WABA8                        
      lda  $79                          
      bne  WAB65                        
      lda  #$02                         
      sta  $79                          
      rts                               

WAB65:
      dec  $79                          
      lda  $5F                          
      php                               
      eor  #$FE                         
      sta  $5F                          
      plp                               
      bmi  WAB8D                        
      lda  $7E                          
      sta  $7C                          
      ldx  #$07                         
WAB77:
      jsr  WAFAB                        
      inx                               
      inx                               
      cpx  #$0F                         
      bmi  WAB77                        
      inc  $7E                          
      lda  $7E                          
      cmp  #$08                         
      bne  WAB8C                        
      lda  #$00                         
      sta  $7E                          
WAB8C:
      rts                               

WAB8D:
      lda  $7F                          
      sta  $7C                          
      ldx  #$0F                         
WAB93:
      jsr  WAFAB                        
      inx                               
      inx                               
      cpx  #$17                         
      bmi  WAB93                        
      inc  $7F                          
      lda  $7F                          
      cmp  #$08                         
      bne  WABA8                        
      lda  #$00                         
      sta  $7F                          
WABA8:
      rts                               

WABA9:
      lda  $DC0D                        
      cli                               
      ldy  $54                          
      beq  WAC1F                        
      lda  $C180,y                      
      cmp  #$80                         
      bne  WAC1F                        
      jsr  WABEB                        
      lda  $AE                          
      sec                               
      sbc  $C000,y                      
      bcc  WAC1F                        
      sbc  #$08                         
      bcc  WAC1F                        
      cmp  #$04                         
      bpl  WAC1F                        
      lda  $C040,y                      
      clc                               
      adc  #$14                         
      sec                               
      sbc  $AF                          
      cmp  #$28                         
      bcs  WAC1F                        
      lda  $C100,x                      
      ldy  #$00                         
WABDD:
      cmp  WAF7B,y                      
      beq  WABF8                        
      iny                               
      cpy  #$20                         
      bne  WABDD                        
      inc  $C000,x                      
      rts                               

WABEB:
      lda  $C040,x                      
      sta  $AF                          
      lda  $C000,x                      
      sta  $AE                          
      jmp  WB7D1+2                      

WABF8:
      tya                               
      and  #$0F                         
      tay                               
      lda  #$00                         
      sta  $C001,x                      
      cpx  $5A                          
      bne  WAC0C                        
      tya                               
      pha                               
      jsr  WB010                        
      pla                               
      tay                               
WAC0C:
      lda  #$00                         
      sta  $C2C0,x                      
      lda  WAF9B,y                      
      sta  $C100,x                      
      inc  $55                          
      ldy  $55                          
      txa                               
      sta  $CF20,y                      
WAC1F:
      jsr  WAEBB                        
      lda  $82                          
      bne  WAC27                        
      rts                               

WAC27:
      jsr  WABEB                        
      lda  $A5                          
      cmp  $82                          
      bcc  WAC31                        
      rts                               

WAC31:
      clc                               
      adc  #$0B                         
      adc  $C300,x                      
      cmp  $82                          
      bcs  WAC3C                        
      rts                               

WAC3C:
      lda  $2D                          
      cmp  #$02                         
      php                               
      lda  $A6                          
      plp                               
      bpl  WAC4B                        
      dec  $A6                          
      clc                               
      adc  #$01                         
WAC4B:
      cmp  $80                          
      bcc  WAC52                        
      beq  WAC52                        
      rts                               

WAC52:
      clc                               
      adc  #$02                         
      cmp  $80                          
      bcs  WAC5A                        
      rts                               

WAC5A:
      lda  $57                          
      bne  WAC5F                        
      rts                               

WAC5F:
      lda  $7D                          
      beq  WAC64                        
      rts                               

WAC64:
      lda  #$01                         
      sta  $7D                          
      lda  $83                          
      beq  WAC89                        
      lda  $C2C1,x                      
      cmp  #$30                         
      bpl  WAC81                        
      lda  $47FF                        
      cmp  #$10                         
      bpl  WAC81                        
      and  #$01                         
      beq  WAC81                        
      jsr  WACF8                        
WAC81:
      lda  $C2C1,x                      
      cmp  #$20                         
      bmi  WAC89                        
      rts                               

WAC89:
      lda  #$D0                         
      sta  $AC                          
      lda  #$AC                         
      sta  $AD                          
      lda  #$0A                         
      sta  $51                          
      jsr  WAE92                        
      lda  #$C8                         
      sta  $AC                          
      lda  #$AC                         
      sta  $AD                          
      lda  #$00                         
      sta  $52                          
      tay                               
      lda  #$04                         
      sta  $51                          
      lda  $C100,x                      
      sec                               
      sbc  #$04                         
      jsr  WAE9A                        
      rts                               

      lda  #$00                         
      sta  $C000,x                      
      sta  $C001,x                      
      rts                               

WACBC:                                  
      .byte $30, $32, $31, $33, $3A, $3B, $3C, $3E 
      .byte $40, $42, $44, $46, $A9, $00, $9D, $C0 
      .byte $C1, $20, $71, $B5          
      tya                               
      and  #$FE                         
      tay                               
      cpx  $5A                          
      bne  WACDE                        
      pha                               
      jsr  WB010                        
      pla                               
      tay                               
WACDE:
      lda  WACEE,y                      
      sta  $AC                          
      lda  WACEE+1,y                    
      sta  $AD                          
      jsr  WACF8                        
      jmp  ($00AC)                      

WACEE:
      sax  $AD,y                        
      sax  $AD,y                        
      dec  $AD                          
      sec                               
      ldx  WAE6C                        
WACF8:
      ldy  $2D                          
      dey                               
      tya                               
      asl                               
      asl                               
      ora  #$02                         
      sta  $47FF                        
      rts                               

      ldy  #$00                         
      lda  $C000,x                      
      clc                               
      adc  #$0A                         
WAD0C:
      cmp  W9900,y                      
      bcc  WAD18                        
      beq  WAD18                        
      iny                               
      cpy  #$0E                         
      bne  WAD0C                        
WAD18:
      tya                               
      lsr                               
      lsr                               
      tay                               
      lda  WADC2,y                      
      pha                               
      cpx  #$0F                         
      bmi  WAD2D                        
      lda  $2D                          
      cmp  #$03                         
      bpl  WAD2D                        
      pla                               
      asl                               
      pha                               
WAD2D:
      lda  #$74                         
      sta  $C101,x                      
      pla                               
      sta  $41                          
      cmp  #$0A                         
      bmi  WAD42                        
      lda  #$10                         
      sta  $41                          
      lda  #$01                         
      inc  $C101,x                      
WAD42:
      clc                               
      adc  #$75                         
      sta  $C100,x                      
      lda  $C000,x                      
      clc                               
      adc  #$07                         
      sta  $C000,x                      
      sta  $C001,x                      
      lda  #$00                         
      sta  $C0C0,x                      
      sta  $C0C1,x                      
      sta  $83                          
      sta  $40                          
      jsr  W9955                        
      lda  #$10                         
      sta  $C2C1,x                      
      lda  $52                          
      beq  WAD96                        
      lda  $C100,x                      
      pha                               
      lda  $C101,x                      
      sta  $C100,x                      
      pla                               
      sta  $C101,x                      
      lda  $C040,x                      
      clc                               
      adc  #$0C                         
      sta  $C040,x                      
      bcc  WAD88                        
      inc  $C080,x                      
WAD88:
      lda  $C041,x                      
      clc                               
      adc  #$0C                         
      sta  $C041,x                      
      bcc  WAD96                        
      inc  $C081,x                      
WAD96:
      rts                               

      lda  #$00                         
      sta  $C300,x                      
      lda  $7C                          
      cmp  #$06                         
      bcc  WADAB                        
      lda  $C100,x                      
      sec                               
      sbc  #$01                         
      jmp  WADAE                        

WADAB:
      lda  $C100,x                      
WADAE:
      clc                               
      adc  #$0A                         
      cpx  #$0F                         
      bmi  WADB8                        
      sec                               
      sbc  #$01                         
WADB8:
      sta  $C100,x                      
      inc  $83                          
      inc  $89                          
      jmp  WAF75                        

WADC2:                                  
      .byte $02, $03, $04, $05, $EE, $FF, $47, $A9 
      .byte $07, $20, $0E, $BA, $A9, $03, $E0, $0F 
      .byte $30, $03                    
      clc                               
      adc  #$02                         
      sta  $C300,x                      
      lda  $C000,x                      
      sec                               
      sbc  $C300,x                      
      sta  $C000,x                      
      sta  $C001,x                      
      lda  $C080,x                      
      sta  $C081,x                      
      lda  $52                          
      beq  WAE04                        
      lda  $C040,x                      
      sec                               
      sbc  #$18                         
      sta  $C041,x                      
      bcs  WAE14                        
      lda  #$00                         
      sta  $C081,x                      
      jmp  WAE14                        

WAE04:
      lda  $C040,x                      
      clc                               
      adc  #$18                         
      sta  $C041,x                      
      bcc  WAE14                        
      lda  #$01                         
      sta  $C081,x                      
WAE14:
      lda  $C0C0,x                      
      sta  $C0C1,x                      
      lda  $C100,x                      
      clc                               
      adc  #$02                         
      sta  $C100,x                      
      cpx  #$0F                         
      bmi  WAE2A                        
      inc  $C100,x                      
WAE2A:
      lda  $C100,x                      
      sta  $C101,x                      
      inc  $C101,x                      
      inc  $83                          
      jmp  WAF75                        

      inc  $47FF                        
      lda  #$07                         
      jsr  WBA0E                        
      ldy  $C300,x                      
      iny                               
      iny                               
      tya                               
      sta  $C300,x                      
      ldy  $C000,x                      
      dey                               
      dey                               
      tya                               
      jsr  WAE57                        
      inc  $83                          
      jmp  WAF75                        

WAE57:
      sta  $C000,x                      
      sta  $C001,x                      
      lda  $C100,x                      
      clc                               
      adc  #$04                         
      sta  $C100,x                      
      adc  #$01                         
      sta  $C101,x                      
      rts                               

WAE6C:
      inc  $47FF                        
      lda  #$03                         
      jsr  WBA0E                        
      lda  #$00                         
      sta  $C300,x                      
      lda  $C000,x                      
      sec                               
      sbc  #$01                         
      cpx  #$0F                         
      bmi  WAE85                        
      sbc  #$03                         
WAE85:
      jsr  WAE57                        
      lda  #$10                         
      sta  $C2C1,x                      
      sta  $88                          
      dec  $89                          
      rts                               

WAE92:
      lda  #$00                         
      sta  $52                          
      tay                               
      lda  $C100,x                      
WAE9A:
      cmp  WACBC,y                      
      beq  WAEB6                        
      iny                               
      cpy  $51                          
      bmi  WAE9A                        
      sec                               
      sbc  #$23                         
      inc  $52                          
      ldy  #$00                         
WAEAB:
      cmp  WACBC,y                      
      beq  WAEB6                        
      iny                               
      cpy  $51                          
      bmi  WAEAB                        
      rts                               

WAEB6:
      pla                               
      pla                               
      jmp  ($00AC)                      

WAEBB:
      lda  $C2C1,x                      
      beq  WAEC8                        
      dec  $C2C1,x                      
      lda  $C2C1,x                      
      beq  WAEC9                        
WAEC8:
      rts                               

WAEC9:
      lda  #$D8                         
      sta  $AC                          
      lda  #$AE                         
      sta  $AD                          
      lda  #$0C                         
      sta  $51                          
      jsr  WAE92                        
      tya                               
      and  #$FE                         
      tay                               
      lda  WAEE9,y                      
      sta  $AC                          
      lda  WAEEA,y                      
      sta  $AD                          
      jmp  ($00AC)                      

WAEE9:
      .byte $C8
WAEEA:                                  
      .byte $AE, $C8, $AE, $F7, $AE, $21, $AF, $4E 
      .byte $AF, $04, $AD, $B3, $AC, $A5, $7C, $C9 
      .byte $06, $90, $09, $BD, $00, $C1, $18, $69 
      .byte $01, $4C, $09, $AF          
      lda  $C100,x                      
      sec                               
      sbc  #$0A                         
      cpx  #$0F                         
      bmi  WAF13                        
      clc                               
      adc  #$01                         
WAF13:
      sta  $C100,x                      
      dec  $89                          
      lda  $89                          
      bne  WAF20                        
      lda  #$01                         
      sta  $88                          
WAF20:
      rts                               

      lda  $C000,x                      
      clc                               
      adc  $C300,x                      
      sta  $C000,x                      
      lda  #$00                         
      sta  $C001,x                      
      sta  $C081,x                      
      sta  $C041,x                      
      sta  $C0C1,x                      
      sta  $C300,x                      
      lda  $C100,x                      
      sec                               
      sbc  #$02                         
      cpx  #$0F                         
      bmi  WAF48                        
      sbc  #$01                         
WAF48:
      sta  $C100,x                      
      jmp  WAF75                        

      ldy  $C000,x                      
      iny                               
      iny                               
      tya                               
      sta  $C000,x                      
      sta  $C001,x                      
      lda  #$03                         
      cpx  #$0F                         
      bmi  WAF63                        
      clc                               
      adc  #$02                         
WAF63:
      sta  $C300,x                      
      lda  $C100,x                      
      sec                               
      sbc  #$04                         
      sta  $C100,x                      
      clc                               
      adc  #$01                         
      sta  $C101,x                      
WAF75:
      lda  #$40                         
      sta  $C2C1,x                      
      rts                               

WAF7B:                                  
      .byte $30, $31, $34, $35, $53, $54, $57, $58 
      .byte $32, $33, $36, $37, $55, $56, $59, $5A 
      .byte $3A, $3C, $40, $00, $5D, $5F, $63, $00 
      .byte $3B, $3E, $42, $00, $5E, $61, $65, $00 
WAF9B:
      .byte $38, $38, $38, $38, $5B, $5B, $5B, $5B 
      .byte $39, $39, $39, $39, $5C, $5C, $5C, $5C 
WAFAB:
      lda  $DC0D                        
      cli                               
      lda  $C000,x                      
      bne  WAFB5                        
      rts                               

WAFB5:
      cpx  #$0F                         
      bpl  WAFBC                        
      jmp  WB22E                        

WAFBC:
      lda  $5A                          
      beq  WAFC7                        
      cpx  $5A                          
      beq  WAFC7                        
      jmp  WB22E                        

WAFC7:
      lda  $C100,x                      
      cmp  #$32                         
      beq  WAFD5                        
      cmp  #$55                         
      beq  WAFD5                        
      jmp  WB22E                        

WAFD5:
      lda  $C280,x                      
      cmp  #$02                         
      beq  WAFE3                        
      cmp  #$01                         
      beq  WAFE3                        
      jmp  WB22E                        

WAFE3:
      lda  $C2C0,x                      
      bpl  WAFEB                        
      jmp  WB22E                        

WAFEB:
      dec  $C2C0,x                      
      bmi  WAFF3                        
      jmp  WB22E                        

WAFF3:
      inc  $C2C0,x                      
      lda  $C1D7                        
      beq  WB02C                        
      dec  $C1D7                        
      beq  WB001                        
      rts                               

WB001:
      jsr  WB010                        
      lda  $7C                          
      cmp  #$06                         
      bcc  WB00D                        
      inc  $C100,x                      
WB00D:
      jmp  WB22E                        

WB010:
      lda  #$00                         
      sta  $5A                          
      sta  $C117                        
      ldy  #$02                         
WB019:
      sta  $C017,y                      
      dey                               
      bpl  WB019                        
      inc  $5C                          
      ldy  $5C                          
      lda  $0A00,y                      
      and  #$7F                         
      sta  $C2C0,x                      
      rts                               

WB02C:
      jsr  WABEB                        
      lda  #$00                         
      sta  $72                          
      lda  $C280,x                      
      cmp  #$01                         
      beq  WB03E                        
      lda  #$23                         
      sta  $72                          
WB03E:
      lda  $C117                        
      sec                               
      sbc  $72                          
      sta  $73                          
      tay                               
      lda  #$07                         
      cpy  #$48                         
      beq  WB055                        
      lda  #$0A                         
      cpy  #$49                         
      beq  WB055                        
      lda  #$04                         
WB055:
      tay                               
      lda  $72                          
      beq  WB061                        
      tya                               
      eor  #$FF                         
      clc                               
      adc  #$04                         
      tay                               
WB061:
      tya                               
      clc                               
      adc  $A6                          
      sta  $A6                          
      jsr  WB812                        
      lda  $52                          
      beq  WB0AF                        
      lda  $A5                          
      sec                               
      sbc  #$05                         
      sta  $A5                          
      lda  $72                          
      php                               
      lda  #$04                         
      plp                               
      beq  WB082                        
      eor  #$FF                         
      clc                               
      adc  #$01                         
WB082:
      clc                               
      adc  $AB                          
      bpl  WB08E                        
      dec  $A6                          
      eor  #$FF                         
      clc                               
      adc  #$01                         
WB08E:
      cmp  #$07                         
      bmi  WB096                        
      and  #$06                         
      inc  $A6                          
WB096:
      sta  $AB                          
      jsr  WB812                        
      lda  $52                          
      beq  WB0AF                        
      lda  $73                          
      cmp  #$48                         
      beq  WB0AC                        
      cmp  #$49                         
      beq  WB0AC                        
      jmp  WB22E                        

WB0AC:
      jmp  WB1D7                        

WB0AF:
      stx  $5A                          
      lda  $C280,x                      
      cmp  #$02                         
      beq  WB0BB                        
      jmp  WB180                        

WB0BB:
      lda  $C080,x                      
      sta  $C097                        
      lda  $AF                          
      sec                               
      sbc  #$18                         
      sta  $C057                        
      bcs  WB0D9                        
      lda  $C097                        
      bne  WB0D6                        
      jsr  WB010                        
      jmp  WB22E                        

WB0D6:
      dec  $C097                        
WB0D9:
      lda  $AE                          
      sta  $C017                        
      lda  $C117                        
      cmp  #$6B                         
      beq  WB0F3                        
      cmp  #$6C                         
      beq  WB0FD                        
      lda  #$05                         
      jsr  WBA0E                        
      lda  #$6B                         
      jmp  WB104                        

WB0F3:
      ldy  #$00                         
      jsr  WB11F                        
      lda  #$6C                         
      jmp  WB104                        

WB0FD:
      ldy  #$01                         
      jsr  WB11F                        
      lda  #$6E                         
WB104:
      sta  $C117                        
      cmp  #$6B                         
      beq  WB11E                        
      clc                               
      adc  #$01                         
      sta  $C118                        
      cmp  #$6D                         
      beq  WB11E                        
      clc                               
      adc  #$01                         
      sta  $C119                        
      jmp  WB1D7                        

WB11E:
      rts                               

WB11F:
      lda  $C097,y                      
      sta  $C098,y                      
      lda  $C057,y                      
      sec                               
      sbc  #$18                         
      sta  $C058,y                      
      bcs  WB142                        
      lda  $C097                        
      bne  WB13D                        
      pla                               
      pla                               
      jsr  WB010                        
      jmp  WB22E                        

WB13D:
      lda  #$00                         
      sta  $C098,y                      
WB142:
      lda  $C017,y                      
      sta  $C018,y                      
      lda  $C017                        
      clc                               
      adc  #$0A                         
      sec                               
      sbc  $D00F                        
      bcc  WB17C                        
      cmp  #$14                         
      bcs  WB17C                        
      jsr  W9A41                        
      sta  $7A                          
      lda  $D00E                        
      sec                               
      sbc  #$17                         
      sta  $7B                          
      bcs  WB169                        
      dec  $7A                          
WB169:
      lda  $C057                        
      sec                               
      sbc  $7B                          
      cmp  WB17D,y                      
      bcs  WB17C                        
      lda  $7A                          
      bne  WB17C                        
      lda  #$01                         
      sta  $59                          
WB17C:
      rts                               

WB17D:                                  
      .byte $32, $4A, $1A               
WB180:
      lda  $C080,x                      
      sta  $C097                        
      lda  $AF                          
      clc                               
      adc  #$16                         
      sta  $C057                        
      bcc  WB195                        
      lda  #$01                         
      sta  $C097                        
WB195:
      lda  $AE                          
      sta  $C017                        
      lda  $C117                        
      cmp  #$48                         
      beq  WB1AF                        
      cmp  #$49                         
      beq  WB1B9                        
      lda  #$05                         
      jsr  WBA0E                        
      lda  #$48                         
      jmp  WB1C0                        

WB1AF:
      ldy  #$00                         
      jsr  WB1DD                        
      lda  #$49                         
      jmp  WB1C0                        

WB1B9:
      ldy  #$01                         
      jsr  WB1DD                        
      lda  #$4B                         
WB1C0:
      sta  $C117                        
      cmp  #$48                         
      beq  WB1DC                        
      clc                               
      adc  #$01                         
      sta  $C118                        
      cmp  #$4A                         
      beq  WB1DC                        
      clc                               
      adc  #$01                         
      sta  $C119                        
WB1D7:
      lda  #$04                         
      sta  $C1D7                        
WB1DC:
      rts                               

WB1DD:
      lda  $C097,y                      
      sta  $C098,y                      
      lda  $C057,y                      
      clc                               
      adc  #$18                         
      sta  $C058,y                      
      bcc  WB1F3                        
      lda  #$01                         
      sta  $C098,y                      
WB1F3:
      lda  $C017,y                      
      sta  $C018,y                      
      lda  $C017                        
      clc                               
      adc  #$0A                         
      sec                               
      sbc  $D00F                        
      bcc  WB22D                        
      cmp  #$14                         
      bcs  WB22D                        
      jsr  W9A41                        
      sta  $7A                          
      lda  $D00E                        
      clc                               
      adc  #$17                         
      bcc  WB218                        
      inc  $7A                          
WB218:
      sec                               
      sbc  $C057                        
      bcs  WB220                        
      dec  $7A                          
WB220:
      cmp  WB17D,y                      
      bcs  WB22D                        
      lda  $7A                          
      bne  WB22D                        
      lda  #$01                         
      sta  $59                          
WB22D:
      rts                               

WB22E:
      ldy  #$00                         
      lda  $C100,x                      
WB233:
      cmp  WAF7B,y                      
      beq  WB23E                        
      iny                               
      cpy  #$10                         
      bne  WB233                        
      rts                               

WB23E:
      jsr  WABEB                        
      lda  $A6                          
      sta  $B2                          
      lda  $A5                          
      sta  $B1                          
      lda  $AB                          
      sta  $B3                          
      lda  $58                          
      cmp  #$01                         
      bne  WB261                        
      lda  #$41                         
      sta  $A9                          
      lda  #$1A                         
      sta  $AC                          
      lda  #$00                         
      sta  $AD                          
      beq  WB264                        
WB261:
      jsr  WB365                        
WB264:
      ldy  #$00                         
      jsr  WB32E                        
      sty  $CF30                        
      ldy  #$01                         
      jsr  WB33F                        
      sty  $CF31                        
      lda  $C280,x                      
      sta  $CF32                        
      eor  #$FF                         
      and  #$03                         
      sta  $CF33                        
      lda  $74                          
      sec                               
      sbc  $72                          
      bcc  WB296                        
      lda  $CF31                        
      pha                               
      lda  $CF30                        
      sta  $CF31                        
      pla                               
      sta  $CF30                        
WB296:
      lda  $58                          
      cmp  #$01                         
      bne  WB2A5                        
      jsr  WB365                        
      jsr  WB32E                        
      jsr  WB33F                        
WB2A5:
      lda  $74                          
      sec                               
      sbc  $72                          
      bcs  WB2B1                        
      eor  #$FF                         
      clc                               
      adc  #$01                         
WB2B1:
      lsr                               
      lsr                               
      lsr                               
      eor  #$FF                         
      clc                               
      adc  #$0D                         
      ora  #$02                         
      sta  $77                          
      lda  $AE                          
      cmp  $D00F                        
      bne  WB2D5                        
      lda  $74                          
      cmp  #$14                         
      bcs  WB2EE                        
      lda  $75                          
      bne  WB2EE                        
      lda  #$01                         
      sta  $59                          
      jmp  WB2EE                        

WB2D5:
      lda  $AF                          
      cmp  $D00E                        
      bne  WB2EE                        
      jsr  W9A41                        
      cmp  $C080,x                      
      bne  WB2EE                        
      lda  $72                          
      cmp  #$0A                         
      bcs  WB2EE                        
      lda  #$01                         
      sta  $59                          
WB2EE:
      lda  #$00                         
      sta  $72                          
      ldy  #$03                         
WB2F4:
      sta  $CF10,y                      
      dey                               
      bpl  WB2F4                        
      lda  $7C                          
      cmp  #$05                         
      bne  WB306                        
      inc  $C100,x                      
      jmp  WB30D                        

WB306:
      cmp  #$07                         
      bne  WB30D                        
      dec  $C100,x                      
WB30D:
      ldy  $72                          
      lda  $CF30,y                      
      sta  $76                          
      tay                               
      lda  $C180,x                      
      bpl  WB31D                        
      jmp  WB3BD                        

WB31D:
      lda  $CF10,y                      
      beq  WB375                        
WB322:
      inc  $72                          
      lda  $72                          
      cmp  #$04                         
      bne  WB32B                        
      rts                               

WB32B:
      jmp  WB30D                        

WB32E:
      lda  $AE                          
      sec                               
      sbc  $A9                          
      bcs  WB33C                        
      ldy  #$03                         
      eor  #$FF                         
      clc                               
      adc  #$01                         
WB33C:
      sta  $72                          
      rts                               

WB33F:
      lda  $AC                          
      sec                               
      sbc  $AF                          
      sta  $74                          
      lda  $AD                          
      sbc  $C080,x                      
      sta  $75                          
      bcs  WB364                        
      ldy  #$02                         
      lda  $75                          
      eor  #$FF                         
      sta  $75                          
      lda  $74                          
      eor  #$FF                         
      clc                               
      adc  #$01                         
      sta  $74                          
      lda  #$00                         
      adc  #$75                         
WB364:
      rts                               

WB365:
      lda  $D00F                        
      sta  $A9                          
      lda  $D00E                        
      sta  $AC                          
      jsr  W9A41                        
      sta  $AD                          
      rts                               

WB375:
      lda  $76                          
      cmp  $CF33                        
      bne  WB3B6                        
      lda  $72                          
      cmp  #$03                         
      beq  WB385                        
      jmp  WB322                        

WB385:
      lda  $C140,x                      
      bmi  WB3B6                        
      lda  $58                          
      cmp  #$01                         
      beq  WB39B                        
      lda  $C140,x                      
      sec                               
      sbc  #$01                         
      sta  $C140,x                      
      bpl  WB3B6                        
WB39B:
      lda  $C180,x                      
      ora  #$80                         
      sta  $C180,x                      
      lda  #$40                         
      sta  $C1C0,x                      
      lda  $C100,x                      
      clc                               
      adc  #$04                         
      sta  $C100,x                      
      lda  #$00                         
      sta  $C0C0,x                      
WB3B6:
      ldy  $76                          
      lda  #$01                         
      sta  $CF10,y                      
WB3BD:
      lda  $76                          
      jsr  WB3D4+1                      
      lda  $C180,x                      
      bmi  WB3CA                        
      jmp  ($0074)                      

WB3CA:
      jmp  WB4FA                        

WB3CD:                                  
      .byte $E2
WB3CE:
      .byte $B3, $38, $B4, $83, $B4, $10
WB3D4:                                  
      .byte $B4
      asl                               
      tay                               
      lda  WB3CD,y                      
      sta  $74                          
      lda  WB3CE,y                      
      sta  $75                          
      rts                               

      lda  $C180,x                      
      bmi  WB407                        
      lda  $AE                          
      cmp  #$41                         
      bcs  WB3F0                        
      jmp  WB322                        

WB3F0:
      lda  $C280,x                      
      cmp  #$00                         
      beq  WB3FE                        
      jsr  WB7F9                        
      lda  $78                          
      bne  WB435                        
WB3FE:
      lda  #$00                         
      sta  $52                          
      jsr  WB839                        
      bne  WB435                        
WB407:
      lda  $76                          
      sta  $C280,x                      
      dec  $C000,x                      
      rts                               

      lda  $C180,x                      
      bmi  WB42C                        
      lda  $C280,x                      
      cmp  #$03                         
      beq  WB423                        
      jsr  WB7F9                        
      lda  $78                          
      bne  WB435                        
WB423:
      lda  #$0A                         
      sta  $52                          
      jsr  WB839                        
      bne  WB435                        
WB42C:
      lda  $76                          
      sta  $C280,x                      
      inc  $C000,x                      
      rts                               

WB435:
      jmp  WB30D                        

      lda  $C180,x                      
      bmi  WB453                        
      lda  $C280,x                      
      cmp  #$01                         
      beq  WB44B                        
      jsr  WB80A                        
      lda  $78                          
      bne  WB435                        
WB44B:
      jsr  WB476                        
      jsr  WB4E0                        
      bne  WB435                        
WB453:
      lda  $C100,x                      
      cmp  #$38                         
      bmi  WB460                        
      sec                               
      sbc  #$23                         
      sta  $C100,x                      
WB460:
      lda  $76                          
      sta  $C280,x                      
      inc  $C040,x                      
      inc  $C040,x                      
      bne  WB472                        
      lda  #$01                         
      sta  $C080,x                      
WB472:
      rts                               

WB473:
      jmp  WB30D                        

WB476:
      lda  $B2                          
      sta  $A6                          
      lda  $B1                          
      sta  $A5                          
      lda  $B3                          
      sta  $AB                          
      rts                               

      lda  $C180,x                      
      bmi  WB4A0                        
      lda  $C280,x                      
      cmp  #$02                         
      beq  WB496                        
      jsr  WB80A                        
      lda  $78                          
      bne  WB473                        
WB496:
      jsr  WB476                        
      jsr  WB812                        
      lda  $52                          
      bne  WB473                        
WB4A0:
      lda  $C100,x                      
      cmp  #$38                         
      bpl  WB4AD                        
      clc                               
      adc  #$23                         
      sta  $C100,x                      
WB4AD:
      lda  $76                          
      sta  $C280,x                      
      lda  $AF                          
      bne  WB4B9                        
      sta  $C080,x                      
WB4B9:
      dec  $C040,x                      
      dec  $C040,x                      
      lda  $58                          
      cmp  #$01                         
      bne  WB4DF                        
      lda  $C080,x                      
      bne  WB4DF                        
      lda  $C000,x                      
      cmp  #$41                         
      bne  WB4DF                        
      lda  $C040,x                      
      cmp  #$1C                         
      bcs  WB4DF                        
      lda  #$00                         
      sta  $C000,x                      
      sta  $58                          
WB4DF:
      rts                               

WB4E0:
      lda  $A6                          
      clc                               
      adc  #$03                         
      sta  $A6                          
      lda  $AB                          
      sec                               
      sbc  #$04                         
      bcs  WB4F2                        
      and  #$06                         
      dec  $A6                          
WB4F2:
      sta  $AB                          
      jsr  WB812                        
      lda  $52                          
      rts                               

WB4FA:
      dec  $C1C0,x                      
      bmi  WB502                        
      jmp  WB555                        

WB502:
      inc  $C1C0,x                      
      jsr  WB7F9                        
      lda  $78                          
      bne  WB52C                        
      lda  #$00                         
      sta  $52                          
      jsr  WB839                        
      bne  WB51C                        
      lda  #$00                         
      sta  $76                          
      jmp  WB54C                        

WB51C:
      lda  #$0A                         
      sta  $52                          
      jsr  WB839                        
      bne  WB52C                        
      lda  #$03                         
      sta  $76                          
      jmp  WB54C                        

WB52C:
      jsr  WB80A                        
      lda  $78                          
      bne  WB555                        
      jsr  WB7D1+2                      
      jsr  WB4E0                        
      bne  WB540                        
      lda  #$01                         
      jmp  WB54C                        

WB540:
      jsr  WB7D1+2                      
      jsr  WB812                        
      lda  $52                          
      bne  WB555                        
      lda  #$02                         
WB54C:
      sta  $C280,x                      
      jsr  WB571                        
      jmp  WB3BD                        

WB555:
      lda  $B9                          
      bmi  WB598                        
      inc  $C340,x                      
      lda  $C340,x                      
      cmp  $77                          
      bcc  WB56E                        
      lda  #$00                         
      sta  $C340,x                      
      lda  $CF31                        
      jsr  WB3D4+1                      
WB56E:
      jmp  ($0074)                      

WB571:
      lda  #$03                         
      sta  $C140,x                      
      dec  $C1C0,x                      
      lda  $C100,x                      
      sec                               
      sbc  #$04                         
      sta  $C100,x                      
      lda  $C180,x                      
      and  #$7F                         
      sta  $C180,x                      
      cpx  #$0F                         
      bpl  WB593                        
      lda  #$07                         
      jmp  WB595                        

WB593:
      lda  #$05                         
WB595:
      sta  $C0C0,x                      
WB598:
      rts                               

WB599:
      lda  $54                          
      beq  WB5A2                        
      cpx  $54                          
      beq  WB5A2                        
      rts                               

WB5A2:
      cli                               
      lda  $C180,x                      
      tay                               
      and  #$40                         
      beq  WB5AE                        
      jmp  WB68D                        

WB5AE:
      tya                               
      and  #$80                         
      beq  WB5C7                        
      jsr  WABEB                        
      jsr  WB5EE                        
      clc                               
      adc  $AE                          
      cmp  #$E6                         
      bcs  WB5D9                        
      jsr  WB842                        
      lda  $52                          
      beq  WB5FF                        
WB5C7:
      jsr  WABEB                        
      jsr  WB5EE                        
      clc                               
      adc  #$04                         
      sta  $52                          
      jsr  WB842                        
      lda  $52                          
      beq  WB5FF                        
WB5D9:
      lda  $C180,x                      
      and  #$80                         
      beq  WB5ED                        
      lda  #$04                         
      jsr  WBA0E                        
      dec  $C000,x                      
      lda  #$40                         
      sta  $C180,x                      
WB5ED:
      rts                               

WB5EE:
      lda  #$0A                         
      lda  $55                          
      ora  $6D                          
      php                               
      lda  #$0A                         
      plp                               
      beq  WB5FC                        
      lda  #$0F                         
WB5FC:
      sta  $52                          
      rts                               

WB5FF:
      lda  $C180,x                      
      tay                               
      and  #$80                         
      bne  WB63E                        
      txa                               
      tay                               
      lda  $09                          
      sta  $52                          
      jsr  WB673                        
      lda  $09                          
      php                               
      tya                               
      tax                               
      lda  $52                          
      sta  $09                          
      plp                               
      bne  WB672                        
      txa                               
      tay                               
      lda  $09                          
      sta  $52                          
      jsr  W836A                        
      lda  $09                          
      php                               
      tya                               
      tax                               
      lda  $52                          
      sta  $09                          
      plp                               
      bne  WB672                        
      stx  $54                          
      lda  #$A0                         
      sta  $C180,x                      
      tay                               
      lda  #$40                         
      sta  $C1C0,x                      
WB63E:
      tya                               
      and  #$20                         
      beq  WB668                        
      lda  $C1C0,x                      
      and  #$0F                         
      bne  WB659                        
      lda  $C100,x                      
      cmp  #$4F                         
      bne  WB656                        
      dec  $C100,x                      
      bne  WB659                        
WB656:
      inc  $C100,x                      
WB659:
      dec  $C1C0,x                      
      bne  WB672                        
      lda  #$04                         
      jsr  WBA0E                        
      lda  #$80                         
      sta  $C180,x                      
WB668:
      inc  $C000,x                      
      lda  $6D                          
      beq  WB672                        
      inc  $D00F                        
WB672:
      rts                               

WB673:
      lda  #$00                         
      sta  $09                          
      ldx  #$02                         
WB679:
      lda  $C000,x                      
      clc                               
      adc  #$0E                         
      cmp  $D00F                        
      bne  WB687                        
      jsr  W8398                        
WB687:
      inx                               
      cpx  #$07                         
      bne  WB679                        
      rts                               

WB68D:
      tya                               
      and  #$10                         
      bne  WB6AD                        
      lda  #$50                         
      sta  $C180,x                      
      lda  $55                          
      ora  $6D                          
      beq  WB6BB                        
      lda  #$58                         
      sta  $C180,x                      
      bne  WB6A7                        
      inc  $C100,x                      
WB6A7:
      lda  #$30                         
      sta  $C1C0,x                      
      rts                               

WB6AD:
      dec  $C1C0,x                      
      lda  $C1C0,x                      
      beq  WB6B6                        
      rts                               

WB6B6:
      tya                               
      and  #$08                         
      bne  WB70B                        
WB6BB:
      inc  $C100,x                      
      lda  $C100,x                      
      cmp  #$4F                         
      bne  WB6C8                        
      inc  $C100,x                      
WB6C8:
      lda  $C100,x                      
      cmp  #$52                         
      bne  WB6A7                        
WB6CF:
      lda  $6D                          
      beq  WB6D5                        
      sta  $59                          
WB6D5:
      lda  #$00                         
      sta  $C000,x                      
      sta  $C180,x                      
      sta  $54                          
      inc  $56                          
      lda  $56                          
      cmp  #$02                         
      bne  WB6F0                        
      lda  #$8E                         
      sta  $C01E                        
      lda  #$0A                         
      sta  $5E                          
WB6F0:
      ldy  $55                          
      beq  WB70A                        
      lda  $BD                          
      php                               
      lda  #$00                         
      sta  $55                          
      ldy  $CF21                        
      sta  $C000,y                      
      plp                               
      beq  WB70A                        
      ldy  $CF21                        
      sta  $C000,y                      
WB70A:
      rts                               

WB70B:
      lda  $C100,x                      
      cmp  #$4E                         
      beq  WB716                        
      inc  $55                          
      bne  WB6CF                        
WB716:
      lda  $55                          
      beq  WB6CF                        
      ldy  $CF21                        
      lda  $C000,x                      
      clc                               
      adc  #$05                         
      sta  $C000,x                      
      sta  $C000,y                      
      lda  $C080,x                      
      sta  $C080,y                      
      lda  $C040,x                      
      clc                               
      adc  #$18                         
      sta  $C040,y                      
      bcc  WB743                        
      lda  $C080,y                      
      clc                               
      adc  #$01                         
      sta  $C080,y                      
WB743:
      lda  #$75                         
      sta  $C100,y                      
      lda  #$00                         
      sta  $C0C0,x                      
      sta  $C0C0,y                      
      ldy  $55                          
      lda  WB7C8+2,y                    
      cmp  #$0A                         
      bmi  WB78D                        
      pha                               
      ldy  $CF22                        
      lda  #$7E                         
      sta  $C100,y                      
      lda  #$00                         
      sta  $C0C0,y                      
      lda  $C000,x                      
      sta  $C000,y                      
      lda  $C080,x                      
      sta  $C080,y                      
      lda  $C040,x                      
      sec                               
      sbc  #$10                         
      sta  $C040,y                      
      bcc  WB787                        
      lda  $C080,y                      
      clc                               
      adc  #$01                         
      sta  $C080,y                      
WB787:
      pla                               
      sec                               
      sbc  #$0A                         
      ldy  $55                          
WB78D:
      clc                               
      adc  #$75                         
      sta  $C100,x                      
      lda  WB7C8+2,y                    
      asl                               
      asl                               
      asl                               
      asl                               
      sta  $41                          
      lda  #$00                         
      sta  $BD                          
      sta  $40                          
      jsr  W9955                        
      dec  $55                          
      beq  WB7C4                        
      lda  $55                          
      cmp  #$05                         
      bmi  WB7B1                        
      inc  $BD                          
WB7B1:
      ldy  $55                          
      cpy  $BD                          
      beq  WB7C4                        
      lda  $CF21,y                      
      tay                               
      lda  #$00                         
      sta  $C000,y                      
      dec  $55                          
      bne  WB7B1                        
WB7C4:
      lda  #$00                         
      sta  $55                          
WB7C8:
      jmp  WB6A7                        

      .byte $01, $02, $04, $06, $08, $0A
WB7D1:                                  
      .byte $0C, $0F                    
      lda  $C080,x                      
      ror                               
      lda  $AF                          
      ror                               
      lsr                               
      lsr                               
      pha                               
      sec                               
      sbc  #$03                         
      sta  $A6                          
      pla                               
      asl                               
      asl                               
      asl                               
      sta  $52                          
      lda  $AF                          
      sec                               
      sbc  $52                          
      and  #$FE                         
      sta  $AB                          
      lda  $AE                          
      sec                               
      sbc  #$32                         
      sta  $A5                          
      rts                               

WB7F9:
      lda  #$00                         
      sta  $78                          
      ldy  $AF                          
      lda  $0E00,y                      
      cmp  $C080,x                      
      beq  WB809                        
      inc  $78                          
WB809:
      rts                               

WB80A:
      ldy  $AE                          
      lda  $0F00,y                      
      sta  $78                          
      rts                               

WB812:
      ldy  $AB                          
      lda  WB866,y                      
      sta  $AA                          
      clc                               
      lda  $A5                          
      adc  #$04                         
      sta  $A5                          
      lda  #$00                         
      sta  $52                          
      jsr  WB88C                        
      and  $AA                          
      beq  WB82D                        
      inc  $52                          
WB82D:
      inc  $A5                          
      jsr  WB88C                        
      and  $AA                          
      beq  WB838                        
      inc  $52                          
WB838:
      rts                               

WB839:
      jsr  WB476                        
      jsr  WB842                        
      lda  $52                          
      rts                               

WB842:
      lda  $A5                          
      clc                               
      adc  $52                          
      sta  $A5                          
      ldy  #$00                         
      lda  $A6                          
WB84D:
      cmp  WB86E,y                      
      beq  WB85A                        
      iny                               
      cpy  #$04                         
      bne  WB84D                        
      jmp  WB85C                        

WB85A:
      inc  $A6                          
WB85C:
      inc  $A6                          
      jsr  WB88C                        
      and  #$14                         
      sta  $52                          
      rts                               

WB866:
      .byte $40, $40, $10, $10, $04, $04, $01, $01 
WB86E:
      .byte $00, $0B, $16               
WB871:                                  
      .byte $21
      txa                               
      pha                               
      ldy  $A5                          
      ldx  $A6                          
      clc                               
      lda  $0C00,y                      
      adc  $0B00,x                      
      sta  $A7                          
      lda  $0D00,y                      
      adc  $0B40,x                      
      sta  $A8                          
      pla                               
      tax                               
      rts                               

WB88C:
      jsr  WB871+1                      
      ldy  #$00                         
      lda  ($A7),y                      
      rts                               

WB894:
      lda  $82                          
      beq  WB89D                        
      sta  $83                          
      jsr  W8211                        
WB89D:
      lda  $54                          
      bne  WB89D                        
      ldx  #$50                         
      jsr  W9AB5                        
      inc  $45                          
      lda  #$80                         
      sta  $D015                        
      jsr  WB010                        
      lda  $D010                        
      and  #$80                         
      sta  $D010                        
      ldy  #$02                         
      ldx  #$00                         
WB8BC:
      lda  $C000,y                      
      sta  $D001,x                      
      lda  $C040,y                      
      sta  $D000,x                      
      lda  $C080,y                      
      beq  WB8D6                        
      lda  WAAAC,y                      
      ora  $D010                        
      sta  $D010                        
WB8D6:
      lda  #$4E                         
      sta  $47F6,y                      
      lda  #$0C                         
      sta  $D025,y                      
      inx                               
      inx                               
      iny                               
      cpy  #$07                         
      bne  WB8BC                        
      lda  #$9F                         
      sta  $D015                        
      ldy  #$37                         
      jsr  W8B25                        
      lda  #$26                         
      sta  $18                          
WB8F5:
      ldy  $18                          
      cpy  #$29                         
      beq  WB902                        
      jsr  W9436                        
      inc  $18                          
      bne  WB8F5                        
WB902:
      ldy  #$05                         
      jsr  W8C36                        
      ldy  #$06                         
      jsr  W8C36                        
      dec  $2D                          
      lda  $2D                          
      asl                               
      asl                               
      sta  $47FF                        
      inc  $3B                          
      ldx  #$50                         
      jsr  W9AB5                        
      lda  #$00                         
      jsr  WBA0E                        
      lda  #$01                         
      jsr  WBA0E                        
      lda  #$0D                         
      jsr  WBA0E                        
      ldy  #$03                         
WB92D:
      inc  $47FF                        
      ldx  #$40                         
      jsr  W9AB5                        
      dey                               
      bne  WB92D                        
      lda  #$71                         
      sta  $47FF                        
      tax                               
      jsr  W9AB5                        
      lda  #$00                         
      sta  $D00F                        
      ldx  #$50                         
      jsr  W9AB5                        
      lda  $4A                          
      beq  WB960                        
WB94F:
      lda  $3F3F                        
      beq  WB95D                        
      lda  #$2B                         
      sta  $D011                        
      sei                               
      jsr  WA1F5                        
WB95D:
      jmp  WA0B7                        

WB960:
      ldy  #$16                         
      jsr  W9AE6                        
      lda  #$00                         
      sta  $19                          
WB969:
      ldy  $19                          
      tya                               
      sta  $47FD,y                      
      lda  #$01                         
      sta  $D02C,y                      
      tya                               
      clc                               
      adc  #$17                         
      tay                               
      jsr  W9B04                        
      lda  $19                          
      asl                               
      asl                               
      asl                               
      asl                               
      asl                               
      asl                               
      sta  $05                          
      lda  #$40                         
      sta  $06                          
      lda  #$08                         
      sta  $0A                          
      ldy  #$00                         
WB990:
      ldx  #$00                         
WB992:
      lda  ($C0,x)                      
      sta  ($05),y                      
      jsr  W8BD5                        
      lda  $C0,x                        
      clc                               
      adc  #$01                         
      sta  $C0,x                        
      lda  $C1,x                        
      adc  #$00                         
      sta  $C1,x                        
      inx                               
      inx                               
      cpx  #$06                         
      bne  WB992                        
      dec  $0A                          
      bne  WB990                        
      inc  $19                          
      lda  $19                          
      cmp  #$03                         
      bne  WB969                        
      lda  #$FF                         
      sta  $D015                        
      lda  #$88                         
      sta  $D00B                        
      sta  $D00D                        
      sta  $D00F                        
      lda  #$68                         
      sta  $D00A                        
      lda  #$98                         
      sta  $D00C                        
      lda  #$C8                         
      sta  $D00E                        
      lda  #$1F                         
      sta  $D01C                        
      lda  #$E0                         
      sta  $D01D                        
      sta  $D017                        
      ldx  #$FF                         
      jsr  W9AB5                        
      ldx  #$FF                         
      jsr  W9AB5                        
      lda  $3F3F                        
      bne  WB9F6                        
      jmp  W803C                        

WB9F6:
      jmp  WB94F                        

      .byte $38, $12, $08, $12, $68, $12, $28, $12 
      .byte $00, $11, $78, $12, $B0, $12, $28, $12 
      .byte $90, $12, $4C, $77, $BA     
WBA0E:
      sta  $EB                          
      asl                               
      sta  $EA                          
      tya                               
      pha                               
      txa                               
      pha                               
      ldy  $EB                          
      lda  WBA4D,y                      
      sta  $EB                          
      asl                               
      tax                               
      ldy  $EA                          
      sta  $EA                          
      lda  WBA5B,y                      
      sta  $E0,x                        
      sta  $EC,x                        
      lda  WBA5C,y                      
      sta  $E1,x                        
      sta  $ED,x                        
      ldx  #$02                         
WBA34:
      lda  $F2,x                        
      clc                               
      adc  $F5                          
      sta  $F2,x                        
      dex                               
      bpl  WBA34                        
      ldx  $EB                          
      lda  #$00                         
      sta  $F2,x                        
      lda  #$01                         
      sta  $F5                          
      pla                               
      tax                               
      pla                               
      tay                               
      rts                               

WBA4D:
      .byte $00, $01, $02, $02, $02, $02, $02, $02 
      .byte $00, $01, $00, $00, $01, $02
WBA5B:                                  
      .byte $C6
WBA5C:
      .byte $BC, $EF, $BC, $16, $BD, $9B, $BE, $0F 
      .byte $BF, $34, $BF, $62, $BF, $7F, $BF, $52 
      .byte $BD, $FE, $BD, $C4, $BF, $BE, $BF, $BE 
      .byte $BF, $BE, $BF, $C6, $F5, $F0, $01, $60 
      .byte $A5, $D0, $F0, $01, $60, $A9, $01, $85 
      .byte $D0, $20, $8D, $BA, $A9, $00, $85, $D0 
      .byte $60                         
      cli                               
      lda  $DC0D                        
      ldy  #$02                         
      ldx  #$04                         
WBA95:
      lda  $E1,x                        
      beq  WBAA6                        
      lda  $00F2,y                      
      bne  WBAA6                        
      lda  WBAAE,y                      
      sta  $F6                          
      jsr  WBAB1                        
WBAA6:
      dex                               
      dex                               
      dey                               
      bpl  WBA95                        
      jmp  WBAFE                        

WBAAE:
      .byte $00, $07, $0E               
WBAB1:
      .byte $8A, $48, $98, $48, $0A, $86, $EA, $84 
WBAB9:
      .byte $EB
      ldx  $EA                          
      ldy  $EB                          
      lda  ($E0,x)                      
      sta  $FE                          
      cmp  #$B1                         
      bcs  WBAD0                        
      and  #$07                         
      bne  WBAD0                        
      lda  $FE                          
      cmp  #$B0                         
      bne  WBADC                        
WBAD0:
      lda  #$00                         
      sta  $E1,x                        
      lda  #$7F                         
      sta  $00F2,y                      
      jmp  WBAF9                        

WBADC:
      jsr  WBB01                        
      lda  $FE                          
      and  #$F8                         
      lsr                               
      lsr                               
      tay                               
      lda  WBC9A,y                      
      sta  $E6                          
      lda  WBC9B,y                      
      sta  $E7                          
      jmp  ($00E6)                      

WBAF3:
      lda  $FE                          
      cmp  #$40                         
      bne  WBAB9+1                      
WBAF9:
      pla                               
      tay                               
      pla                               
      tax                               
      rts                               

WBAFE:
      jmp  WBC5D                        

WBB01:
      lda  $E0,x                        
      clc                               
      adc  #$01                         
      sta  $E0,x                        
      lda  $E1,x                        
      adc  #$00                         
      sta  $E1,x                        
      rts                               

      jsr  WBC53                        
      ldy  $F6                          
      sta  $D400,y                      ; Voice 1: Frequency control (lo byte)
      jsr  WBC53                        
      sta  $D401,y                      ; Voice 1: Frequency control (hi byte)
      ldx  $EB                          
      sta  $D8,x                        
      jmp  WBAF3                        

      jsr  WBC53                        
      ldy  $F6                          
      sta  $D404,y                      ; Voice 1: Control registers
      jmp  WBAF3                        

      jsr  WBC53                        
      ldy  $F6                          
      sta  $D402,y                      ; Voice 1: Wave form pulsation amplitude (lo byte)
      jsr  WBC53                        
      sta  $D403,y                      ; Voice 1: Wave form pulsation amplitude (hi byte)
      jmp  WBAF3                        

      jsr  WBC53                        
      ldy  $F6                          
      sta  $D405,y                      
      jsr  WBC53                        
      sta  $D406,y                      
      jmp  WBAF3                        

      jsr  WBC53                        
      sta  $D415                        
      jsr  WBC53                        
      sta  $FF                          
      sta  $D416                        
      jmp  WBAF3                        

      jsr  WBC53                        
      and  #$F0                         
      sta  $FC                          
      clc                               
      adc  $FA                          
      sta  $D417                        
      jmp  WBAF3                        

      jsr  WBC53                        
      and  #$0F                         
      sta  $FD                          
      clc                               
      adc  $FB                          
      sta  $D418                        
      jmp  WBAF3                        

      rts                               

      jsr  WBC53                        
      ldy  $EB                          
      sta  $00F2,y                      
      jmp  WBAF3                        

      ldx  $EA                          
      lda  $EC,x                        
      sta  $E0,x                        
      lda  $ED,x                        
      sta  $E1,x                        
      jmp  WBAF3                        

      ldy  $EB                          
      lda  #$01                         
WBB9F:
      cpy  #$00                         
      beq  WBBA8                        
      asl                               
      dey                               
      jmp  WBB9F                        

WBBA8:
      ora  $FA                          
      sta  $FA                          
      lda  $FC                          
      clc                               
      adc  $FA                          
      sta  $D417                        
      jmp  WBAF3                        

      jsr  WBC53                        
      and  #$F0                         
      sta  $FB                          
      clc                               
      adc  $FD                          
      sta  $D418                        
      jmp  WBAF3                        

      ldy  $EB                          
      lda  #$FE                         
WBBCB:
      cpy  #$00                         
      sec                               
      beq  WBBD5                        
      rol                               
      dey                               
      jmp  WBBCB                        

WBBD5:
      and  $FA                          
      sta  $FA                          
      clc                               
      adc  $FC                          
      sta  $D417                        
      jmp  WBAF3                        

      jsr  WBC53                        
      ldy  $EB                          
      clc                               
      adc  #$01                         
      sta  $00D2,y                      
      jmp  WBAF3                        

      rts                               

      jsr  WBC53                        
      tay                               
      jsr  WBC53                        
      ldx  $EB                          
      dec  $D2,x                        
      beq  WBC04                        
      ldx  $EA                          
      sta  $E1,x                        
      sty  $E0,x                        
WBC04:
      jmp  WBAF3                        

      lda  #$11                         
      bne  WBC15                        
      lda  #$10                         
      bne  WBC15                        
      lda  #$41                         
      bne  WBC15                        
      lda  #$40                         
WBC15:
      ldy  $F6                          
      sta  $D404,y                      
      jmp  WBAF3                        

      lda  #$02                         
      bne  WBC23                        
      lda  #$06                         
WBC23:
      ldy  $EB                          
      sta  $00F2,y                      
      lda  #$40                         
      sta  $FE                          
      jmp  WBAF3                        

      jsr  WBC53                        
      ldy  $EB                          
      clc                               
      adc  #$01                         
      sta  $00D5,y                      
      jmp  WBAF3                        

      jsr  WBC53                        
      tay                               
      jsr  WBC53                        
      ldx  $EB                          
      dec  $D5,x                        
      beq  WBC50                        
      ldx  $EA                          
      sta  $E1,x                        
      sty  $E0,x                        
WBC50:
      jmp  WBAF3                        

WBC53:
      ldx  $EA                          
      lda  ($E0,x)                      
      pha                               
      jsr  WBB01                        
      pla                               
      rts                               

WBC5D:
      lda  $F2                          
      cmp  $F3                          
      bcc  WBC6E                        
      lda  $F3                          
      cmp  $F4                          
      bcc  WBC76                        
      lda  $F4                          
      jmp  WBC76                        

WBC6E:
      lda  $F2                          
      cmp  $F4                          
      bcc  WBC76                        
      lda  $F4                          
WBC76:
      sta  $F5                          
      lda  $E1                          
      beq  WBC83                        
      lda  $F2                          
      sec                               
      sbc  $F5                          
      sta  $F2                          
WBC83:
      lda  $E3                          
      beq  WBC8E                        
      lda  $F3                          
      sec                               
      sbc  $F5                          
      sta  $F3                          
WBC8E:
      lda  $E5                          
      beq  WBC99                        
      lda  $F4                          
      sec                               
      sbc  $F5                          
      sta  $F4                          
WBC99:
      rts                               

WBC9A:                                  
      .byte $07
WBC9B:
      .byte $BC, $0F, $BB, $24, $BB, $2F, $BB, $40 
      .byte $BB, $51, $BB, $62, $BB, $72, $BB, $83 
      .byte $BB, $8E, $BB, $9B, $BB, $B7, $BB, $C7 
      .byte $BB, $0B, $BC, $F1, $BB, $E2, $BB, $0F 
      .byte $BC, $13, $BC, $1D, $BC, $21, $BC, $2F 
      .byte $BC, $3D, $BC, $38, $0F, $20, $0F, $00 
      .byte $00, $08, $0F, $43, $40, $04, $68, $00 
      .byte $08, $83, $59, $40, $04, $68, $00, $08 
      .byte $C7, $70, $40, $04, $68, $00, $08, $0F 
      .byte $43, $40, $04, $68, $00, $08, $45, $4B 
      .byte $40, $04, $68, $B0, $20, $0F, $00, $00 
      .byte $08, $C1, $2C, $40, $04, $68, $00, $08 
      .byte $D1, $12, $40, $04, $68, $00, $08, $A5 
      .byte $1F, $40, $04, $68, $00, $08, $1E, $19 
      .byte $40, $04, $68, $00, $08, $A2, $25, $40 
      .byte $04, $68, $B0, $38, $0F, $20, $0C, $00 
      .byte $18, $00, $09, $80, $08, $0F
WBD21:
      .byte $43, $98, $88, $90, $80, $08, $45, $4B 
      .byte $98, $88, $90, $80, $08, $7D, $54, $98 
      .byte $88, $90, $80, $08, $63, $38, $98, $88 
      .byte $90, $80, $08, $3C, $32, $98, $88, $98 
      .byte $80, $08, $C7, $70, $40, $0C, $88, $98 
      .byte $80, $08, $79, $64, $40, $12, $88, $90 
      .byte $B0, $38, $0F, $20, $07, $00, $58, $10 
      .byte $28, $00, $87, $30, $28, $78, $02, $00 
      .byte $08, $3C, $32, $98, $68, $90, $70, $60 
      lda  $4000,x                      
      asl  $0578                        
      pla                               
      bcc  WBD72                        
WBD72:
      tya                               
      bvs  WBDE4                        
      lda  W9068,x                      
      brk                               
      rti                               

      asl  $0278                        
      pla                               
      bcc  WBD80                        
WBD80:
      tya                               
      bvs  WBE00                        
      lda  W9068,x                      
      sei                               
      ora  ($00,x)                      
      php                               
      rol  W982A,x                      
      pla                               
      bcc  WBD90                        
WBD90:
      php                               
      cmp  ($2C,x)                      
      rti                               

      asl  W9068                        
      bvs  WBD21                        
      lda  $0800,x                      
      rol  W982A,x                      
      pla                               
      bcc  WBDA2                        
WBDA2:
      php                               
      cmp  ($2C,x)                      
      rti                               

      .byte $2E, $68, $90, $00, $08, $A2, $25, $40 
      .byte $16, $68, $90, $78, $02, $00, $08, $3E 
      .byte $2A, $98, $68, $90, $70, $B3, $BD, $00 
      .byte $40, $0E, $78, $05, $68, $90, $00, $98 
      .byte $70, $C2, $BD, $68, $90, $00, $40, $0E 
      .byte $78, $02, $68, $90, $00, $98, $70, $D0 
      .byte $BD, $68, $90, $78, $01, $00, $08, $A2 
      .byte $25, $98, $68, $90, $00, $08
WBDE4:
      .byte $3E, $2A, $40, $0E, $68, $90, $70, $DB 
      .byte $BD, $00, $08, $A2, $25, $98, $68, $90 
      .byte $00, $08, $3C, $32, $40, $48, $68, $90 
      .byte $48, $B0, $20, $37          
WBE00:
      .byte $32, $50, $18, $00, $08, $78, $01, $A0 
      .byte $01, $80, $08, $C3, $10, $98, $88, $90 
      .byte $80, $08, $87, $21, $98, $88, $90, $A8 
      .byte $09, $BE, $A0, $01, $80, $08, $D2, $0F 
      .byte $98, $88, $90, $80, $08, $A5, $1F, $98 
      .byte $88, $90, $A8, $1C, $BE, $A0, $01, $80 
      .byte $08, $EF, $0E, $98, $88, $90, $80, $08 
      .byte $DF, $1D, $98, $88, $90, $A8, $2F, $BE 
      .byte $A0, $01, $80, $08, $18, $0E, $98, $88 
      .byte $90, $80, $08, $31, $1C, $98, $88, $90 
      .byte $A8, $42, $BE, $A0, $03, $80, $08, $4E 
      .byte $0D, $98, $88, $90, $80, $08, $9C, $1A 
      .byte $98, $88, $90, $A8, $55, $BE, $A0, $01 
      .byte $80, $08, $8F, $0C, $98, $88, $90, $80 
      .byte $08, $1E, $19, $98, $88, $90, $A8, $68 
      .byte $BE, $80, $08, $18, $0E, $98, $88, $90 
      .byte $80, $08, $31, $1C, $98, $88, $90, $80 
      .byte $08, $D2, $0F, $98, $88, $90, $80, $08 
      .byte $A5, $1F, $98, $88, $90, $70, $07, $BE 
      .byte $90, $48, $B0, $38, $0F, $20, $00, $F0 
      .byte $80, $18, $00, $08, $08, $F7, $09, $40 
      .byte $01, $08, $8F, $0A, $40, $01, $08, $68 
      .byte $09, $40, $01, $08, $8F, $0A, $40, $01 
      .byte $08, $8F, $0C, $40, $01, $08, $4E, $0D 
      .byte $40, $01, $08, $18, $0E, $40, $01, $08 
      .byte $C3, $10, $40, $01, $08, $EF, $13, $40 
      .byte $01, $08, $60, $16, $40, $01, $08, $31 
      .byte $1C, $40, $01, $08, $DF, $1D, $40, $01 
      .byte $08, $86, $23, $40, $01, $08, $16, $22 
      .byte $40, $01, $08, $87, $21, $40, $01, $08 
      .byte $02, $24, $40, $01, $08, $86, $23, $40 
      .byte $01, $08, $3B, $25, $40, $01, $08, $02 
      .byte $26, $40, $01, $08, $86, $23, $40, $01 
      .byte $08, $20, $24, $40, $01, $88, $B0, $38 
      .byte $0F, $20, $0F, $00, $80, $18, $00, $08 
      .byte $78, $01, $08, $8F, $0C, $40, $03, $08 
      .byte $8F, $0B, $40, $01, $70, $1A, $BF, $88 
      .byte $90, $80, $18, $00, $08, $08, $5F, $10 
      .byte $40, $08, $88, $B0, $38, $0F, $20, $4F 
      .byte $F4, $18, $00, $08, $80, $08, $68, $03 
      .byte $40, $04, $80, $08, $89, $03, $40, $04 
      .byte $80, $08, $AE, $03, $40, $04, $80, $08 
      .byte $C8, $03, $40, $04, $80, $08, $AE, $03 
      .byte $40, $03, $80, $08, $93, $03, $40, $03 
      .byte $88, $B0, $38, $0F, $20, $2C, $C2, $78 
      .byte $02, $00, $08, $D6, $5E, $40, $03, $00 
      .byte $08, $C7, $70, $40, $03, $00, $08, $97 
      .byte $7E, $90, $70, $69, $BF, $68, $B0, $38 
      .byte $0F, $20, $0C, $00, $00, $08, $1E, $86 
      .byte $90, $68, $00, $08, $8B, $96, $90, $68 
      .byte $00, $08, $2B, $9F, $90, $68, $00, $08 
      .byte $FA, $A8, $90, $68, $00, $08, $30, $AB 
      .byte $90, $68, $00, $08, $06, $B3, $90, $00 
      .byte $08, $FF, $5E, $40, $03, $00, $08, $8B 
      .byte $5A, $40, $03, $20, $0C, $74, $00, $08 
      .byte $64, $56, $40, $03, $68, $B0, $10, $00 
      .byte $08, $00, $00, $B0, $38, $0F, $20, $07 
      .byte $60, $00, $08, $79, $64, $90, $78, $01 
      .byte $00, $08, $C7, $6F, $40, $03, $00, $08 
      .byte $C7, $69, $90, $70, $D0, $BF, $00, $08 
      .byte $79, $64, $40, $03, $78, $02, $00, $08 
      .byte $0F, $43, $90, $00, $08, $4B, $3F, $40 
      .byte $03, $70, $E6, $BF, $68, $48, $B0, $02 
      .byte $BB, $5A, $30, $5F, $EE, $3D, $A8, $00 
