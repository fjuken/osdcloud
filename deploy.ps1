function LineMsg ($msg)
{
    "*" * 50
    Write-Host -ForegroundColor Green $msg
    "*" * 50
}

LineMsg "Starting OSDCloud ZTI"


#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -like "*Virtual*") {
    LineMsg "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}

#Make sure I have the latest OSD Content
LineMsg "Updating OSD PowerShell Module"
Install-Module OSD -Force


LineMsg "Importing OSD PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI the RIGHT way
LineMsg "Starting OSDCloud"
Start-OSDCloud -OSLanguage nb-no -OSBuild "21H2" -OSEdition Enterprise -ZTI -SkipAutoPilot

#Restart from WinPE
LineMsg "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
