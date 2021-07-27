.device  ATmega328p
.include "macro.inc"
.include "nRF24L01+.inc"
.include "include.inc"

init:     Initialization
lp:       ldi     temp,   0xFF
          out     DDRC,   temp

          
          
          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (CONFIG)
          out     SPDR,   temp
          rcall wait_SPI_free
          
          ldi     temp,   (1<<PWR_UP) 
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 
          
          
          cbi     PORTB, SS
          ldi     temp,   W_TX_PAYLOAD
          out     SPDR,   temp
          rcall wait_SPI_free
          
          ldi     temp,   0x55
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 
          

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (RX_PW_P0)
          out     SPDR,   temp
          rcall wait_SPI_free
          
          ldi     temp,   0x01   
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 


          sbi     PORTB,  CE
           
loop:     rjmp loop


          
