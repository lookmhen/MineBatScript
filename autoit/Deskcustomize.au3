#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>
#pragma compile(Icon, "D:\icon\Deskcutomize.ico")

$Form1_1 = GUICreate("Add Menu rightclick", 325, 280, 1059, 313)
$nametextbox = GUICtrlCreateInput("", 104, 32, 121, 21)
$icontextbox = GUICtrlCreateInput("", 104, 64, 121, 21)
$runtextbox = GUICtrlCreateInput("explorer.exe microsoft-edge:", 104, 96, 121, 21)
$Label1 = GUICtrlCreateLabel("Name", 48, 32, 32, 17)
$Label2 = GUICtrlCreateLabel("RunPath", 48, 96, 46, 17)
$useradd = GUICtrlCreateButton("+ADD Menu", 60, 208, 91, 25, $WS_GROUP)
GUICtrlSetBkColor(-1, 0xFFFFE1)
GUICtrlSetCursor (-1, 0)
$Label3 = GUICtrlCreateLabel("IconPath", 48, 64, 47, 17)
$openiconpath = GUICtrlCreateButton("Browse", 232, 64, 60, 20, $WS_GROUP)
GUICtrlSetBkColor(-1, 0xFF6961)
GUICtrlSetCursor (-1, 0)
$Openrunpath = GUICtrlCreateButton("Browse", 232, 96, 60, 20, $WS_GROUP)
GUICtrlSetBkColor(-1, 0xFF6961)
GUICtrlSetCursor (-1, 0)
$HRISradio = GUICtrlCreateRadio("HRIS", 40, 128, 57, 17)
$Outlookradio = GUICtrlCreateRadio("Outlook", 40, 152, 57, 17)
$onenoteradio = GUICtrlCreateRadio("One Note", 128, 128, 65, 17)
$CMDradio = GUICtrlCreateRadio("CMD", 128, 152, 57, 17)
$ITWFradio = GUICtrlCreateRadio("ITWF", 40, 176, 57, 17)
$EWFradio = GUICtrlCreateRadio("EWF", 128, 176, 57, 17)
$admincheckbox = GUICtrlCreateCheckbox("Add/Del Allusers", 120, 245, 90, 20)
$calculatorradio = GUICtrlCreateRadio("Calculator", 208, 128, 81, 17)
$notepadradio = GUICtrlCreateRadio("Notepad", 208, 152, 81, 17)
$snippingradio = GUICtrlCreateRadio("Snipping Tools", 208, 176, 81, 17)
$delmenubutton = GUICtrlCreateButton("Delete Menu", 190, 208, 91, 25, $WS_GROUP)
GUICtrlSetBkColor(-1, 0xFF6961)
GUICtrlSetCursor (-1, 0)

GUISetState(@SW_SHOW)

