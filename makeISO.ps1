#Create template with WinRE for WIFI support
New-OSDCloud.template -SetInputLocale nb-no -Verbose -WinRE

#Move the template to the workspace path
New-OSDCloud.workspace -WorkspacePath c:\osd

#Add drivers and ps1 script
Edit-OSDCloud.winpe -CloudDriver Dell,WiFi -WorkspacePath c:\osd -WebPSScript https://raw.githubusercontent.com/erlendwtf/osdcloud/main/deploy.ps1

#Create ISO
New-OSDCloud.iso -WorkspacePath c:\osd

#Create USB
New-OSDCloud.usb -WorkspacePath c:\osd
#1, y

#Done!
