.MACRO    Initialization 
          ;-------Setup Stack pointer
          ldi     temp,   high(RAMEND)
          out     SPH,    temp
          ldi     temp,   low(RAMEND)
          out     SPL,    temp
          ;-------Setup SPI
          ldi     temp,   (1<<SPIE) | (1<<SPE) | (1<<MSTR)
          out     SPCR,   temp
          sbi     DDRB,   MOSI
          sbi     DDRB,   SS
          sbi     DDRB,   SCK
          sbi     DDRB,   CE
          sbi     PORTB,  SS
          delay:   ldi     temp1,  3
lp0:      dec     temp1
          breq    exit
          ldi     temp2,  255
lp2:	     dec     temp2
          breq    lp0
          ldi     temp3,  255
lp3:	     dec     temp3 
          breq    lp2
          rjmp    lp3
exit:      ret
.ENDMACRO

