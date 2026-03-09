New-Item -Path "HKCR\Directory\Background\shell\VSCode" -Force
Set-ItemProperty -Path "HKCR\Directory\Background\shell\VSCode" -Name "(Default)" -Value "Open in VS Code"

New-Item -Path "HKCR\Directory\Background\shell\VSCode\command" -Force
Set-ItemProperty -Path "HKCR\Directory\Background\shell\VSCode\command" -Name "(Default)" -Value '"C:\Program Files\Microsoft VS Code\Code.exe" "%V"'

New-Item -Path "HKCR\Directory\shell\VSCode" -Force
Set-ItemProperty -Path "HKCR\Directory\shell\VSCode" -Name "(Default)" -Value "Open in VS Code"

New-Item -Path "HKCR\Directory\shell\VSCode\command" -Force
Set-ItemProperty -Path "HKCR\Directory\shell\VSCode\command" -Name "(Default)" -Value '"C:\Program Files\Microsoft VS Code\Code.exe" "%1"'
