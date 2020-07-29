Const ForReading = 1, ForWriting = 2, ForAppending = 8, ReadOnly = 1
Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell=CreateObject("WScript.Shell")
WinDir =WshShell.ExpandEnvironmentStrings("%WinDir%")

HostsFile = WinDir & "\System32\Drivers\etc\Hosts"

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(HostsFile, ForReading)

Do Until objFile.AtEndOfStream
If InStr (objFile.ReadLine, "10.10.10.105") <> 0 Then
WScript.Quit
End If
i = i + 1
Loop
objFile.Close

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(HostsFile)
If objFile.Attributes AND ReadOnly Then
objFile.Attributes = objFile.Attributes XOR ReadOnly
End If

Set filetxt = fso.OpenTextFile(HostsFile, ForAppending, True)
filetxt.WriteLine(vbNewLine & "10.10.10.105 intranet.corp www.intranet.corp intranet www.intranet")
filetxt.Close
WScript.quit