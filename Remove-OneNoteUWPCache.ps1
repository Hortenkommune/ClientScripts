$Username = Get-WMIObject -class Win32_ComputerSystem | Select-Object -ExpandProperty Username
$Username = $Username.Replace("SKOLE\", "")
$OneNoteCache = "C:\Users\$Username\AppData\Local\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\"
$OneNoteSettingsCache = "C:\Users\$Username\AppData\Local\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\Settings\settings.dat"

Remove-Item -Path $OneNoteCache -Recurse -Force 
Remove-Item -Path $OneNoteSettingsCache -Force 