Dim MISTERIP
MISTERIP = "192.168.1.100:8182"

' Note: will likely be fat (for SD) or usb0 (for external/usb drive):
Dim MISTERDRIVE
MISTERDRIVE = "fat"

Set shell = CreateObject("WScript.Shell")
Set args = WScript.Arguments

' Set environment variables for passed-in batch file.
shell.Environment("Process").Item("MISTERIP") = MISTERIP
shell.Environment("Process").Item("MISTERDRIVE") = MISTERDRIVE

' launches the OSD Menu to trigger the Autosave before launching another title.
shell.Run "curl --request POST --url ""http://" & MISTERIP & "/api/controls/keyboard/osd"""

' Uncomment the ' in the next line to open the mister remote control website/app when launching.
' shell.Run "http://" & MISTERIP & "/control"

' increase or decrease time (ms) for Autosave to complete.
WScript.Sleep 5000

' for calling/launching the passed-in batch for a title.
If args.Count > 0 Then
 ' Escape special characters for the entire file path
    filePath = """" & args(0) & """"
 ' Run the batch file with cmd /c to close when done
    shell.Run "cmd /c """ & filePath & """", 0, False
End If
