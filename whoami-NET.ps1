# Get the current Windows user's identity information using .NET classes
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()

# Display various properties of the current user
Write-Output "User Name: $($currentUser.Name)"
Write-Output "Authentication Type: $($currentUser.AuthenticationType)"
Write-Output "Is System: $($currentUser.IsSystem)"
Write-Output "Is Guest: $($currentUser.IsGuest)"
Write-Output "User SID: $($currentUser.User.Value)"
Write-Output "User SID (string): $($currentUser.User.Translate([System.Security.Principal.SecurityIdentifier]).Value)"
Write-Output "Groups:"

# Display the groups the user is a member of
foreach ($group in $currentUser.Groups) {
    $groupName = $group.Translate([System.Security.Principal.NTAccount]).Value
    Write-Output "  $groupName"
}
