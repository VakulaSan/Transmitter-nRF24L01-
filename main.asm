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
          ldi     temp,   (1<<PWR_UP) | (1<<PRIM_RX) | (1<<EN_CRC) 
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS      

          rcall delay 

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (EN_AA)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   (1<<ENAA_P0)   
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (EN_RXADDR)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   (1<<ERX_P0)   
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (SETUP_AW)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   (SETUP_AW_5BYTES_ADDRESS)   
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 
          
          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (RF_CH)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   (0x02)   
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (RF_SETUP)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   (0x11<<RF_PWR) | (0<<RF_DR_LOW) | (1<<RF_DR_HIGH)   
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS 

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (STATUS)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   (1<<RX_DR) | (0<<TX_DS) | (1<<MAX_RT)   
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (RX_ADDR_P0)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free  
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free
          sbi     PORTB, SS 

          cbi     PORTB, SS
          ldi     temp,   (W_REGISTER) | (TX_ADDR)
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free  
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free
          ldi     temp,   0xE7   
          out     SPDR,   temp
          rcall wait_SPI_free
          ldi     temp,   0xE7   
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

lp:       cbi     PORTB, SS
          ldi     temp,   R_RX_PAYLOAD
          out     SPDR,   temp
          rcall wait_SPI_free          
          ldi     temp,   NOP_
          out     SPDR,   temp
          rcall wait_SPI_free         
          sbi     PORTB, SS   

          rcall delay       
           
loop:     rjmp lp


          
