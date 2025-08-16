000435       ************************************** 
000436       * LAY-OUT MOVIMIENTOS 
000437       * LARGO REGISTRO: 80 BYTES 
000438       ************************************** 
000439        01  WS-REG-MOVIMI. 
000441       * WS-MOV-NRO NRO. CLIENTE AL QUE PERTENECE EL MOVIMIENTO. 
000442            03  WS-MOV-NRO          PIC 9(05)        VALUE ZEROS. 
000443            03  WS-MOV-CLAVE. 
000444       *    02 CUENTAS CORRIENTES 
000445       *    03 CAJA DE AHORROS 
000446       *    04 PLAZO FIJO 
000447                05  WS-MOV-TIPO         PIC 9(02)        VALUE ZEROS. 
000448                05  WS-MOV-CUENTA       PIC 9(08)        VALUE ZEROS. 
000449                                                                       
000450            03  WS-MOV-IMPORTE          PIC S9(09)V99    VALUE ZEROS. 
000451       *    FORMATO FECHA AAAAMMDD 
000452            03  WS-MOV-FECHA            PIC 9(08)        VALUE ZEROS. 
000453                                                                       
000454            03  FILLER                  PIC X(46)        VALUE SPACES. 
000460                                                                       
