#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <Debug.au3>
#include <Array.au3>
#pragma compile(Icon, "D:\icon\Eraser.ico")
#Region
$Form1 = GUICreate("Delete Profilelist", 377, 113, 408, 271)
GUICtrlSetBkColor($Form1, 0xc46291)
$userinput = GUICtrlCreateInput("", 120, 40, 137, 21)
$Label1 = GUICtrlCreateLabel("Input Username", 24, 40, 88, 17)
GUICtrlCreateLabel("By MIT HuaTimBore", 280, 98, 120, 17)
GUICtrlSetColor(-1, 0xc46291)
$DeleteButton = GUICtrlCreateButton("Delete Profilelist", 144, 72, 85, 25, $WS_GROUP)
GUICtrlSetBkColor(-1, 0xc46291)
$Showlist = GUICtrlCreateButton("User List", 264, 40, 75, 25, $WS_GROUP)
GUICtrlSetBkColor(-1, 0x2c8c69)
GUISetState(@SW_SHOW)
#EndRegion
 
		 
While 1
$nMsg = GUIGetMsg()
Switch $nMsg
	Case $GUI_EVENT_CLOSE
	Exit
	
	Case $Showlist
	Showlist()
	
	Case $DeleteButton ;ปุ่มdelete
	if GUICtrlRead($userinput) = "" Then 
	MsgBox(0,"","กรุณากรอกข้อมูลให้ครบ")
	ElseIf FileExists("C:\Users\"&GUICtrlRead($userinput)) Then
	GUICtrlSetBkColor($DeleteButton, 0xD2D2CF)
	GUICtrlSetData($DeleteButton, "Please Wait")
	GUICtrlSetBkColor($DeleteButton, 0xFF0000)
	Thread()
	
	Else
	
	MsgBox(0,"","ไม่มี Folder "&GUICtrlRead($userinput)&" นี้")
	
	delprofilelist ()
	
	EndIf

EndSwitch
	
WEnd




Func delprofilefolder ()
	$path=GUICtrlRead($userinput)
		DirRemove("C:\Users\"&$path,1)
		If FileExists("C:\Users\"&$path) Then   ;;เช็คว่ายังมีFolder อยู่หรือไม่หลังจากลบ ถ้าไม่หายต้องrestart แล้วลองลบอีกครั้ง##
		MsgBox(0,"","ลบfolder  "&$path&"ไม่สำเร็จโปรดrestart และลองลบอีกครั้ง")
		Else
		MsgBox(0,"","ลบfolder  "&$path&"เรียบร้อยแล้ว")
		EndIf
		GUICtrlSetBkColor($DeleteButton, 0xD2D2CF)
		GUICtrlSetData($DeleteButton, "Delete Profilelist")
		AdlibUnRegister("checkuser")
		delprofilelist ()
EndFunc

Func checkuser()

    If GUICtrlRead($userinput) = "B1" Then
        MsgBox(0, "", "userนี้ห้ามลบนะจ๊ะของMIT")
    Else
        delprofilefolder()
    EndIf
EndFunc


;;ลบfolder userใน c:\users
Func delprofilelist ()
	;;loopหา SID ในprofilelist (regedit) ค้นหาจาก ค่าที่อยู่ใน  ProfileImagePath ซึ่งคือUser หรือชื่อfolder ในc:\Users  ##
	$username = GUICtrlRead ($userinput)
	$sKey = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\"
	; Get the number of subkeys
    $numSubKeys = _RegEnumKeyCount($sKey)
	
	For $i = 1 to $numSubKeys
		$sSubKey = RegEnumKey($sKey, $i)
		$sVal = RegRead($sKey & $sSubKey, "ProfileImagePath")
		If $sVal = "C:\Users\" & $username Then
			RegDelete($sKey & $sSubKey)
			GUICtrlSetData($DeleteButton, "Delete Profilelist")
			GUICtrlSetData($userinput, "")
		EndIf
	Next
EndFunc

Func _RegEnumKeyCount($sKey)
    Local $iCount = 0
    Local $i = 1

    While 1
        $sSubKey = RegEnumKey($sKey, $i)
        If @error <> 0 Then ExitLoop
        $iCount += 1
        $i += 1
    WEnd

    Return $iCount
EndFunc




;;list userทั้งหมดออกมาเก็บในarray
Func Showlist()
;;List รายชื่อ user ที่อยู่ใน Folder C:\Users ออกมาให้ดูทั้งหมดผ่าน Array
        Local $aFileList = _FileListToArray("C:\Users", Default, False)
		_DebugArrayDisplay($aFileList,"User List")
	EndFunc
	
	
	
Func  Thread()
;add function to library
    AdlibRegister ("checkuser")
EndFunc	