$Containers = "test_container_1", "test_container_2"

$Hour = Get-Date -Format HH
if ($Hour -gt 8 -or $Hour -lt 17) {
    $WorkingHours = $true
    }
    Else {
        $WorkingHours = $false
        }

$TimeStamp = Get-Date
$Containers | ForEach-Object {
    
    $ContainerStatus = docker container inspect $_ -f '{{.State.Status}}'
        
        if ($ContainerStatus -ne "running" -and $WorkingHours -eq $true) {

            $MessageSubject = $_ + " failed on " + $env:COMPUTERNAME
            $MessageBody = $_ + " failed on " + $env:COMPUTERNAME + " at " + $TimeStamp
                  
            Send-MailMessage -to "test@test.com" -From "test@test.com" -Subject $MessageSubject -Body $MessageBody
    } 

}
