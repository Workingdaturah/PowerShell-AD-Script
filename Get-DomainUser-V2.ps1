function Get-DomainUsers {
    param (
        [string]$Domain,
        [string]$Username
    )

    # Load the necessary assembly
    Add-Type -AssemblyName System.DirectoryServices.AccountManagement

    # Validate the $Domain parameter
    if (-not $Domain) {
        Write-Output "Please provide a valid domain name."
        return
    }

    # If $Username is not provided, retrieve all users in the specified domain
    if (-not $Username) {
        # Specify the domain context
        $domainContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext('Domain', $Domain)

        # Create a UserPrincipal object
        $userPrincipal = New-Object System.DirectoryServices.AccountManagement.UserPrincipal($domainContext)

        # Create a PrincipalSearcher object
        $principalSearcher = New-Object System.DirectoryServices.AccountManagement.PrincipalSearcher($userPrincipal)

        # Perform the search
        $domainUsers = $principalSearcher.FindAll()

        # Output detailed user information
        foreach ($user in $domainUsers) {
    Write-Output "User Information for $($user.SamAccountName):"
    
    if ($user.DisplayName) {
        Write-Output "  Display Name: $($user.DisplayName)"
    }
    
    if ($user.EmailAddress) {
        Write-Output "  Email: $($user.EmailAddress)"
    }
    
    if ($user.Description) {
        Write-Output "  Description: $($user.Description)"
    }
    
    if ($user.Enabled) {
        Write-Output "  Enabled: $($user.Enabled)"
    }
    
    if ($user.LastLogon) {
        Write-Output "  Last Logon: $($user.LastLogon)"
    }
    
    if ($user.UserPrincipalName) {
        Write-Output "  User Principal Name: $($user.UserPrincipalName)"
    }
    
    if ($user.Sid) {
        Write-Output "  SID: $($user.Sid)"
    }
    
    if ($user.DistinguishedName) {
        Write-Output "  Distinguished Name: $($user.DistinguishedName)"
    }
    
    if ($user.HomeDirectory) {
        Write-Output "  Home Directory: $($user.HomeDirectory)"
    }
    
    if ($user.ScriptPath) {
        Write-Output "  Script Path: $($user.ScriptPath)"
    }
    
    if ($user.AccountExpirationDate) {
        Write-Output "  Account Expiration Date: $($user.AccountExpirationDate)"
    }

    if ($user.LastPasswordSet) {
        Write-Output "  Last Password Set: $($user.LastPasswordSet)"
    }

    if ($user.PasswordNeverExpires) {
        Write-Output "  Password Never Expires: $($user.PasswordNeverExpires)"
    }

    if ($user.PasswordLastSet) {
        Write-Output "  Password Last Set: $($user.PasswordLastSet)"
    }

    if ($user.PasswordExpires) {
        Write-Output "  Password Expires: $($user.PasswordExpires)"
    }

    if ($user.PasswordChangeable) {
        Write-Output "  Password Changeable: $($user.PasswordChangeable)"
    }

    if ($user.PasswordRequired) {
        Write-Output "  Password Required: $($user.PasswordRequired)"
    }

    if ($user.SmartcardRequired) {
        Write-Output "  Smartcard Required: $($user.SmartcardRequired)"
    }

    if ($user.TrustedForDelegation) {
        Write-Output "  Trusted For Delegation: $($user.TrustedForDelegation)"
    }

    if ($user.VoiceTelephoneNumber) {
        Write-Output "  Voice Telephone Number: $($user.VoiceTelephoneNumber)"
    }

    if ($user.GivenName) {
        Write-Output "  Given Name: $($user.GivenName)"
    }

    if ($user.Surname) {
        Write-Output "  Surname: $($user.Surname)"
    }

    if ($user.MiddleName) {
        Write-Output "  Middle Name: $($user.MiddleName)"
    }

    if ($user.Initials) {
        Write-Output "  Initials: $($user.Initials)"
    }

    if ($user.Title) {
        Write-Output "  Title: $($user.Title)"
    }

    if ($user.Department) {
        Write-Output "  Department: $($user.Department)"
    }

    if ($user.Company) {
        Write-Output "  Company: $($user.Company)"
    }

    if ($user.Manager) {
        Write-Output "  Manager: $($user.Manager)"
    }

    if ($user.EmployeeId) {
        Write-Output "  Employee ID: $($user.EmployeeId)"
    }

    if ($user.EmployeeType) {
        Write-Output "  Employee Type: $($user.EmployeeType)"
    }

    if ($user.HomePhone) {
        Write-Output "  Home Phone: $($user.HomePhone)"
    }

    if ($user.MobilePhone) {
        Write-Output "  Mobile Phone: $($user.MobilePhone)"
    }

    if ($user.Pager) {
        Write-Output "  Pager: $($user.Pager)"
    }

    if ($user.Fax) {
        Write-Output "  Fax: $($user.Fax)"
    }

    if ($user.StreetAddress) {
        Write-Output "  Street Address: $($user.StreetAddress)"
    }

    if ($user.City) {
        Write-Output "  City: $($user.City)"
    }

    if ($user.State) {
        Write-Output "  State: $($user.State)"
    }

    if ($user.PostalCode) {
        Write-Output "  Postal Code: $($user.PostalCode)"
    }

    if ($user.Country) {
        Write-Output "  Country: $($user.Country)"
    }

    if ($user.AccountLockoutTime) {
        Write-Output "  Account Lockout Time: $($user.AccountLockoutTime)"
    }

    if ($user.BadLogonCount) {
        Write-Output "  Bad Logon Count: $($user.BadLogonCount)"
    }

    if ($user.LogonCount) {
        Write-Output "  Logon Count: $($user.LogonCount)"
    }

    if ($user.PermittedWorkstations) {
        Write-Output "  Permitted Workstations: $($user.PermittedWorkstations)"
    }

    if ($user.PermittedLogonTimes) {
        Write-Output "  Permitted Logon Times: $($user.PermittedLogonTimes)"
    }

    if ($user.UserCannotChangePassword) {
        Write-Output "  User Cannot Change Password: $($user.UserCannotChangePassword)"
    }

    $groups = $user.GetGroups() | ForEach-Object { $_.SamAccountName }
    if ($groups) {
        Write-Output "  Groups: $($groups -join ', ')"
    }

    Write-Output "  -----------------------------"
}
    }
    else {
        # Search for a specific user if $Username is provided
        # Specify the domain context
        $domainContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext('Domain', $Domain)

        # Create a UserPrincipal object for the specified username
        $userPrincipal = New-Object System.DirectoryServices.AccountManagement.UserPrincipal($domainContext)
        $userPrincipal.SamAccountName = $Username

        # Create a PrincipalSearcher object
        $principalSearcher = New-Object System.DirectoryServices.AccountManagement.PrincipalSearcher($userPrincipal)

        # Perform the search
        $user = $principalSearcher.FindOne()

        # Output detailed user information if found
        if ($user) {
            Write-Output "User Information for $($user.SamAccountName):"
    
    if ($user.DisplayName) {
        Write-Output "  Display Name: $($user.DisplayName)"
    }
    
    if ($user.EmailAddress) {
        Write-Output "  Email: $($user.EmailAddress)"
    }
    
    if ($user.Description) {
        Write-Output "  Description: $($user.Description)"
    }
    
    if ($user.Enabled) {
        Write-Output "  Enabled: $($user.Enabled)"
    }
    
    if ($user.LastLogon) {
        Write-Output "  Last Logon: $($user.LastLogon)"
    }
    
    if ($user.UserPrincipalName) {
        Write-Output "  User Principal Name: $($user.UserPrincipalName)"
    }
    
    if ($user.Sid) {
        Write-Output "  SID: $($user.Sid)"
    }
    
    if ($user.DistinguishedName) {
        Write-Output "  Distinguished Name: $($user.DistinguishedName)"
    }
    
    if ($user.HomeDirectory) {
        Write-Output "  Home Directory: $($user.HomeDirectory)"
    }
    
    if ($user.ScriptPath) {
        Write-Output "  Script Path: $($user.ScriptPath)"
    }
    
    if ($user.AccountExpirationDate) {
        Write-Output "  Account Expiration Date: $($user.AccountExpirationDate)"
    }

    if ($user.LastPasswordSet) {
        Write-Output "  Last Password Set: $($user.LastPasswordSet)"
    }

    if ($user.PasswordNeverExpires) {
        Write-Output "  Password Never Expires: $($user.PasswordNeverExpires)"
    }

    if ($user.PasswordLastSet) {
        Write-Output "  Password Last Set: $($user.PasswordLastSet)"
    }

    if ($user.PasswordExpires) {
        Write-Output "  Password Expires: $($user.PasswordExpires)"
    }

    if ($user.PasswordChangeable) {
        Write-Output "  Password Changeable: $($user.PasswordChangeable)"
    }

    if ($user.PasswordRequired) {
        Write-Output "  Password Required: $($user.PasswordRequired)"
    }

    if ($user.SmartcardRequired) {
        Write-Output "  Smartcard Required: $($user.SmartcardRequired)"
    }

    if ($user.TrustedForDelegation) {
        Write-Output "  Trusted For Delegation: $($user.TrustedForDelegation)"
    }

    if ($user.VoiceTelephoneNumber) {
        Write-Output "  Voice Telephone Number: $($user.VoiceTelephoneNumber)"
    }

    if ($user.GivenName) {
        Write-Output "  Given Name: $($user.GivenName)"
    }

    if ($user.Surname) {
        Write-Output "  Surname: $($user.Surname)"
    }

    if ($user.MiddleName) {
        Write-Output "  Middle Name: $($user.MiddleName)"
    }

    if ($user.Initials) {
        Write-Output "  Initials: $($user.Initials)"
    }

    if ($user.Title) {
        Write-Output "  Title: $($user.Title)"
    }

    if ($user.Department) {
        Write-Output "  Department: $($user.Department)"
    }

    if ($user.Company) {
        Write-Output "  Company: $($user.Company)"
    }

    if ($user.Manager) {
        Write-Output "  Manager: $($user.Manager)"
    }

    if ($user.EmployeeId) {
        Write-Output "  Employee ID: $($user.EmployeeId)"
    }

    if ($user.EmployeeType) {
        Write-Output "  Employee Type: $($user.EmployeeType)"
    }

    if ($user.HomePhone) {
        Write-Output "  Home Phone: $($user.HomePhone)"
    }

    if ($user.MobilePhone) {
        Write-Output "  Mobile Phone: $($user.MobilePhone)"
    }

    if ($user.Pager) {
        Write-Output "  Pager: $($user.Pager)"
    }

    if ($user.Fax) {
        Write-Output "  Fax: $($user.Fax)"
    }

    if ($user.StreetAddress) {
        Write-Output "  Street Address: $($user.StreetAddress)"
    }

    if ($user.City) {
        Write-Output "  City: $($user.City)"
    }

    if ($user.State) {
        Write-Output "  State: $($user.State)"
    }

    if ($user.PostalCode) {
        Write-Output "  Postal Code: $($user.PostalCode)"
    }

    if ($user.Country) {
        Write-Output "  Country: $($user.Country)"
    }

    if ($user.AccountLockoutTime) {
        Write-Output "  Account Lockout Time: $($user.AccountLockoutTime)"
    }

    if ($user.BadLogonCount) {
        Write-Output "  Bad Logon Count: $($user.BadLogonCount)"
    }

    if ($user.LogonCount) {
        Write-Output "  Logon Count: $($user.LogonCount)"
    }

    if ($user.PermittedWorkstations) {
        Write-Output "  Permitted Workstations: $($user.PermittedWorkstations)"
    }

    if ($user.PermittedLogonTimes) {
        Write-Output "  Permitted Logon Times: $($user.PermittedLogonTimes)"
    }

    if ($user.UserCannotChangePassword) {
        Write-Output "  User Cannot Change Password: $($user.UserCannotChangePassword)"
    }

    $groups = $user.GetGroups() | ForEach-Object { $_.SamAccountName }
    if ($groups) {
        Write-Output "  Groups: $($groups -join ', ')"
    }

    Write-Output "  -----------------------------"
        }
        else {
            Write-Host "User '$Username' not found in the domain '$Domain'."
        }
    }
}

# Example usage:
# Get-DomainUsers -Domain "tropicanatrust.local" -Username "specificuser"
# Get-DomainUsers -Domain "tropicanatrust.local"
