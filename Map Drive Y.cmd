@echo off
color 0f
chcp 65001
cls
:menu
cls
 ECHO ________________________ Select Number For Drive Y _________________________

  
   ECHO 1.AE2	     21.IB		  41.QI		       
   ECHO 2.AE	     22.IL		  42.SC
   ECHO 3.AF2	     23.LP		  43.SCC    
   ECHO 4.AF	     24.MC		  44.SCQ      
   ECHO 5.AP	     25.MQ		  45.SE_s              
   ECHO 6.AR	     26.MS		  46.SE_Center           
   ECHO 7.BP	     27.NMC		  47.TBR       
   ECHO 8.CA	     28.PA2		  48.VQ1  
   ECHO 9.CI	     29.PA		  49.VQ2            
   ECHO 10.CP	     30.PCC2	          50.VQ_A             
   ECHO 11.CR	     31.PCC		  51.WE2            
   ECHO 12.EB	     32.PC		  52.WE           
   ECHO 13.EQ	     33.PN                53.IT		         
   ECHO 14.FA2       34.PO	      
   ECHO 15.FA	     35.PO2                      
   ECHO 16.FE	     36.PP                  
   ECHO 17.GA	     37.PR 	                          
   ECHO 18.GP	     38.QD_MP                                  
   ECHO 19.HD	     39.QD_NM                                
   ECHO 20.HR        40.QE	         
                

  
 ECHO ________________________ Select Number For Drive Y _________________________

SET INPUT=
SET /P INPUT=Please select a number:
(
IF /I '%INPUT%'=='1' GOTO 01
IF /I '%INPUT%'=='2' GOTO 02
IF /I '%INPUT%'=='3' GOTO 03
IF /I '%INPUT%'=='4' GOTO 04
IF /I '%INPUT%'=='5' GOTO 05
IF /I '%INPUT%'=='6' GOTO 06
IF /I '%INPUT%'=='7' GOTO 07
IF /I '%INPUT%'=='8' GOTO 08
IF /I '%INPUT%'=='9' GOTO 09
IF /I '%INPUT%'=='10' GOTO 10
IF /I '%INPUT%'=='11' GOTO 11
IF /I '%INPUT%'=='12' GOTO 12
IF /I '%INPUT%'=='13' GOTO 13
IF /I '%INPUT%'=='14' GOTO 14
IF /I '%INPUT%'=='15' GOTO 15
IF /I '%INPUT%'=='16' GOTO 16
IF /I '%INPUT%'=='17' GOTO 17
IF /I '%INPUT%'=='18' GOTO 18
IF /I '%INPUT%'=='19' GOTO 19
IF /I '%INPUT%'=='20' GOTO 20
IF /I '%INPUT%'=='21' GOTO 21
IF /I '%INPUT%'=='22' GOTO 22
IF /I '%INPUT%'=='23' GOTO 23
IF /I '%INPUT%'=='24' GOTO 24
IF /I '%INPUT%'=='25' GOTO 25
IF /I '%INPUT%'=='26' GOTO 26
IF /I '%INPUT%'=='27' GOTO 27
IF /I '%INPUT%'=='28' GOTO 28
IF /I '%INPUT%'=='29' GOTO 29
IF /I '%INPUT%'=='30' GOTO 30
IF /I '%INPUT%'=='31' GOTO 31
IF /I '%INPUT%'=='32' GOTO 32
IF /I '%INPUT%'=='33' GOTO 33
IF /I '%INPUT%'=='34' GOTO 34
IF /I '%INPUT%'=='35' GOTO 35
IF /I '%INPUT%'=='36' GOTO 36
IF /I '%INPUT%'=='37' GOTO 37
IF /I '%INPUT%'=='38' GOTO 38
IF /I '%INPUT%'=='39' GOTO 39
IF /I '%INPUT%'=='40' GOTO 40
IF /I '%INPUT%'=='41' GOTO 41
IF /I '%INPUT%'=='42' GOTO 42
IF /I '%INPUT%'=='43' GOTO 43
IF /I '%INPUT%'=='44' GOTO 44
IF /I '%INPUT%'=='45' GOTO 45
IF /I '%INPUT%'=='46' GOTO 46
IF /I '%INPUT%'=='47' GOTO 47
IF /I '%INPUT%'=='48' GOTO 48
IF /I '%INPUT%'=='49' GOTO 49
IF /I '%INPUT%'=='50' GOTO 50
IF /I '%INPUT%'=='51' GOTO 51
IF /I '%INPUT%'=='52' GOTO 52
)
 ELSE (
	GOTO menu
)


:01
net use Y: /delete
net use Y: \\192.168.1.105\AE2_share\AE2
goto menu

