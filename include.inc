.def       temp = R16
#define    MISO  DDB4    
#define    MOSI  DDB3
#define    SS    DDB2
#define    SCK   DDB5 


          ;-------Setup Stack pointer
          ldi     temp,   high(RAMEND)
          out     SPH,    temp
          ldi     temp,   low(RAMEND)
          out     SPL,    temp
          ;-------Setup SPI
          ldi     temp,   (1<<SPIE) | (1<<SPE) | (1<<MSTR)
          out     SPCR,   temp
