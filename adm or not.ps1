$admin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")

if ($admin) {
    Write-Host "Jsi administr�tor."
} else {
    Write-Host "Nejsi administr�tor."
}