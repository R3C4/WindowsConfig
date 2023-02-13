# DNS/DDNS
#dns.ps1;

$ControlDProfile  = Read-Host -Prompt 'Enter your ControlD Profile';
$ControlDClientUrl = "https://assets.controld.com/utility/controld.exe";
$CDCName = $ControlDProfile + ".exe";
$CDTemplate = "https://dns.controld.com/" + $ControlDProfile + "/";

$NIUrl = "https://www.noip.com/client/DUCSetup_v4_1_1.exe";
$NIName = "noip.exe";
$NetworkName = Read-Host -Prompt 'Enter your Network Name';



# Download DDNS no-ip
Invoke-WebRequest -Uri $NIUrl -OutFile $NIName;
Start-Process -Filepath $NIName -ArgumentList "/S" -Wait 


# Setup DDNS no-ip


# Set DNS to ControlD via Powershell
netsh dns add encryption server=76.76.2.141 dohtemplate=$CDTemplate ;
netsh interface ipv4 set dns name=$NetworkName static 76.76.2.141;

# Download ControlD
Invoke-WebRequest -Uri $ControlDClientUrl -OutFile $CDCName;
Start-Process -Filepath $CDCName -ArgumentList "/S" -Wait 

# set Task Scheduler to run every startup

# $Trigger= New-ScheduledTaskTrigger -AtStartup # Specify the trigger settings
# $User= "NT AUTHORITY\SYSTEM" # Specify the account to run the script
# $Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\PS\StartupScript.ps1" # Specify what program to run and with its parameters
# Register-ScheduledTask -TaskName "MonitorGroupMembership" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force # Specify the name of the task
