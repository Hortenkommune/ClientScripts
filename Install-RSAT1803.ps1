# Download and install RSAT
$DLPath = 'https://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-RSAT_WS_1803-x64.msu'
$DLFile = 'C:\windows\temp\Rsat.msu'
$WusaArg = $DLFile + " /quiet"
Write-Host "Downloading RSAT for 1803"
Invoke-WebRequest -Uri $DLPath -OutFile $DLFile
Write-Host "Installing RSAT for 1803"
Start-Process -FilePath "C:\Windows\System32\wusa.exe" -ArgumentList $WusaArg -Wait

# Clean up
Write-Host "Doing som cleanup.."
Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\" -Recurse -Force
Remove-Item -Path $DLFile

# Create shortcut
Write-Host "Creating Shortcut"
$TargetFile = "$env:SystemRoot\System32\mmc.exe"
$ShortcutFile = "$env:Public\Desktop\Active Directory.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = "dsa.msc /DOMAIN= /SERVER="
$Shortcut.Save()
Write-Host "Done"