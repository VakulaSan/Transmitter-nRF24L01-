.def      temp = R16
.def      temp1 = R17
.def      temp2 = R18
.def      temp3 = R19

.equ    CE   =  1 
.equ    SS   =  2
.equ    MOSI =  3
.equ    MISO =  4   
.equ    SCK  =  5 
    


          rjmp    init

;---------SPI waiting for 
wait_SPI_free:
wp:       in      temp,   SPSR
          sbrs    temp,   SPIF
          rjmp    wp
          in      temp,   SPDR
          ret

;--------Delay
delay:   ldi    temp1,  2

lp0:      dec     temp1
          breq    exit
          ldi     temp2,  255
lp2:	     dec     temp2
          breq    lp0
          ldi     temp3,  255
lp3:	     dec     temp3 
          breq    lp2
          rjmp    lp3
exit:     ret

;---------Read nRF24L01+ register
read_nrf_command:
          push    YH
          push    YL
          in      YL,     SPH
          in      YH,     SPL
          ldd     temp,   Y+6
          push    temp
          cbi     PORTB, SS
          out     SPDR,   temp
          rcall wait_SPI_free
          ;--save temp into variable Status_reg
          pop     temp
          cpi     temp,   STATUS
          breq    exit2          
          ldd     temp,   Y+5
          out     SPDR,   temp
          rcall wait_SPI_free   
          ;--save temp into variable Status_reg      
          sbi     PORTB, SS           
exit2:    ret

