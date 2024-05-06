#include <Date.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <WinAPIGdi.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#pragma compile(Icon, "D:\icon\Turtle.ico")
#Region ### START Koda GUI section ### Form=C:\Users\to1990823\Desktop\autoit\Form1.kxf
$Form1 = GUICreate("Taoping", 533, 432, 192, 124)
;~ _WinAPI_DwmExtendFrameIntoClientArea($Form1, _WinAPI_CreateMargins(0, 0, 25, 2))
$pinglog = GUICtrlCreateEdit("", 24, 80, 481, 297, BitOR($ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_HSCROLL,$WS_VSCROLL))
GUICtrlSetLimit(-1, 2000000)
$namelabel = GUICtrlCreateLabel("Name/IP >>", 80, 35, 65, 21)
$nameinput = GUICtrlCreateInput("", 152, 32, 153, 21)
$pingbutton = GUICtrlCreateButton("Start (F1)",190, 392, 75, 25, $WS_GROUP)
GUICtrlSetBkColor(-1, 0xbee932)
$clearlogbutton = GUICtrlCreateButton("Clearlog", 288, 392, 75, 25, $WS_GROUP)
$browse = GUICtrlCreateButton("Export..", 312, 32, 43, 25, $WS_GROUP)
GUISetState(@SW_SHOW)
Dim $Form1_1_AccelTable[1][2] = [["{F1}", $pingbutton]]
GUISetAccelerators($Form1_1_AccelTable)
#EndRegion ### END Koda GUI section ###

HotKeySet("{ESC}", "_ExitLoop")


				
while 1
$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		 Case $pingbutton
				if GUICtrlRead($pingbutton) = "Start (F1)" Then
                GUICtrlSetData($pingbutton, "Stop (ESC)")
				AdlibRegister("pingpong")
				Else
                GUICtrlSetData($pingbutton, "Start (F1)")
			EndIf
		Case $clearlogbutton
			GUICtrlSetData($pinglog," ")
			
		Case $browse
			$logsave = GUICtrlRead($pinglog)
			$savelocation = FileSaveDialog('Save file', 'c:\', 'Text File (*.txt)',16)
			FileWrite($savelocation,$logsave)
		EndSwitch	
WEnd
		

Func pingpong()
    ; Ping the AutoIt website with a timeout of 250ms.
        

		 $comname = GUICtrlRead($nameinput)
		 Local $iPing = Ping($comname, 250)
		 If $iPing Then
		 GUICtrlSetData($pinglog," Reply From "&$comname &" "& "  ("&$iPing &")"&" ms on " &_NowTime() &@CRLF,1)

		 ElseIf @error = "0" Then
		 GUICtrlSetData($pinglog," Not respond "&$comname &" "& "  ("&$iPing &")"&" ms on " &_NowTime() &@CRLF,1)

		 ElseIf @error = "1" Then
		 GUICtrlSetData($pinglog," Host is Offline " &" "& $iPing &" ms on " &_NowTime() &@CRLF,1)

	     ElseIf @error = "2" Then
		 GUICtrlSetData($pinglog," Host is unreachable " &" "& $iPing &" ms on " &_NowTime() &@CRLF,1)

	     ElseIf @error = "3" Then
		 GUICtrlSetData($pinglog," Bad Destination " &" "& $iPing &" ms on " &_NowTime() &@CRLF,1)

	     ElseIf @error ="4" Then
		 GUICtrlSetData($pinglog," Please Check Name or IP " &_NowTime() &@CRLF,1)
	     EndIf
        Sleep (2000)
EndFunc

Func _ExitLoop()
	AdlibUnRegister("pingpong")
	GUICtrlSetData($pingbutton, "Start (F1)")
	Sleep(100)
EndFunc

