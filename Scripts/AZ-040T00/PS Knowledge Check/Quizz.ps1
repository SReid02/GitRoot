#1 Using pipelines
#Q1.1
Get-Service -Name * | Select-Object -Property Status,StartType,Name,DisplayName
#Q1.2
Get-CimClass -Namespace root\cimv2 | Where-Object {$_.CimClassName -like 'win32*BIOS*'}
Get-CimInstance -ClassName win32_bios |Get-member
Get-CimInstance -ClassName win32_bios | Select-Object -Property BIOSVersion,ReleaseDate
#Q1.3
get-command *event log*
get-help Get-EventLog -ShowWindow
get-eventlog -List
Get-EventLog -LogName System -Newest 4 | Get-Member
        #HAVE TO CREATE A HASH TABLE AS VAULE minuets does not exist
        $date = get-date
Get-EventLog -LogName System -Newest 4 | Select-Object -Property EventID,@{n='Minutesss';e={($date = $_.TimeGenerated).Minute }}

#2 Using Help
#Q2.2
get-help computername #Needs better understanding of getting get help(READ THE QNS SAM)
get-help get-process -ShowWindow
get-process |get-member
# ANS System.Diagnostics.Process, System.Diagnostics.FileVersionInfo, System.Diagnostics.ProcessModule
#Q2.2
 
#Q2.3

#Q2.4

#3 Discovering what is the output/result of running a cmdlet using Get-Member
#Q3.1
get-service |Get-Member
# ANS TypeName: System.ServiceProcess.ServiceController
#Q3.2
#ANS BELOW (Forgot Alias Properties)
Name                      AliasProperty Name = ServiceName                                                          
RequiredServices          AliasProperty RequiredServices = ServicesDependedOn                                       
CanPauseAndContinue       Property      bool CanPauseAndContinue {get;}                                             
CanShutdown               Property      bool CanShutdown {get;}                                                     
CanStop                   Property      bool CanStop {get;}                                                         
Container                 Property      System.ComponentModel.IContainer Container {get;}                           
DependentServices         Property      System.ServiceProcess.ServiceController[] DependentServices {get;}          
DisplayName               Property      string DisplayName {get;set;}                                               
MachineName               Property      string MachineName {get;set;}                                               
ServiceHandle             Property      System.Runtime.InteropServices.SafeHandle ServiceHandle {get;}              
ServiceName               Property      string ServiceName {get;set;}                                               
ServicesDependedOn        Property      System.ServiceProcess.ServiceController[] ServicesDependedOn {get;}         
ServiceType               Property      System.ServiceProcess.ServiceType ServiceType {get;}                        
Site                      Property      System.ComponentModel.ISite Site {get;set;}                                 
StartType                 Property      System.ServiceProcess.ServiceStartMode StartType {get;}                     
Status                    Property      System.ServiceProcess.ServiceControllerStatus Status {get;} 
#3.3 Methods
BeginErrorReadLine         Method         void BeginErrorReadLine()                                                 
BeginOutputReadLine        Method         void BeginOutputReadLine()                                                
CancelErrorRead            Method         void CancelErrorRead()                                                    
CancelOutputRead           Method         void CancelOutputRead()                                                   
Close                      Method         void Close()                                                              
CloseMainWindow            Method         bool CloseMainWindow()                                                    
CreateObjRef               Method         System.Runtime.Remoting.ObjRef CreateObjRef(type requestedType)           
Dispose                    Method         void Dispose(), void IDisposable.Dispose()                                
Equals                     Method         bool Equals(System.Object obj)                                            
GetHashCode                Method         int GetHashCode()                                                         
GetLifetimeService         Method         System.Object GetLifetimeService()                                        
GetType                    Method         type GetType()                                                            
InitializeLifetimeService  Method         System.Object InitializeLifetimeService()                                 
Kill                       Method         void Kill()                                                               
Refresh                    Method         void Refresh()                                                            
Start                      Method         bool Start()                                                              
ToString                   Method         string ToString()                                                         
WaitForExit                Method         bool WaitForExit(int milliseconds), void WaitForExit()                    
WaitForInputIdle           Method         bool WaitForInputIdle(int milliseconds), bool WaitForInputIdle()   
#Q3.4
Dispalyname string
canstop     bool
status      System.ServiceProcess.ServiceControllerStatus

#4 Discovering Modules
#Q4.1 
get-module
get-help get-module -ShowWindow
Get-Module -ListAvailable
#Q4.2
C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
#Q4.3
https://www.powershellgallery.com/packages?q=brentd09 search subnettools
Install-Module -Name SubnetTools
Get-Module -ListAvailable | Where-Object{$_.Name -like '*sub*'}


#Users Account Password Bulk reset
# Install Module if not on
Import-Module ActiveDirectory

#Get All Adusers

$Allusers = get-aduser -Filter * -Properties Name,DistinguishedName,Department,City | 
                Where-Object{$_.Department -like '*Sal*' -and $_.City -like '*Lon*'} 
                
                
 Foreach ($user in $AllUsers){
                $Password = -join ((33..126) | 
                Get-Random -Count 15|
                ForEach-Object { [char]$_})
                $NewPass = ConvertTo-SecureString $Password -AsPlainText -Force
                Set-ADAccountPassword $user -NewPassword $NewPass -Reset
                Set-aduser -Identity $user | #-ChangePasswordAtLogon $true
                Write-Host $user, $Password  
    }

    #below works 
Foreach ($user in $AllUsers){
                $Password = -join ((33..126) | 
                Get-Random -Count 15|
                ForEach-Object { [char]$_})
                $NewPass = ConvertTo-SecureString $Password -AsPlainText -Force
                Set-ADAccountPassword $user -NewPassword $NewPass -Reset
                Set-aduser -Identity $user 
                write-host $user, $Password
    }


