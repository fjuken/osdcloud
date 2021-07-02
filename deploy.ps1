Write-Host -Fore Green "//Starting OSDCloud ZTI"


#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -like "*Virtual*") {
Write-Host -Fore Green "//Setting Display Resolution to 1600x"
    Set-DisRes 1920
}

#Make sure I have the latest OSD Content
Write-Host -Fore Green "//Updating OSD PowerShell Module"
Install-Module OSD -Force


Write-Host -Fore Green "//Importing OSD PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI the RIGHT way
Write-Host -Fore Green "//Starting OSDCloud"
Start-OSDCloud -OSLanguage nb-no -OSBuild "21H1" -OSEdition Enterprise -ZTI -SkipAutoPilot

#Restart from WinPE
Write-Host -Fore Green "//Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
