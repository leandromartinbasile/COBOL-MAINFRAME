000431       ************************************** 
000432       *         LAYOUT CLIENTES            * 
000433       *         LARGO REGISTRO: 30 BYTES   * 
000434       ************************************** 
000435        01  WS-REG-CLIENTE. 
000436            03  WS-CLI-CLAVE. 
000437               05  WS-CLI-NRO          PIC 9(05)       VALUE ZEROS. 
000439       *    02 CUENTAS CORRIENTES 
000440       *    03 CAJA DE AHORROS 
000441       *    04 PLAZO FIJO 
000442               05  WS-CLI-TIPO         PIC 9(02)       VALUE ZEROS. 
000443               05  WS-CLI-CUENTA       PIC 9(08)       VALUE ZEROS. 
000444                                                                     
000445            03  WS-CLI-SALDO           PIC S9(09)V99   VALUE ZEROS. 
000446                                                                     
000447            03  FILLER                 PIC X(04)       VALUE SPACES. 
000448                                                                     
000465                                                                     
