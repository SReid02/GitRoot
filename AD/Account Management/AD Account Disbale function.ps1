#Script for disabling inactive accounts 90 days, then change password to new string
#Incomplete help
#can be saved as a moduel then loaded into powershell when required


function Disable-Inactiveuser {
    [cmdletbinding()]
    Param (
        [string]$Department,
        [int]$inactivedays
    )
    $AllDepartments = get-aduser -filter * -properties Department | 
        Select-Object -Property Department -Unique |
        Where-Object {$_.Department}
    if ($Department -notin $AllDepartments.Department) {
        Write-Warning "The Department $Department does not exist in Active Directory. You must use one of the following Departments $($AllDepartments.Department)"
        Break
  }
#have to user times -1. day to get into negatives.
    $CutoffDate = (get-date).AddDays($inactivedays * -1).Day
    $inactiveusers = get-aduser -filter * -properties LastLogonDay,Department | 
        Where-Object    {$_.Department -eq $Department -and $_.LastLogonDate -lt $CutoffDate}

    Write-Verbose "$($inactiveusers.name)"
    foreach ($user in $inactiveusers){
    #google ascii table to get the ranges. We then build a buch of arrays which we will add togeather in a random order to a new password
    $Lower = 97..122 | ForEach-Object {[char]$_} | Get-Random -Count 5
    $Upper = 65..90 | ForEach-Object {[char]$_} | Get-Random -Count 2
    $Number = 0..9 | ForEach-Object {[char]$_} | Get-Random -Count 1
    $Special = 33..38 | ForEach-Object {[char]$_} | Get-Random -Count 1
    $SecPassword = ($lower + $Upper + $Number + $Special | Sort-Object {Get-Random}) -join '' | ConvertTo-SecureString -AsPlainText -Force
    #need to force so you dont get asked questions
    Set-AzADUser -Identity $user -enable $false -PassThru |     #can use -whatif to test command without chaning anything
        Set-ADAccountPassword $user -NewPassword $SecPassword -Reset
}
}
get-aduser -filter {enabled -eq $false} | FT -Property name,Department