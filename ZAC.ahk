if !FileExist("C:\RNApolymerasetestpath") {
	FileCreateDir, C:\RNApolymerasetest
}

if !FileExist("C:\RNApolymerasetest\ZACver2path.txt") {
	FileAppend, , C:\RNApolymerasetest\ZACver2path.txt
	FileAppend, , C:\RNApolymerasetest\ZACver2code.txt
	;FileAppend, , C:\RNApolymerasetest\ZACver2hkey.txt
}

FileRead, txtpath, C:\RNApolymerasetest\ZACver2path.txt
if (txtpath = "") {
	InputBox, txtappendpath, , Insert Zoom Path 
	FileAppend, %txtappendpath%, C:\RNApolymerasetest\ZACver2path.txt
	FileRead, txtpath, C:\RNApolymerasetest\ZACver2path.txt
}
zoompath = %txtpath% 

FileRead, txtcode, C:\RNApolymerasetest\ZACver2code.txt
if (txtcode = "") {
	InputBox, txtappendcode, , Insert Zoom Room Code (e.g. 526330425)
	FileAppend, %txtappendcode%, C:\RNApolymerasetest\ZACver2code.txt
	FileRead, txtcode, C:\RNApolymerasetest\ZACver2code.txt
}
zoomcode = %txtcode%
/*
FileRead, txthkey, C:\RNApolymerasetest\ZACver2hkey.txt
if (txthkey = "") {
	InputBox, txtappendhkey, , Insert a Key combination to launch the program
	FileAppend, %txtappendhkey%, C:\RNApolymerasetest\ZACver2hkey.txt
	FileRead, txthkey, C:\RNApolymerasetest\ZACver2hkey.txt
}
zoomhkey = %txthkey%
*/
^+z::
Run, %zoompath%
WinWaitActive, ahk_class ZPPTMainFrmWndClassEx
Sleep 1000
Loop 7
{
	Send {Tab down}
	Sleep 50
	Send {Tab up}
	Sleep 50
}
Send {Enter} 
WinWaitActive, ahk_class zWaitHostWndClass
Send, %zoomcode%{Enter}
return