if not IsAdmin() Then GUICtrlSetState($admincheckbox,$GUI_DISABLE) ;ปิดcheckbox delete allusersเมื่อไม่ใช่แอดมิน
While 1
	
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
			Case $HRISradio
			     HRIS ()
			Case $Outlookradio
			     Outlook ()
			Case $onenoteradio
			     Onenote ()
			Case $CMDradio
			     CMD ()
			Case $ITWFradio
			     ITWF ()
			Case $EWFradio
				 EWF ()
			Case $calculatorradio
				 Calculator()
			Case $notepadradio
				 notepad()
			 Case $snippingradio
				 spippingtools()
			Case $openiconpath
			   $File2open1 = FileOpenDialog ("Browse", "C:\", "All type (*.*)")
			   GUICtrlSetData($icontextbox, $File2open1)
			Case $Openrunpath
			   $File2open2 = FileOpenDialog ("Browse", "C:\", "All type (*.*)")
			   GUICtrlSetData($runtextbox, $File2open2)
		   
		   Case $useradd
				if GUICtrlRead($nametextbox) = "" Then
	           MsgBox(0,"", "กรุณากรอกข้อมูลให้ครบ")
			   elseif GUICtrlRead($icontextbox) = "" Then
	           MsgBox(0,"", "กรุณากรอกข้อมูลให้ครบ")
			   elseif GUICtrlRead($runtextbox) = "" Then
	           MsgBox(0,"", "กรุณากรอกข้อมูลให้ครบ")
		    ElseIf _IsChecked($admincheckbox) Then
			   adminadd ()
			Else
			  useradd ()
			  EndIf
		  Case $delmenubutton
			   if GUICtrlRead($nametextbox) = "" Then
				MsgBox(0,"", "กรุณากรอกชื่อที่ต้องการจะลบ")
			ElseIf _IsChecked($admincheckbox) Then
			  deleteallusers()
		  Else
			  delmenu()
			  EndIf
		  EndSwitch
WEnd



func adminadd ()
   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
RegWrite("HKCR\Directory\Background\shell\"&$Name&"", "", "REG_SZ", ""&$Name&"")
RegWrite("HKCR\Directory\Background\shell\"&$Name&"", "Icon", "REG_SZ", ""&$Iconpath&"")
RegWrite("HKCR\Directory\Background\shell\"&$Name&"\command", "", "REG_SZ", ""&$Runpath&"")
   MsgBox(0,"", ""&$Name&" Completed")
   GUICtrlSetData($nametextbox, "")
   GUICtrlSetData($icontextbox, "")
   GUICtrlSetData($runtextbox, "")
EndFunc

func useradd ()
   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)	 
RegWrite("HKCU\SOFTWARE\Classes\Directory\Background\shell\"&$Name&"", "", "REG_SZ", ""&$Name&"")
RegWrite("HKCU\SOFTWARE\Classes\Directory\Background\shell\"&$Name&"", "Icon", "REG_SZ", ""&$Iconpath&"")
RegWrite("HKCU\SOFTWARE\Classes\Directory\Background\shell\"&$Name&"\command", "", "REG_SZ", ""&$Runpath&"")
   MsgBox(0,"", ""&$Name&" Completed")
   GUICtrlSetData($nametextbox, "")
   GUICtrlSetData($icontextbox, "")
   GUICtrlSetData($runtextbox, "")
EndFunc

func delmenu ()
   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
RegDelete("HKCU\SOFTWARE\Classes\Directory\Background\shell\"&$Name&"")
   MsgBox(0,"", ""&$Name&" Delete Completed")
   GUICtrlSetData($nametextbox, "")
   GUICtrlSetData($icontextbox, "")
   GUICtrlSetData($runtextbox, "")
EndFunc

Func deleteallusers()
   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
RegDelete("HKCR\Directory\Background\shell\"&$Name&"")
   MsgBox(0,"", ""&$Name&" Delete Completed")
   GUICtrlSetData($nametextbox, "")
   GUICtrlSetData($icontextbox, "")
   GUICtrlSetData($runtextbox, "")
GUICtrlSetState($admincheckbox, $GUI_UNCHECKED)
EndFunc

func HRIS ()
   $sendName = GUICtrlSetData($nametextbox, "HRIS")
   $sendIconpath = GUICtrlSetData($icontextbox, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
   $sendRunpath = GUICtrlSetData($runtextbox, "explorer.exe microsoft-edge:https://hris.honda.co.th/Coach/login.aspx")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc

func Outlook ()
   $sendName = GUICtrlSetData($nametextbox, "Outlook")
   $sendIconpath = GUICtrlSetData($icontextbox, "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE")
   $sendRunpath = GUICtrlSetData($runtextbox, "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc

func Onenote ()

   $sendName = GUICtrlSetData($nametextbox, "One Note")
   $sendIconpath = GUICtrlSetData($icontextbox, "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE")
   $sendRunpath = GUICtrlSetData($runtextbox, "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc

func CMD ()
   $sendName = GUICtrlSetData($nametextbox, "C-M-D")
   $sendIconpath = GUICtrlSetData($icontextbox, "cmd.exe")
   $sendRunpath = GUICtrlSetData($runtextbox, "cmd.exe")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc

func ITWF ()
   $sendName = GUICtrlSetData($nametextbox, "ITWF")
   $sendIconpath = GUICtrlSetData($icontextbox, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
   $sendRunpath = GUICtrlSetData($runtextbox, "explorer.exe microsoft-edge:https://globalhonda.sharepoint.com/sites/aohatcmprd34/pages/dashboard.aspx")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc

func EWF ()
   $sendName = GUICtrlSetData($nametextbox, "EWF")
   $sendIconpath = GUICtrlSetData($icontextbox, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
   $sendRunpath = GUICtrlSetData($runtextbox, "explorer.exe microsoft-edge:https://make.powerapps.com/environments/3552d8a7-033a-4f6f-8dfd-9d13567b13d2/apps")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc


func Calculator ()
   $sendName = GUICtrlSetData($nametextbox, "Calculator")
   $sendIconpath = GUICtrlSetData($icontextbox, "calc.exe")
   $sendRunpath = GUICtrlSetData($runtextbox, "calc.exe")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc


func Notepad ()
   $sendName = GUICtrlSetData($nametextbox, "Notepad")
   $sendIconpath = GUICtrlSetData($icontextbox, "C:\Windows\system32\notepad.exe")
   $sendRunpath = GUICtrlSetData($runtextbox, "notepad.exe")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc


func spippingtools ()
   $sendName = GUICtrlSetData($nametextbox, "Snipping Tool")
   $sendIconpath = GUICtrlSetData($icontextbox, "SnippingTool.exe")
   $sendRunpath = GUICtrlSetData($runtextbox, "SnippingTool.exe")

   $Name = GUICtrlRead ($nametextbox)
   $Iconpath = GUICtrlRead ($icontextbox)
   $Runpath = GUICtrlRead ($runtextbox)
EndFunc









Func _IsChecked($idControlID)
        Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked

