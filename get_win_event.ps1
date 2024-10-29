<#
   .SYNOPSIS
   Gets System-Events at Levels Critical, Error and Warning

   .EXAMPLE
   C:\Users\adm_wohlfarthp\PSScripts> .\get_win_event.ps1 -Server jus018agrud -StartDateTime '2024-09-15 11:20:00'
   C:\Users\adm_wohlfarthp\PSScripts> .\get_win_event.ps1 -Server jus018agrud -StartDateTime 2024-09-15
#>


param (
    [Parameter(Mandatory)]
    [String]$Server,

    [Parameter(Mandatory)]
    [System.DateTime]$StartDateTime
)

$params = @{
    ComputerName = $Server
    ListProvider = 'Microsoft-Windows-Eventlog'
}

$levels = (Get-WinEvent @params).levels.Displayname[0..2]

Get-WinEvent -LogName System -ComputerName $Server |
    where {$_.LevelDisplayName -in $levels -and $_.TimeCreated -gt $StartDateTime} |
        select TimeCreated, Id, LevelDisplayName, Message #>> .\event.log


 #       [datetime]::now.ToString('s')
 
 # https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings
 # C:\windows\MEMORY.DMP
 # windbg.exe
 # https://learn.microsoft.com/de-de/windows-hardware/drivers/debuggercmds/windbg-overview
 # https://learn.microsoft.com/de-de/windows-hardware/drivers/debugger/
 # https://learn.microsoft.com/de-de/windows-hardware/drivers/debugger/bug-check-code-reference2

 # https://developer.microsoft.com/de-de/windows/downloads/windows-sdk/
 # https://learn.microsoft.com/de-de/troubleshoot/windows-client/performance/stop-error-or-blue-screen-error-troubleshooting
 # https://learn.microsoft.com/de-de/windows-hardware/drivers/debuggercmds/commands
 # https://learn.microsoft.com/de-de/windows-server/administration/windows-commands/chkdsk?tabs=event-viewer
