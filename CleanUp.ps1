<# PowerShell script for remote computer cleanup
Starts from RTS plugin -> batch file -> PS script
#>

$ComputerName = $args[0]
$UserID = $args[1]
$Path = "\\$ComputerName\c$"
$Path_Appdata_Local = "\\$ComputerName\c$\Users\$UserID\AppData\Local"
$Path_Appdata_Roaming = "\\$ComputerName\c$\Users\$UserID\AppData\Roaming"
$Daysback = "-45"
$CurrentDate = Get-Date
$DatetoDelete = $CurrentDate.AddDays($Daysback)

# Cleaning folders
$tempfolders = @(
"$Path\temp\*",
"$Path\MSOCache\All Users\*", 
"$Path\Windows\Temp\*", 
"$Path\Windows\*.dmp", 
"$Path\Windows\Logs\CBS\*.*", 
"$Path\Windows\SysWOW64\config\systemprofile\AppData\Local\CrashDumps\*.dmp",
"$Path\Windows\System32\config\systemprofile\AppData\Local\CrashDumps\*.*",
"$Path_Appdata_Local\Temp\*",
"$Path_Appdata_Local\CrashDumps\*.*",
"$Path_Appdata_Local\Microsoft\Windows\WebCache\*.*",
"$Path_Appdata_Local\Microsoft\Outlook\*.ost",
"$Path\ProgramData\Aetna\WSBackup\*",
"$Path\ProgramData\Package Cache\*"
# "$Path_Appdata_Local\Microsoft\OneNote\16.0\cache\tmp\*.*", Out of memory message. Done in bat
# "$Path_Appdata_Local\Microsoft\OneNote\16.0\cache\*", Out of memory message. Done in bat
)

$tempfolders.split(",") | foreach {Write-Host "Cleaning $_" -ForegroundColor Yellow}

# Write-Host Cleaning folders: $tempfolders -ForegroundColor Yellow

Remove-Item $tempfolders -Recurse -Force -ErrorAction SilentlyContinue 

# Delete temps from all profiles
Get-ChildItem -Path $Path\Users | foreach {
Get-ChildItem -Path "$($_.FullName)\AppData\Local\Temp" -ErrorAction Ignore | Remove-Item -Force -Recurse
 }
Get-ChildItem -Path $Path\Users | foreach {
Get-ChildItem -Path "$($_.FullName)\AppData\Local\CrashDumps" -ErrorAction Ignore | Remove-Item -Force -Recurse
 }
  Get-ChildItem -Path $Path\Users | foreach {
Get-ChildItem -Path "$($_.FullName)\Microsoft\Windows\WebCache" -ErrorAction Ignore | Remove-Item -Force -Recurse
 }
Get-ChildItem -Path $Path\Users | foreach {
Get-ChildItem -Path "$($_.FullName)\AppData\Local\Microsoft\Outlook\*.ost" -ErrorAction Ignore | Remove-Item -Force -Recurse
 }
 
Write-Host ""

Write-Host "Deleting files older than $Daysback days in $Path\zco\logs" -ForegroundColor Yellow
Get-ChildItem $Path\zco\logs -Recurse | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Force -Recurse 

Write-Host "Deleting files older than $Daysback days in $Path\zco\MSI_INSTALL_LOGS" -ForegroundColor Yellow
Get-ChildItem $Path\zco\MSI_INSTALL_LOGS -Recurse | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Force -Recurse

Write-Host "Deleting files and folders older than $Daysback days in $Path\Windows\ccmcache" -ForegroundColor Yellow
Get-ChildItem $Path\Windows\ccmcache -Recurse | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Force -Recurse

Write-Host "Deleting files and folders older than $Daysback days in $Path\ProgramData\Package Cache" -ForegroundColor Yellow
Get-ChildItem "$Path\ProgramData\Package Cache" -Recurse | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Force -Recurse

Write-Host "Empty Recycle bin" -ForegroundColor Cyan
Get-ChildItem $Path\`$recycle.bin -force | remove-item -recurse -force 
	
# Creating c:\zco\CleanUp.flg for RTS custom field to show the date of cleanup
New-Item -Path "$Path\zco" -Name "CleanUp.flg" -ItemType "file" -Value "c: drive cleanup flag" -Force