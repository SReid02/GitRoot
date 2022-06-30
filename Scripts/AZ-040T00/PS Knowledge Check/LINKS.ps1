

$startd = get-date
$whengen = Get-EventLog -LogName System -Newest 4 | Select-Object 

$date = get-date
Get-EventLog -LogName System -Newest 4 | 
    Select-Object -Property EventID,@{n='Minutesss';e={($date = $_.TimeGenerated).Minute }}


    #https://github.com/BrentAIICT/MSSA-SCA/blob/main/PowerShellTraining/EarlyPowerShellQuiz.md#entry-level-powershell-quiz