:02
net use Y: /delete
net use Y: \\192.168.1.105\AE_share\AE
goto menu
:03
net use Y: /delete
net use Y: \\192.168.1.105\AF2_share\AF2
goto menu
:04
net use Y: /delete
net use Y: \\192.168.1.105\AF_share\AF
goto menu
:05
net use Y: /delete
net use Y: \\192.168.1.105\AP_share\AP
goto menu
:06
net use Y: /delete
net use Y: \\192.168.1.105\AR_share\AR
goto menu
:07
net use Y: /delete
net use Y: \\192.168.1.105\BP_share\BP
goto menu
:08
net use Y: /delete
net use Y: \\192.168.1.105\CA_share\CA
goto menu
:09
net use Y: /delete
net use Y: \\192.168.1.105\CI_share\CI
goto menu
:10
net use Y: /delete
net use Y: \\192.168.1.105\CP_share\CP
goto menu
:11
net use Y: /delete
net use Y: \\192.168.1.105\CR_share\CR
goto menu
:12
net use Y: /delete
net use Y: \\192.168.1.105\EB_share\EB
goto menu
:13
net use Y: /delete
net use Y: \\192.168.1.105\EQ_share\EQ
goto menu
:14
net use Y: /delete
net use Y: \\192.168.1.105\FA2_share\FA2
goto menu
:15
net use Y: /delete
net use Y: \\192.168.1.105\FA_share\FA
goto menu
:16
net use Y: /delete
net use Y: \\192.168.1.105\FE_share\FE
goto menu
:17
net use Y: /delete
net use Y: \\192.168.1.105\GA_share\GA
goto menu
:18
net use Y: /delete
net use Y: \\192.168.1.105\GP_share\GP
goto menu
:19
net use Y: /delete
net use Y: \\192.168.1.105\HD_share\HD
goto menu
:20
net use Y: /delete
net use Y: \\192.168.1.105\HR_share\HR
goto menu
:21
net use Y: /delete
net use Y: \\192.168.1.105\IB_share\IB
goto menu
:22
net use Y: /delete
net use Y: \\192.168.1.105\IL_share\IL
goto menu
:23
net use Y: /delete
net use Y: \\192.168.1.105\LP_share\LP
goto menu
:24
net use Y: /delete
net use Y: \\192.168.1.105\MC_share\MC
goto menu
:25
net use Y: /delete
net use Y: \\192.168.1.105\MQ_share\MQ
goto menu
:26
net use Y: /delete
net use Y: \\192.168.1.105\MS_share\MS
goto menu
:27
net use Y: /delete
net use Y: \\192.168.1.105\NMC_share\NMC
goto menu
:28
net use Y: /delete
net use Y: \\192.168.1.105\PA2_share\PA2
goto menu
:29
net use Y: /delete
net use Y: \\192.168.1.105\PA_share\PA
goto menu
:30
net use Y: /delete
net use Y: \\192.168.1.105\PCC2_share\PCC2
goto menu
:31
net use Y: /delete
net use Y: \\192.168.1.105\PCC_share\PCC
goto menu
:32
net use Y: /delete
net use Y: \\192.168.1.105\PC_share\PC
goto menu
:33
net use Y: /delete
net use Y: \\192.168.1.105\PN_share\PN
goto menu
:34
net use Y: /delete
net use Y: \\192.168.1.105\PO_share\PO
goto menu
:35
net use Y: /delete
net use Y: \\192.168.1.105\PO2_share\PO2
goto menu
:36
net use Y: /delete
net use Y: \\192.168.1.105\PP_share\PP
goto menu
:37
net use Y: /delete
net use Y: \\192.168.1.105\PR_share\PR
goto menu
:38
net use Y: /delete
net use Y: \\192.168.1.105\QD_MP_share\QD_MP
goto menu
:39
net use Y: /delete
net use Y: \\192.168.1.105\QD_NM_share\QD_NM
goto menu
:40
net use Y: /delete
net use Y: \\192.168.1.105\QE_share\QE
goto menu
:41
net use Y: /delete
net use Y: \\192.168.1.105\QI_share\QI
goto menu
:42
net use Y: /delete
net use Y: \\192.168.1.105\SC_share\SC
goto menu
:43
net use Y: /delete
net use Y: \\192.168.1.105\SCC_share\SCC
goto menu
:44
net use Y: /delete
net use Y: \\192.168.1.105\scq\SCQ
goto menu
:45
net use Y: /delete
net use Y: \\192.168.1.105\SE_share\SE
:46
net use Y: /delete
net use Y: \\192.168.1.105\SE_Center
goto menu
:47
net use Y: /delete
net use Y: \\192.168.1.105\TBR_share\TBR
goto menu
:48
net use Y: /delete
net use Y: \\192.168.1.105\VQ1_share\VQ1
goto menu
:49
net use Y: /delete
net use Y: \\192.168.1.105\VQ2_share\VQ2
goto menu
:50
net use Y: /delete
net use Y: \\192.168.1.105\VQ_A_share\VQ-A
goto menu
:51
net use Y: /delete
net use Y: \\192.168.1.105\WE2_share\WE2
goto menu
:52
net use Y: /delete
net use Y: \\192.168.1.105\WE_share\WE
goto menu
:53
net use Y: /delete
net use Y: \\192.168.1.105\IT_share\IT
goto menu

)

@pause