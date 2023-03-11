$admin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")

if ($admin) {
    Set-Content -Path "$home\Desktop\tuodpoved.txt" -Value "admin jsi"

} else {
    Set-Content -Path "$home\Desktop\tuodpoved.txt" -Value "admin nejsi"
}