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
          

.ENDMACRO

