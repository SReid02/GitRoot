<# 
.NAME
    Home PC Maintence
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$HomePCTasks                     = New-Object system.Windows.Forms.Form
$HomePCTasks.ClientSize          = New-Object System.Drawing.Point(665,579)
$HomePCTasks.text                = "Form"
$HomePCTasks.TopMost             = $false

$RecycleBinClean                 = New-Object system.Windows.Forms.Button
$RecycleBinClean.text            = "button"
$RecycleBinClean.width           = 60
$RecycleBinClean.height          = 30
$RecycleBinClean.location        = New-Object System.Drawing.Point(58,121)
$RecycleBinClean.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckWinUpdates                 = New-Object system.Windows.Forms.Button
$CheckWinUpdates.text            = "button"
$CheckWinUpdates.width           = 60
$CheckWinUpdates.height          = 30
$CheckWinUpdates.location        = New-Object System.Drawing.Point(57,166)
$CheckWinUpdates.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckDiskHealth                 = New-Object system.Windows.Forms.Button
$CheckDiskHealth.text            = "button"
$CheckDiskHealth.width           = 60
$CheckDiskHealth.height          = 30
$CheckDiskHealth.location        = New-Object System.Drawing.Point(57,213)
$CheckDiskHealth.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckNetworkAdapter             = New-Object system.Windows.Forms.Button
$CheckNetworkAdapter.text        = "button"
$CheckNetworkAdapter.width       = 60
$CheckNetworkAdapter.height      = 30
$CheckNetworkAdapter.location    = New-Object System.Drawing.Point(57,268)
$CheckNetworkAdapter.Font        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$HomePCTasks.controls.AddRange(@($RecycleBinClean,$CheckWinUpdates,$CheckDiskHealth,$CheckNetworkAdapter))

$RecycleBinClean.Add_Click({  })
$CheckWinUpdates.Add_Click({  })
$CheckDiskHealth.Add_Click({  })
$CheckNetworkAdapter.Add_Click({  })

#region Logic 

#endregion

[void]$HomePCTasks.ShowDialog()