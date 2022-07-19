$cred = Get-Credential


Get-ADUser -Filter * |
            Out-GridView -OutputMode Single -Title "Select the user to reset their password" |
            ForEach-Object {
                $cred = Get-Credential -UserName $_.name -Message "Please enter new password"
                Set-ADAccountPassword -NewPassword $cred.password -Reset -identity $_
            }
            