000001 //usuario JOB CLASS=A,MSGCLASS=O,MSGLEVEL=(1,1),NOTIFY=&SYSUID, 
000002 //             TIME=(,3) 
000003 //JCLLIB       JCLLIB ORDER=libreriaJCL 
000004 //*********************************************** 
000005 //*   COMPILADOR COBOL BATCH                    * 
000006 //*********************************************** 
000007 //STEP1  EXEC COMPCOBO, 
000008 //       ALUMLIB=libreriaUsuario, 
000009 //       GOPGM=PGMMATCH 
000010 //COBOL.SYSLIB DD DSN=libreriaCopy,DISP=SHR 
