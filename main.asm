.device  ATmega328p
.include "macro.inc"
.include "nRF24L01+.inc"
.include "include.inc"

init:     Initialization
          
lp:       cbi     PORTB, SS
          ldi     temp,   0x55
          out     SPDR,   temp
          rcall wait_SPI_free
          ldi     temp,   0x33
          out     SPDR,   temp
          rcall wait_SPI_free 
          sbi     PORTB, SS 
loop:     rjmp loop


          
