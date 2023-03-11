# Zjisti, zda je uživatel admin
$currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

# Pokud uživatel není admin, spusť kód pro běžného uživatele
if (-not $isAdmin) {
    Write-Output "Jsi běžný uživatel."
    # Sem napiš kód pro běžného uživatele
    Set-Content -Path "$home\Desktop\tuodpoved.txt" -Value "admin nejsi"
}
else {
    Write-Output "Jsi administrátor."
    # Pokud jsi admin, spusť skript znovu jako admin
    $args = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
    Start-Process powershell.exe -Verb RunAs -ArgumentList $args
    # Ukonči aktuální instanci skriptu
    Exit
    # Sem napiš kód pro administrátora
    Set-Content -Path "$home\Desktop\tuodpoved.txt" -Value "admin jsi"
}
