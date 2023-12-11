function Get-DomainName {
# Load the necessary assembly
Add-Type -AssemblyName System.Net.NetworkInformation

# Get the domain name
$domainName = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties().DomainName

# Output the domain name
Write-Output "Domain Name: $domainName"

}