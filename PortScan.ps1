# Simple Port Scanner when nmap isn't available
function Test-Port {
    param (
        [string]$Target,
        [int]$port
    )

    $tcpclient = New-Object System.Net.Sockets.TcpClient
    $result = $tcpclient.BeginConnect($Target, $port, $null, $null)
    $result.AsyncWaitHandle.WaitOne(1000, $false)

    if ($tcpclient.Connected) {
        $tcpclient.EndConnect($result)
        $tcpclient.Close()
        # return $true
    } else {
        $tcpclient.Close()
        # return $false
    }
}

function Port-Scan {
    param (
        [string]$Target,
        [int]$StartPort,
        [int]$EndPort
    )

    for ($port = $startPort; $port -le $endPort; $port++) {
        if (Test-Port -Target $Target -Port $port) {
            Write-Output "Port $port is open."
        } else {
            Write-Output "Port $port is closed."
        }
    }
}

# Example: Scan ports 80 to 85 on localhost
# Port-Scan -Target 'localhost' -StartPort 80 -EndPort 85
