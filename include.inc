.def      temp = R16
.def      temp1 = R17
.def      temp2 = R18
.def      temp3 = R18

.equ    MISO =  DDB4    
.equ    MOSI =  DDB3
.equ    SS   =  DDB2
.equ    SCK  =  DDB5 
.equ    CE   =  DDB1     

;---------SPI waiting for 
          rjmp    init
wait_SPI_free:
          in      temp,   SPSR
          sbrs    temp,   SPIF
          rjmp    wait_SPI_free
          in      temp,   SPDR
          ret



