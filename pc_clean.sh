Write-Host "Cleaning Windows..." -ForegroundColor Green

Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

Clear-RecycleBin -Force -ErrorAction SilentlyContinue

Stop-Service wuauserv -ErrorAction SilentlyContinue
Stop-Service bits -ErrorAction SilentlyContinue

Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue

Start-Service wuauserv -ErrorAction SilentlyContinue
Start-Service bits -ErrorAction SilentlyContinue

Remove-Item "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Windows\Minidump\*" -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Windows\MEMORY.DMP" -Force -ErrorAction SilentlyContinue

DISM /Online /Cleanup-Image /StartComponentCleanup

Write-Host "Done! Restart your PC for the best results." -ForegroundColor Green
