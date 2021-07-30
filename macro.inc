.MACRO    Initialization 
          ;-------Setup Stack pointer
          ldi     temp,   high(RAMEND)
          out     SPH,    temp
          ldi     temp,   low(RAMEND)
          out     SPL,    temp
          ;-------Setup SPI
          ldi     temp,   (1<<SPIE) | (1<<SPE) | (1<<MSTR)
          out     SPCR,   temp
          ldi     temp,   (1<<MOSI) | (1<<SS) | (1<<SCK) | (1<<CE)
          out     DDRB,   temp
          
.ENDMACRO
