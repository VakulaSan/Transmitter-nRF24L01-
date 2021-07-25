.def       temp = R16
.equ    MISO =  DDB4    
.equ    MOSI =  DDB3
.equ    SS   =  DDB2
.equ    SCK  =  DDB5 

;---------SPI waiting for 
          rjmp    init
wait_SPI_free:
          in      temp,   SPSR
          sbrs    temp,   SPIF
          rjmp    wait_SPI_free
          in      temp,   SPDR
          ret



