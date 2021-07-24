.def       temp = R16
#define    MISO   DDB4    
#define    MOSI   DDB3
#define    SS     DDB2
#define    SCK    DDB5 


wait_SPI_free:
          in      temp,   SPSR
          sbrs    temp,   SPIF
          rjmp    wait_SPI_free
          in      temp,   SPDR
          ret



