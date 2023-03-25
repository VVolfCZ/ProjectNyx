Remove-Item "$env:APPDATA\Opera Software\Opera Stable" -Recurse -Force
Remove-Item "$env:APPDATA\Mozilla\Firefox\Profiles" -Recurse -Force
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data" -Recurse -Force
Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data" -Recurse -Force
