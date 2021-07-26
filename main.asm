.device  ATmega328p
.include "macro.inc"
.include "nRF24L01+.inc"
.include "include.inc"

init:     Initialization
          ldi     temp,   0xFF
          out     DDRC,   temp

          rcall delay
          
          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (CONFIG)
          out     SPDR,   temp
          rcall wait_SPI_free
          sbi     PORTC, 3
          ldi     temp,   (1<<PWR_UP) 
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 
          cbi     PORTC, 3
          
          cbi     PORTB, SS
          ldi     temp,   W_TX_PAYLOAD
          out     SPDR,   temp
          rcall wait_SPI_free
          sbi     PORTC, 3
          ldi     temp,   0xFF 
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 
          sbi     PORTC, 3
          sbi     PORTB,  CE
          rcall   delay  
loop:     rjmp loop


          
