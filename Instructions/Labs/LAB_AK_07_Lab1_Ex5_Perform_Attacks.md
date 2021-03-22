# Module 7 - Lab 1 - Exercise 5 - Conduct attacks

### Task 1: Attack Windows configured with Defender for Endpoint.

In this task, you will perform attacks on a host with Microsoft Defender for Endpoint configured.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the search of the task bar, enter *Command*.  Command Prompt will be displayed in the search results.  Right-click on the Command Prompt and select **Run as Administrator**. Confirm any User Account Control prompts that appear.

3. In the command prompt, enter the command in each row pressing Enter key after each row:
```
cd \
mkdir temp
cd temp
```
4. Attack 1 - Copy and run this command:

```
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "SOC Test" /t REG_SZ /F /D "C:\temp\startup.bat"
```

5. Attack 3 - Copy and run this command:

```
notepad c2.ps1
```
Select **Yes** to create a new file and copy the following PowerShell script into c2.ps1 and select **save**.

**Note** Paste into the Virtual Machine might have a limited length.  Paste this in three sections to ensure all the script is pasted into the Virtual Machine.  Make sure the script looks as it does in these instructions within the notepad c2.ps1 file.

```


param(
    [string]$Domain = "microsoft.com",
    [string]$Subdomain = "subdomain",
    [string]$Sub2domain = "sub2domain",
    [string]$Sub3domain = "sub3domain",
    [string]$QueryType = "TXT",
        [int]$C2Interval = 8,
        [int]$C2Jitter = 20,
        [int]$RunTime = 240
)


$RunStart = Get-Date
$RunEnd = $RunStart.addminutes($RunTime)

$x2 = 1
$x3 = 1 
Do {
    $TimeNow = Get-Date
    Resolve-DnsName -type $QueryType $Subdomain".$(Get-Random -Minimum 1 -Maximum 999999)."$Domain -QuickTimeout

    if ($x2 -eq 3 )
    {
        Resolve-DnsName -type $QueryType $Sub2domain".$(Get-Random -Minimum 1 -Maximum 999999)."$Domain -QuickTimeout
        
        $x2 = 1

    }
    else
    {
        $x2 = $x2 + 1
    }
    
    if ($x3 -eq 7 )
    {

        Resolve-DnsName -type $QueryType $Sub3domain".$(Get-Random -Minimum 1 -Maximum 999999)."$Domain -QuickTimeout

        $x3 = 1
        
    }
    else
    {
        $x3 = $x3 + 1
    }


    $Jitter = ((Get-Random -Minimum -$C2Jitter -Maximum $C2Jitter) / 100 + 1) +$C2Interval
    Start-Sleep -Seconds $Jitter
}
Until ($TimeNow -ge $RunEnd)

```

At the command prompt, enter the following, enter the command in each row pressing Enter key after each row:
```
powershell
.\c2.ps1
```
**Note:** You will see resolve errors. This is to be expected.
Let this command/powershell script run in the background. Don't close the window.  The command needs to generate log entries for some hours.  You can proceed to the next task and next exercises while this script runs.  The data created by this task will be used in the Threat Hunting lab later.  This process will not create substantial amounts of data or processing.

### Task 2: Attack Windows configured with Sysmon

In this task, you will perform attacks on a host with the Security Events connector configured and Sysmon configured.

1. Login to WIN2 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the search of the task bar, enter *CMD*.  Command Prompt will be displayed in the search results.  Right-click on the Command Prompt and select **Run as Administrator**.

3. In the command prompt, enter the command in each row pressing Enter key after each row:
```
cd \
mkdir temp
cd \temp
```

4. Attack 1 - Copy and run this command:

```
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "SOC Test" /t REG_SZ /F /D "C:\temp\startup.bat"
```

5. Attack 2 - Copy and run this command, enter the command in each row pressing Enter key after each row:

```
net user theusernametoadd /add
net user theusernametoadd ThePassword1!
net localgroup administrators theusernametoadd /add
```

## Proceed to Exercise 6
