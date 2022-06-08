<# 
.NAME
    Home PC Maintence
#>

#Variables
Set-Variable -name "EmptyRB" Clear-RecycleBin

function-{

}

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

$CheckNetworkAdapter             = New-Object system.Windows.Forms.Button
$CheckNetworkAdapter.text        = "Check Network"
$CheckNetworkAdapter.width       = 100
$CheckNetworkAdapter.height      = 40
$CheckNetworkAdapter.location    = New-Object System.Drawing.Point(57,268)
$CheckNetworkAdapter.Font        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$HomePCTasks.controls.AddRange(@($RecycleBinClean,$CheckWinUpdates,$CheckDiskHealth,$CheckNetworkAdapter))

$RecycleBinClean.Add_Click({Clear-RecycleBin})
$CheckWinUpdates.Add_Click({  })
$CheckDiskHealth.Add_Click({  })
$CheckNetworkAdapter.Add_Click({  })

#region Logic 

#endregion

[void]$HomePCTasks.ShowDialog()