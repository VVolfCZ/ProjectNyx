$admin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")

if ($admin) {
    Write-Host "Jsi administrátor."
} else {
    Write-Host "Nejsi administrátor."
}