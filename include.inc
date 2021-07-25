.def      temp = R16
.def      temp1 = R17
.def      temp2 = R18
.def      temp3 = R18

.equ    MISO =  4    
.equ    MOSI =  3
.equ    SS   =  2
.equ    SCK  =  5 
.equ    CE   =  1     

;---------SPI waiting for 
          rjmp    init
wait_SPI_free:
wp:       in      temp,   SPSR
          sbrs    temp,   SPIF
          rjmp    wp
          in      temp,   SPDR
          ret

delay:   ldi    temp1,  3
lp0:      dec     temp1
          breq    exit
          ldi     temp2,  255
lp2:	     dec     temp2
          breq    lp0
          ldi     temp3,  255
lp3:	     dec     temp3 
          breq    lp2
          rjmp    lp3
exit:      ret

