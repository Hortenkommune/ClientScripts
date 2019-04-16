$Username = Get-WMIObject -class Win32_ComputerSystem | Select-Object -ExpandProperty Username
$ObjUser = New-Object System.Security.Principal.NTAccount($Username)
$SID = $Objuser.Translate([System.Security.Principal.SecurityIdentifier])
$UPN = Get-ItemPropertyValue -path HKLM:\SOFTWARE\Microsoft\IdentityStore\Cache\$($SID.value)\IdentityCache\$($SID.value) -Name “UserName”