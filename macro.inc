.MACRO    Initialization 
          ;-------Setup Stack pointer
          ldi     temp,   high(RAMEND)
          out     SPH,    temp
          ldi     temp,   low(RAMEND)
          out     SPL,    temp
          ;-------Setup SPI
          ldi     temp,   (1<<SPIE) | (1<<SPE) | (1<<MSTR)
          out     SPCR,   temp
          sbi     DDRB,   DDB3
          sbi     DDRB,   DDB2
          sbi     DDRB,   DDB5
          sbi     DDRB,   DDB1
          sbi     PORTB,  PB2
.ENDMACRO

