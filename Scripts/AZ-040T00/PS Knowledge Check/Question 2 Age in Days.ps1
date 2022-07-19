#Q2.1 Create a function that calculates your age in days

function get-AgeInDays {
    [cmdletbinding()]
    Param (
        [datetime]$birthdate = '06-DEC-1991'
    )
       $currentday = Get-Date
       Write-Verbose $bithdate
       $age = $currentday - $birthdate
       return $age.days
}

get-AgeInDays '06-DEC-1991'

