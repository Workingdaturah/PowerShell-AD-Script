# Get network interfaces information using .NET classes
$networkInterfaces = [System.Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces()

# Display information for each network interface
foreach ($interface in $networkInterfaces) {
    Write-Output "Interface Name: $($interface.Name)"
    Write-Output "Description: $($interface.Description)"
    Write-Output "Type: $($interface.NetworkInterfaceType)"
    Write-Output "Status: $($interface.OperationalStatus)"
    Write-Output "MAC Address: $($interface.GetPhysicalAddress().ToString())"
    Write-Output "IP Addresses: $($interface.GetIPProperties().UnicastAddresses.Address -join ', ')"
    Write-Output "Subnet Mask: $($interface.GetIPProperties().UnicastAddresses.IPv4Mask -join ', ')"
    Write-Output "Gateway Addresses: $($interface.GetIPProperties().GatewayAddresses.Address -join ', ')"
    Write-Output "DNS Addresses: $($interface.GetIPProperties().DnsAddresses.IPAddressToString -join ', ')"
    Write-Output "------------------"
}
