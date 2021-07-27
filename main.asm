.device  ATmega328p
.include "macro.inc"
.include "nRF24L01+.inc"
.include "include.inc"

init:     Initialization
lp:       ldi     temp,   0xFF
          out     DDRC,   temp

          rcall delay          
          
          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (CONFIG)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   (1<<PWR_UP) | (1<<PRIM_RX)
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
          rcall delay
          cbi     PORTB, CE

          cbi     PORTB, SS
          ldi     temp,   R_RX_PAYLOAD
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   NOP_
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 
          
          
           
loop:     rjmp lp


          
