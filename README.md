# PowerShell-AD-Script
PowerShell Scripts for Enumeration on AD and Local Hosts

Scripts can be imported or execute in memory:
Some scripts do not take parameters and just output infomration

```
PS C:\> .\whoami-NET.ps1
User Name: DESKTOP-DER3566\Daturah
Authentication Type: NTLM
Is System: False
Is Guest: False
User SID: S-1-5-21-3539476848-4184824009-3815932257-1001
User SID (string): S-1-5-21-3539476848-4184824009-3815932257-1001
Groups:
  DESKTOP-DER3566\None
  Everyone
  BUILTIN\Users
  NT AUTHORITY\INTERACTIVE
  CONSOLE LOGON
  NT AUTHORITY\Authenticated Users
  NT AUTHORITY\This Organization
  NT AUTHORITY\Local account
  LOCAL
  NT AUTHORITY\NTLM Authentication
```
Some scripts will need parameters for proper targeted information

```
S C:\> Get-DomainUsers -Domain tropicanatrust.local -user anovoa
User Information for anovoa:
  Display Name: Adrian Novoa
  Enabled: True
  Last Logon: 11/03/2023 03:40:42
  User Principal Name: anovoa@tropicanatrust.local
  SID: S-1-5-21-2738515748-2482217857-1347743770-1103
  Distinguished Name: CN=Adrian Novoa,CN=Users,DC=tropicanatrust,DC=local
  Last Password Set: 11/03/2023 03:39:56
  Password Never Expires: True
  Given Name: Adrian
  Surname: Novoa
  Groups: Domain Users, Domain Admins
  -----------------------------
```
