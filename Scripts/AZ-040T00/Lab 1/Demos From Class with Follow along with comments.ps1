get-command *update*
Get-Service | Get-Member

get-volume |Get-Member
Get-Volume |
 Select-Object -Property DriveLetter,
                         DriveType,
                         HealthStatus,
                         Size,
                         SizeRemaining,                         
                         @{ n='Size GB' ;e={[math]::Round($_.Size / 1GB,0)}},
                         @{ n='SizeUsed';e={($_.Size - $_.SizeRemaing) /1GB,0}}

'131.1.1.2' -match '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$' #Regular expressions
'131.1.1.2' -match '^(\d{1,3}\.){3}\d{1,3}$' #When values duplicate bracket first value then '^(value){3}$' if value repeats 3 times.

Get-Service |Where-Object {$_.Status -eq 'Running'} #use where Object is matching something to test is something is true or not

get-aduser -Filter * -Properties Department | Where-Object {$_.department -eq 'sales'} |Select-Object name,department

get-aduser -Filter * -Properties Department | 
Where-Object {$_.department -eq 'sales' -or $_.GivenName -like 'a*'} |
Select-Object name,department  #this uses Or and requires only sale or a name starting with (a). If we use and it needs both Sales and start with A.

1..10 | ForEach-Object {Write-Host -ForegroundColor Yellow $_.}

get-aduser -Filter * | 
Select-Object -Property givenname,surname |
Where-Object {$_.Surname}|
ForEach-Object {$_.givenname + '.' + $_.Surname} #get off teacher after 

get-aduser -Filter * | 
Select-Object -Property givenname,surname |
Where-Object {$_.Surname}|
ConvertTo-Csv -NoTypeInformation | 
Out-File -FilePath E:\user.csv  #ask why it converts to numbers (answer was to remove the for each as it was only piping in the string).

get-aduser -Filter * | 
Select-Object -Property givenname,surname |
Where-Object {$_.Surname}|
ConvertTo-Json  | 
Out-File -FilePath E:\UserList.json #for Java

Get-Service |
    Select-Object -Property Name,StartType,Status |
    ConvertTo-Html | 
    Out-file E:\ServicesList.Html  #creates in HTML format. Can make formats better if you understand CSS

#CSS

$CSS = 

Get-Service |
    Select-Object -Property Name,StartType,Status |
    ConvertTo-Html -Head $CSS | 
    Out-file E:\ServicesList.Html  #work on later to get CSS working in seperated tables.

    Get-Service | Out-GridView -OutputMode Single | Stop-Service #Displays a different window and allows you to click a single service to stop.