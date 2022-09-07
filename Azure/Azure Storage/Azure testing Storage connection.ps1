#tests storage connection over port 445 and then maps the drive permently. Note the variables will change. The computer name is the storage account.
$connectTestResult = Test-NetConnection -ComputerName sollos.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"sollos.file.core.windows.net`" /user:`"localhost\sollos`" /pass:`"GE2dzblmXUnoea1huh7Lmd8lO6joHxPTP/PoxArUT36jh1jvRWRfcA/OvtIHWJjT61Ul1qWv3jz++AStWFwxBw==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\sollos.file.core.windows.net\az104-07-share" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}
