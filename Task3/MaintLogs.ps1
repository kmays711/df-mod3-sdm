#PowerShell Scripting

#This script could be ran at the same time every day to log and document specific events 

##First we want to teach the computer to timestamp our logs
$timestamp = Get-Date -Format "yyyy-MM-dd"

##Running last 1000 maintenance logs and putting them in a file with timestamp
Get-WinEvent -LogName Microsoft-Windows-TaskScheduler/Maintenance -MaxEvents 1000 > C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task3/MaintLogs_$timestamp.txt

##Find line items with that have a "Warning" alert message and direct them to a new file with timestamp
Get-Content -Path "C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task3/MaintLogs_$timestamp.txt" | Select-String -Pattern "Warning" > C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task3/WarningMaintLogs_$timestamp.txt

