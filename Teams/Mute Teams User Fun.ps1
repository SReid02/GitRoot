Install-Module -Name PowerShellGet -Force -AllowClobber

Install-Module -Name MicrosoftTeams -Force -AllowClobber
#connects powershell to teams
Connect-MicrosoftTeams

#This gets all team members in the below group ID. Look for the user you want to mute 
get-teamuser -GroupId c465995f-b0b6-4eb6-bc7d-f80941f5f0ad

Get-Team -GroupId c465995f-b0b6-4eb6-bc7d-f80941f5f0ad -User 'S102995@student.aiict.edu.au'
#gets the team member and changes display name to red
Get-Team -GroupId c465995f-b0b6-4eb6-bc7d-f80941f5f0ad -User 'S102994@student.aiict.edu.au' -DisplayName 'Red'

#disconnects your PS session from teams
Disconnect-MicrosoftTeams