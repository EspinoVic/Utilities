if((Test-Path monitorDocker.txt) -ne $True){
    New-Item -Path . -Name "monitorDocker.txt" -ItemType "file" #directory
}

while($True)
{
    Get-Date -Format "yyyy/MM/dd HH:mm" >> .\monitorDocker.txt
    docker stats --no-stream >> .\monitorDocker.txt
    #docker stats --no-stream > monitorDocker.txt
    #Add-Content -Path "monitorDocker.txt" -Value (docker stats )

}