@echo off
set vbs=%temp%\shutdown_prompt.vbs

echo Set objShell = CreateObject("WScript.Shell") > %vbs%
echo result = MsgBox("Are you sure you want to shut down your computer?", 4 + 32, "Shutdown") >> %vbs%
echo If result = 6 Then >> %vbs%
echo objShell.Run "shutdown /s /t 0", 0 >> %vbs%
echo End If >> %vbs%

cscript //nologo %vbs%
del %vbs%
