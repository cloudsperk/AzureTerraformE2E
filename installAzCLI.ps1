$ProgressPreference = 'SilentlyContinue'; 
Invoke-WebRequest -Uri https://azcliprod.blob.core.windows.net/msi/azure-cli-2.75.0.msi -OutFile .\AzureCLI.msi; 
Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; 
rm .\AzureCLI.msi