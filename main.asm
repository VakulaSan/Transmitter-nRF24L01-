.device  ATmega328p
.include "macro.inc"
.include "nRF24L01+.inc"
.include "include.inc"

init:     Initialization
          ldi     temp,   0xFF
          out     DDRC,   temp
          
lp:       cbi     PORTB, SS
          ldi     temp,   0x33
          out     SPDR,   temp
          
          rcall wait_SPI_free
          sbi     PORTC, 3

          ldi     temp,   0x33
          out     SPDR,   temp
          
          rcall wait_SPI_free
          
          
          sbi     PORTB, SS 
          sbi     PORTC, 3
          
loop:     rjmp lp


          
