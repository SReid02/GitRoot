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


#Exercise 2 Using Arrays

get-aduser -Filter * | Get-Member
# Command below required us to add the properties before the where object bcuase by default AD does not give all

get-aduser -Filter * -Properties Department | Where-Object {$_.Department -eq 'Marketing'} 

$MarketingUser = get-aduser -Filter * -Properties Department | Where-Object {$_.Department -eq 'Marketing'}

$MarketingUser.Count  
$MarketingUser[0]
get-help array -ShowWindow

$MarketingUser | set-aduser -Department 'Business Development'
$MarketingUser = get-aduser -Filter * -Properties Department | Where-Object {$_.Department -eq 'Business Development'}
$MarketingUser
$MarketingUser.Count 

#Task 2: Use an array list
#Type accellartor array lists live in a hirecharical structure because its a .NET Object.
#.NET Framework are pre templated methods properties for WIN OS

[System.Collections.ArrayList]$computers = 'LON-SRV1','LON-SRV2','LON-DC1'

$computers | Get-Member
$computers.GetType()
#Remember below command
get-member -InputObject $computers

$computers.IsFixedSize
$computers.Count
$computers.add('LON-DC2')
$computers.RemoveAt(1)
$computers.insert(1,'LON-SRV2') #USE Insert instead of ADD if you want a specific index position.
$computers.IndexOf('LON-SRV2')
$computers

#A hash table is an idictonary that has no look up order. An idictonary is an look up list for powershell and they are in order.
#Reference Key Value pairs. Contains a mapping of many keys and their associated values.
$mailList = @{
        frank = 'frank@fabrikam.com'
        Libby = 'lhayward@contoso.com'
        Matej = 'mstojanova@tailspintoys.com'
}

$mailList #Confirming list built.
$mailList.Libby 
$mailList.Libby = 'libbyhayward@contoso.com'
$mailList.Add('Stella','stela.sahiti@treyresearch.net')
$mailList.Stella
$mailList.Remove('Frank') #only need to remove the Key
$mailList