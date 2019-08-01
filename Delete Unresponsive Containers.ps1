Get-Process "dockerd" | Stop-Process
Get-ChildItem "C:\ProgramData\Docker\containers" | Remove-Item -Recurse
Restart-Service "docker"
