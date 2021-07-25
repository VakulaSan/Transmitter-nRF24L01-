.device  ATmega328p
.include "macro.inc"
.include "nRF24L01+.inc"
.include "include.inc"

init:     Initialization
          cbi     PORTB, SS
          ldi     temp,   (R_REGISTER<<4) | (1<<CONFIG)
          out     SPDR,   temp
          rcall wait_SPI_free
          ldi     temp,   (1<<PWR_UP)
          rcall wait_SPI_free  
loop:     rjmp init


          
