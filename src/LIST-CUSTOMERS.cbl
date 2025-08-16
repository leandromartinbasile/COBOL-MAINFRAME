000100 IDENTIFICATION DIVISION. 
000105*                                                        *
000110 PROGRAM-ID PGMAPJ1D. 
000120**********************************************************
000130*                                                        *
000140*    MATCHING code                                       *
000174**********************************************************
000180*      MANTENIMIENTO DE PROGRAMA                         *
000190**********************************************************
000191*    FECHA *    DETALLE        * COD * 
000192************************************** 
000193*          *                   *     * 
000194*          *                   *     * 
000195************************************** 
000196                                                                 
000200 ENVIRONMENT DIVISION. 
000201 CONFIGURATION SECTION. 
000202 SPECIAL-NAMES. 
000203     DECIMAL-POINT IS COMMA. 
000204                                                                 
000205 INPUT-OUTPUT SECTION. 
000206 FILE-CONTROL. 
000207                                                          
000208     SELECT FILE1   ASSIGN DDCLIEN 
000209     ACCESS IS SEQUENTIAL 
000214     FILE STATUS IS WS-FIL1-CODE. 
000215                                                        
000216     SELECT FILE2   ASSIGN DDMOVIM 
000218     ACCESS IS SEQUENTIAL 
000221     FILE STATUS IS WS-FIL2-CODE. 
000222                                                                 
000223       SELECT FILE3   ASSIGN DDSAL 
000224       ACCESS IS SEQUENTIAL 
000225       FILE STATUS IS WS-FIL3-CODE. 
000230                                                                
000390 DATA DIVISION. 
000391 FILE SECTION. 
000392                                                                
000393 FD FILE1 
000394      BLOCK CONTAINS 0 RECORDS 
000395      RECORDING MODE IS F. 
000396                                                                
000397 01 REG-FILE1       PIC X(30). 
000401                                                                
000402 FD FILE2 
000403      BLOCK CONTAINS 0 RECORDS 
000404      RECORDING MODE IS F. 
000405                                                                
000406 01 REG-FILE2       PIC X(80). 
000407                                                                
000408 FD FILE3 
000409      BLOCK CONTAINS 0 RECORDS 
000410      RECORDING MODE IS F. 
000411                                                                
000412 01 REG-FILE3       PIC X(30). 
000414                                                                
000415************************************** 
000416 WORKING-STORAGE SECTION. 
000417************************************** 
000418                                                                
000419 77  FILLER        PIC X(26) VALUE '* INICIO WORKING-STORAGE *'.
000420 77  FILLER        PIC X(26) VALUE '* CODIGOS RETORNO FILES  *'.
000421 77  WS-FIL1-CODE      PIC XX    VALUE SPACES. 
000422 77  WS-FIL2-CODE      PIC XX    VALUE SPACES. 
000423 77  WS-FIL3-CODE      PIC XX    VALUE SPACES. 
000424                                                                
000425 01  WS-STATUS-FIN    PIC X. 
000426     88  WS-FIN-LECTURA         VALUE 'Y'. 
000427     88  WS-NO-FIN-LECTURA      VALUE 'N'. 
000428                                                   
000429 01 WS-STA-FILE1     PIC X. 
000430     88  WS-FIN-FILE1           VALUE 'Y'. 
000431     88  WS-NO-FIN-FILE1        VALUE 'N'. 
000432                                                   
000433 01 WS-STA-FILE2     PIC X. 
000434     88  WS-FIN-FILE2           VALUE 'Y'. 
000435     88  WS-NO-FIN-FILE2        VALUE 'N'. 
000449                                                   
000450     COPY CLIENTE. 
000451     COPY MOVIMCC. 
000509                                                   
000510 01 WS-CLAVE1. 
000511     03  WS-TIP-DOC1      PIC 9(02)       VALUE ZEROS. 
000512     03  WS-NRO-DOC1      PIC 9(08)       VALUE ZEROS. 
000514                                                   
000515 01 WS-CLAVE2. 
000516     03  WS-TIP-DOC2      PIC 9(02)       VALUE ZEROS. 
000517     03  WS-NRO-DOC2      PIC 9(08)       VALUE ZEROS. 
000518                                                   
000519********     CONTADOR DE LEIDOS Y GRABADOS  * 
000520                                                   
000521 77 WS-LEIDOS-FILE1      PIC 9(05)        VALUE ZEROS.
000522 77 WS-LEIDOS-FILE2      PIC 9(05)        VALUE ZEROS.
000523 77 WS-ENCONTRADOS       PIC 9(05)        VALUE ZEROS.
000524 77 WS-NO-ENCONTRADO     PIC 9(05)        VALUE ZEROS.
000525 77 WS-CANT-GRABADOS     PIC 9(05)        VALUE ZEROS.
000526                                                   
000527 77 WS-LEYEN-FILE1       PIC X(35) VALUE 
000528              'CANTIDAD DE LEIDOS CLIENTES  :   '. 
000529                                                   
000530 77 WS-LEYEN-FILE2       PIC X(35) VALUE 
000531              'CANTIDAD DE LEIDOS NOVEDADES :   '. 
000532                                                   
000533                                                                  
000534 77  WS-LEYEN-ENCONTRADOS PIC X(35) VALUE 
000535                    'CANTIDAD ENCONTRADOS          :  '. 
000536                                                                  
000537 77  WS-LEYEN-NO-ENCONTRADO PIC X(35) VALUE 
000538                    'CANTIDAD DE NO ENCONTRADOS    :  '. 
000539                                                                  
000540********     FECHA DE PROCESO *************** 
000541                                                                  
000542 01  WS-FECHA. 
000543     03  WS-FECHA-AA      PIC 99            VALUE ZEROS. 
000544     03  WS-FECHA-MM      PIC 99            VALUE ZEROS. 
000545     03  WS-FECHA-DD      PIC 99            VALUE ZEROS. 
000546                                                                  
000547 77  FILLER        PIC X(26) VALUE '* FINAL  WORKING-STORAGE *'.
000548                                                                  
000549***************************************************************.
000550                                                                  
000551 PROCEDURE DIVISION. 
000552                                                                  
000553************************************** 
000554*                                    * 
000555*  CUERPO PRINCIPAL DEL PROGRAMA     * 
000560*                                    * 
000570************************************** 
000580                                                                  
000600 MAIN-PROGRAM. 
000601                                                                  
000602     PERFORM 1000-INICIO  THRU   F-1000-INICIO. 
000603                                                                  
000604     PERFORM 2000-PROCESO  THRU  F-2000-PROCESO 
000607               UNTIL WS-FIN-LECTURA. 
000608                                                                  
000612     PERFORM 9999-FINAL    THRU  F-9999-FINAL. 
000613                                                                  
000614 F-MAIN-PROGRAM. GOBACK. 
000615                                                                
000616************************************** 
000617*                                    * 
000618*  CUERPO INICIO APERTURA ARCHIVOS   * 
000619*                                    * 
000620************************************** 
000621                                                         
000622 1000-INICIO. 
000623                                                         
000630     ACCEPT WS-FECHA FROM DATE. 
000650                                                         
000702     SET WS-NO-FIN-LECTURA TO TRUE. 
000703     MOVE 'NO' TO WS-STATUS-FIN 
000704                                                         
000710     OPEN INPUT  FILE1. 
000711     IF WS-FIL1-CODE IS NOT EQUAL '00' 
000712        DISPLAY '* ERROR EN OPEN FILE1   = ' WS-FIL1-CODE
000713        MOVE 9999 TO RETURN-CODE 
000714        SET  WS-FIN-LECTURA TO TRUE 
000715     END-IF. 
000716                                                         
000719     OPEN INPUT  FILE2. 
000720     IF WS-FIL2-CODE IS NOT EQUAL '00' 
000721        DISPLAY '* ERROR EN OPEN MOVIMI  = ' WS-FIL2-CODE
000722        MOVE 9999 TO RETURN-CODE 
000723        SET  WS-FIN-LECTURA TO TRUE 
000724     END-IF. 
000756                                                         
000757     OPEN OUTPUT FILE3. 
000758                                                         
000759     IF WS-FIL3-CODE IS NOT EQUAL '00' 
000760        DISPLAY '* ERROR EN OPEN SALIDA = '  WS-FIL3-CODE
000761        MOVE 9999 TO RETURN-CODE 
000762        SET  WS-FIN-LECTURA TO TRUE 
000763     END-IF. 
000764                                                         
000765     PERFORM 3000-LEER-FILE1  THRU F-3000-LEER-FILE1. 
000766     PERFORM 4000-LEER-FILE2  THRU F-4000-LEER-FILE2. 
000767                                                                  
000768 F-1000-INICIO.   EXIT. 
000769                                                                  
000770************************************** 
000771*                                    * 
000772*  CUERPO PRINCIPAL DE PROCESOS      * 
000773*  LECTURA FILE INPUT CLASIFICADO    * 
000774*  APAREO ARCHIVOS DE ENTRADA        * 
000775*                                    * 
000776************************************** 
000777                                                                  
000778 2000-PROCESO. 
000779                                                                  
000780*    SON IGUALES; SUMAR APAREADOS      * 
000781                                                                  
000782     IF WS-CLAVE1   = WS-CLAVE2 
000783                                                                  
000784        ADD 1 TO WS-ENCONTRADOS 
000785                                                                  
000786        DISPLAY 'NOVEDAD: '   WS-CLAVE2 
000788                                                                  
000789        ADD WS-MOV-IMPORTE TO WS-CLI-SALDO 
000790                                                                  
000793        PERFORM 4000-LEER-FILE2 
000794                       THRU  F-4000-LEER-FILE2 
000797                                                                  
000798     ELSE 
000799                                                                  
000800*    CLAVE1 ES MAYOR QUE CLAVE2 ENTONCES ARMO SALIDA DESDE FILE2
000801*    NO ENCONTRO CUENTA PARA ACTUALIZAR 
000802                                                                  
000803        IF WS-CLAVE1   > WS-CLAVE2 
000804                                                                  
000805           ADD 1 TO WS-NO-ENCONTRADO 
000806                                                             
000807           DISPLAY 'NO ENCONTRADO:'  WS-CLAVE2 
000808                                                             
000809           PERFORM 4000-LEER-FILE2 
000810                       THRU   F-4000-LEER-FILE2 
000811                                                             
000812        ELSE 
000813                                                             
000814*    CLAVE1 ES MENOR QUE CLAVE2 ENTONCES ARMO SALIDA DESDE FILE1
000815*    CUENTA SIN MOVIMIENTOS 
000816                                                             
000819           PERFORM 2200-GRABAR-SAL  THRU 2200-GRABAR-SAL-F 
000820                                                             
000821           PERFORM 3000-LEER-FILE1 
000822                       THRU  F-3000-LEER-FILE1 
000823                                                             
000824        END-IF 
000825     END-IF. 
000826                                                             
000827************************************************************* 
000828* CONTROL FIN DE ARCHIVOS DE ENTRADA, PARA FIN PROGRAMA 
000829************************************************************* 
000830                                                             
000831     IF WS-FIN-FILE1 AND WS-FIN-FILE2 
000832        SET  WS-FIN-LECTURA TO TRUE 
000833     END-IF. 
000834                                                                
000835 F-2000-PROCESO. EXIT. 
000836                                                             
000837************************************** 
000838* LECTURA FILE1                      * 
000839************************************** 
000840                                                             
000841 3000-LEER-FILE1. 
000842                                                            
000843     READ FILE1   INTO WS-REG-CLIENTE 
000844                                                               
000845     EVALUATE WS-FIL1-CODE 
000846                                                               
000847        WHEN '00' 
000848                                                               
000849           ADD 1 TO WS-LEIDOS-FILE1 
000850           MOVE WS-CLI-TIPO    TO WS-TIP-DOC1 
000851           MOVE WS-CLI-CUENTA  TO WS-NRO-DOC1 
000852                                                               
000853        WHEN '10' 
000854                                                               
000855           SET WS-FIN-FILE1   TO TRUE 
000856           MOVE HIGH-VALUE   TO WS-CLAVE1 
000857                                                               
000858        WHEN OTHER 
000859                                                               
000860           DISPLAY '* ERROR EN LECTURA FILE1   = ' WS-FIL1-CODE
000861           MOVE 9999 TO RETURN-CODE 
000862           SET WS-FIN-FILE1   TO TRUE 
000863                                                               
000864     END-EVALUATE. 
000871                                                               
000872 F-3000-LEER-FILE1. EXIT. 
000873                                                                   
000874************************************** 
000875* LECTURA FILE2                      * 
000876************************************** 
000877                                                                   
000878 4000-LEER-FILE2. 
000879                                                               
000880     READ FILE2   INTO WS-REG-MOVIMI 
000881                                                               
000882     EVALUATE WS-FIL2-CODE 
000883                                                               
000884        WHEN '00' 
000885                      
000886           ADD 1 TO WS-LEIDOS-FILE2 
000887           MOVE WS-MOV-TIPO    TO WS-TIP-DOC2 
000888           MOVE WS-MOV-CUENTA  TO WS-NRO-DOC2 
000889                                                               
000890        WHEN '10' 
000891                                                               
000892           SET WS-FIN-FILE2   TO TRUE 
000893           MOVE HIGH-VALUE   TO WS-CLAVE2 
000894                                                               
000895        WHEN OTHER 
000896                                                               
000897           DISPLAY '* ERROR EN LECTURA FILE2   = ' WS-FIL2-CODE
000898           MOVE 9999 TO RETURN-CODE 
000899           SET WS-FIN-FILE2   TO TRUE 
000900                                                               
000901     END-EVALUATE. 
000902                                                               
000903 F-4000-LEER-FILE2. EXIT. 
000904                                                                   
000905************************************** 
000906*  GRABAR SALIDA                    * 
000907************************************** 
000908                                                                   
000909 2200-GRABAR-SAL. 
000910                                                               
000921     WRITE REG-FILE3    FROM WS-REG-CLIENTE 
000922                                                               
000923     EVALUATE WS-FIL3-CODE 
000924                                                               
000925        WHEN '00' 
000926                                                               
000927           ADD 1 TO WS-CANT-GRABADOS 
000928                                                               
000929        WHEN '10' 
000930                                                                
000931           CONTINUE              
000932                                                              
000933        WHEN OTHER 
000934                                                              
000935           DISPLAY '* ERROR EN GRABAR VALIDOS = ' WS-FIL3-CODE
000936           MOVE 9999 TO RETURN-CODE 
000937           SET WS-FIN-LECTURA  TO TRUE 
000938                                                           
000939     END-EVALUATE. 
000940                                                             
000941 2200-GRABAR-SAL-F.  EXIT. 
000942                                                                 
000943************************************** 
000944*                                 * 
000945*  CUERPO FINAL CIERRE DE FILES      * 
000946*                                 * 
000947************************************** 
000948                                                                 
000949 9999-FINAL. 
000950                                                           
000951     CLOSE FILE1. 
000952        IF WS-FIL1-CODE IS NOT EQUAL '00' 
000953           DISPLAY '* ERROR EN CLOSE FILE1   = ' 
000954                                      WS-FIL1-CODE 
000955           MOVE 9999 TO RETURN-CODE 
000956           SET WS-FIN-LECTURA TO TRUE 
000957        END-IF. 
000958                                                           
000959     CLOSE  FILE2 
000960        IF WS-FIL2-CODE IS NOT EQUAL '00' 
000961           DISPLAY '* ERROR EN CLOSE FILE2    =' 
000962                                      WS-FIL2-CODE 
000963           MOVE 9999 TO RETURN-CODE 
000964           SET WS-FIN-LECTURA TO TRUE 
000965        END-IF. 
000966                                                           
000967     CLOSE  FILE3  
000968        IF WS-FIL3-CODE IS NOT EQUAL '00' 
000969           DISPLAY '* ERROR EN CLOSE FILE3    =' 
000970                                      WS-FIL3-CODE 
000971           MOVE 9999 TO RETURN-CODE 
000972           SET WS-FIN-LECTURA TO TRUE 
000973        END-IF. 
000974                                                      
000975************************************** 
000976*   MOSTRAR TOTALES DE CONTROL 
000977************************************** 
000978                                                      
000979     DISPLAY WS-LEYEN-FILE1 WS-LEIDOS-FILE1. 
000980     DISPLAY WS-LEYEN-FILE2 WS-LEIDOS-FILE2. 
000981     DISPLAY WS-LEYEN-ENCONTRADOS WS-ENCONTRADOS. 
000982     DISPLAY WS-LEYEN-NO-ENCONTRADO  WS-NO-ENCONTRADO.
000983                                                      
000990 F-9999-FINAL. 
001000     EXIT. 
002000*                            
