#Setting Variable

$num = '53'
$num = $num -21
$num.gettype()

#Instructor DEMO Methods and variables

$BunchofWords = 'The cat sat on the mat'
$BunchofWords | Get-Member
$BunchofWords.ToUpper()
$BunchofWords.ToLower()
$BunchofWords.Replace('cat','wife')
$BunchofWords.IndexOf('t')
$BunchofWords.Substring(4,3)

$cutthis = 'this is a string :326786: cut out the number'
$firstcol = $cutthis.IndexOf(':')
$lastcol = $cutthis.IndexOf(':',$firstcol+1)
$numleg = $lastcol-$firstcol-1
$numcut = $cutthis.Substring($firstcol+1,$numleg)
$numcut

#Lab: Using variables, arrays, and hash tables in PowerShell
#Class Demos

[System.Collections.ArrayList]$computers = "Lon-DC1","Lon-SRV1"
$computers=New-Object System.Collections.ArrayList
$computers.add("Lon-SRV2")
$computers.Remove("Lon-CL1")
$computers.RemoveAt(1)

#E1 Task1
$logpath = 'C:\logs\'
$logfile = 'log.txt'
$logpath = $logpath.TrimEnd('\') + '\' + $logfile
$logpath = $logpath.Replace('C:','D:')
$logpath

#E1 Task2

$today = Get-Date
#$today | Get-Member #Just to find the member properties and type
[String]$logfile = '' + $today.Year + '-' + 
                        $today.month + '-' + 
                        $today.Day + '-' + 
                        $today.Hour + '-' + 
                        $today.Minute + '.txt'

#$today | Get-Member
$cutoffday = $today.AddDays(-30)

get-aduser -Filter * -Properties LastlogonDate |
        Where-Object {$_.lastlogondate -gt $cutoffday}
    