<# 
.NAME
    Home PC Maintence

    Key Goals 
                Create a 1 click stop for basic home PC admin
                Create recycle bin clean up with email reports
                Create update checking with email report
                Create fire wall status check with email report
                Create diskhealth report with email report
#>

#Variables
#will add later to modualise Form

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$HomePCTasks                     = New-Object system.Windows.Forms.Form
$HomePCTasks.ClientSize          = New-Object System.Drawing.Point(665,579)
$HomePCTasks.text                = "Home PC General Maintance"
$HomePCTasks.TopMost             = $false

$RecycleBinClean                 = New-Object system.Windows.Forms.Button
$RecycleBinClean.text            = "Recycle Bin Clean Up"
$RecycleBinClean.width           = 100
$RecycleBinClean.height          = 40
$RecycleBinClean.location        = New-Object System.Drawing.Point(58,121)
$RecycleBinClean.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckWinUpdates                 = New-Object system.Windows.Forms.Button
$CheckWinUpdates.text            = "Check for WIN Updates"
$CheckWinUpdates.width           = 100
$CheckWinUpdates.height          = 40
$CheckWinUpdates.location        = New-Object System.Drawing.Point(57,166)
$CheckWinUpdates.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckDiskHealth                 = New-Object system.Windows.Forms.Button
$CheckDiskHealth.text            = "Check Disk Health"
$CheckDiskHealth.width           = 100
$CheckDiskHealth.height          = 40
$CheckDiskHealth.location        = New-Object System.Drawing.Point(57,213)
$CheckDiskHealth.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckWinFire                    = New-Object system.Windows.Forms.Button
$CheckWinFire.text               = "Check Windows Firewall"
$CheckWinFire.width              = 100
$CheckWinFire.height             = 40
$CheckWinFire.location           = New-Object System.Drawing.Point(57,268)
$CheckWinFire.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$HomePCTasks.controls.AddRange(@($RecycleBinClean,$CheckWinUpdates,$CheckDiskHealth,$CheckWinFire))

$RecycleBinClean.Add_Click({Clear-RecycleBin})
$CheckWinUpdates.Add_Click({  })
$CheckDiskHealth.Add_Click({Get-physicaldisk |Select-Object healthstatus })
$CheckWinFire.Add_Click({  })

#region Logic 

#endregion

[void]$HomePCTasks.ShowDialog()




# Finding Commands 
#Get-PhysicalDisk |Get-Member
#Get-PhysicalDisk |Select-Object HealthStatus
#(Get-physicaldisk |Select-Object healthstatus)

#learnt from Class
#Get-Volume |
 #Select-Object -Property DriveLetter,DriveType,HealthStatus,Size,SizeRemaining,@{n='SizeUsed';e={$_.Size - $_.SizeRemaing}} #This is a cacluated property
 #n= name of new property name #e= expression of new property / caculated value of new property
 # $_.  Selects then object passed through the previous pipeline but is only selecting the values of only Size and SizeRemaining 
 # For building own properties @{n='';e={$_.Property from Obj  + $._.Property from Obj  }}