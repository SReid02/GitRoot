#Once Recycle bin is enabled it can no longer be disabled 
Invoke-Command -ComputerName '<Target the adserver>' -ScriptBlock {
    $RecycleBin = Get-ADOptionalFeature 'Recycle Bin Feature'
    if ($RecycleBin.EnabledScopes.Count -eq 0) {
      Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target '<Traget the AD Domain>' -confirm:$false
    }
  }  