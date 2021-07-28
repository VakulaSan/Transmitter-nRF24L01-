.device  ATmega328p
.include "macro.inc"
.include "nRF24L01+.inc"
.include "include.inc"

init:     Initialization
          rcall delay

          cbi     PORTB, SS
          ldi     temp,   (FLUSH_TX)
          out     SPDR,   temp
          rcall wait_SPI_free     
          sbi     PORTB, SS 
          
          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (CONFIG)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   (1<<PWR_UP) 
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 
          
          rcall delay

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (RX_PW_P0)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   0x01   
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 

lp:       cbi     PORTB, SS
          ldi     temp,   W_TX_PAYLOAD
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   0x66
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 

          cbi     PORTB, SS
          ldi     temp,   W_TX_PAYLOAD
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   0x77
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 

          cbi     PORTB, SS
          ldi     temp,   W_TX_PAYLOAD
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   0x88
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 
          
          cbi     PORTB, SS
          ldi     temp,   (FIFO_STATUS)
          out     SPDR,   temp
          rcall wait_SPI_free 
          ldi     temp,   NOP_
          out     SPDR,   temp
          rcall wait_SPI_free      
          sbi     PORTB, SS           

          

          sbi     PORTB,  CE
          rcall delay 
          cbi     PORTB,  CE 
loop:     rjmp lp


          
