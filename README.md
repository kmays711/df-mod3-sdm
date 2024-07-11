# PowerShell Secure Data Management

## Task 1 Secure Data Management

### View a log of all events and redirect them to a new file
Get-WinEvent -ListLog * > C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task1/logs.txt

### Get the last 20 System events and redirect to a new file
Get-WinEvent -LogName System -MaxEvents 20 > C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task1/system.txt

### Filter select text in the System file and redirect to a new file
Get-Content -Path "C:/Windows/System32/system.txt" | Select-String -Pattern "Attempted" > C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task1/FilteredSystem.txt

### Get System events with '111' in the line item and redirect to a CSV file
Get-WinEvent -LogName System | Where-Object {$_.Id -like '111'} | Export-Csv -Path "C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task1/111SystemLogs.csv"

## Task 2 Manage Permissions

### Grant read-only permissions to a txt file in PowerSell
### Send results to a new text file for documentation
### This is important so nobody else can edit the file contents
icacls C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task1/system.txt /grant "Everyone:(R)" > C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task2/logs.txt

## Task 3 PowerShell Scripting

### Create a PowerShell script that automates tasks
### Must run as Administrator
### I wrote the following script with the idea that it could be ran at the same time every day to automate tasks

##First we want to teach the computer to timestamp our logs
$timestamp = Get-Date -Format "yyyy-MM-dd"

##Running last 1000 maintenance logs and putting them in a file with timestamp
Get-WinEvent -LogName Microsoft-Windows-TaskScheduler/Maintenance -MaxEvents 1000 > C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task3/MaintLogs_$timestamp.txt

##Find line items with that have a "Warning" alert message and direct them to a new file with timestamp
Get-Content -Path "C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task3/Warning_$timestamp.txt" | Select-String -Pattern "Warning" > C:/Users/kimbe/documents/df-mod3-sdm/df-mod3-sdm/Task3/WarningMaintLogs_$timestamp.txt




