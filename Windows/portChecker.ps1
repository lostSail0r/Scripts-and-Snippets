#Simple powershell script to test network connections from VBR to Agent machine to confirm ports are open

#Note----If 6184 fails, check to ensure the port hasn't incremented/changed and confirm that port manually
#"If the default port number is already in use, Veeam Agent for Microsoft Windows Service will try to use the next port number."
#Manual check can be done by running Test-NetConnection -p portnumber -ComputerName machinename, e.g., Test-NetConnection -p 6185 -ComputerName VAW1

#Stores host name to check ports of
$Destination = Read-Host "Enter Agent Machine Name"

#Ports needed to connect to Agent machine from VBR
# https://helpcenter.veeam.com/docs/backup/agents/used_ports.html?ver=100
$Ports   =  "135",
            "137",
            "139",
            "445",
            "6160",
            "6184",
            "11731"
            
#loop to test each port
 foreach($P in $Ports){
                        $PortCheck = (Test-NetConnection -Port $p -ComputerName $Destination ).TcpTestSucceeded
                        If($PortCheck -notmatch "True"){write-host("Please check firewall or AV for port"+ " $P" )}
                                if($PortCheck -eq "6184" -notmatch "True"){write-host("Please confirm port" + " $P" +  " hasn't incremented up" )}
                        else {write-host("$P" + " succeeded")}
                    }
      