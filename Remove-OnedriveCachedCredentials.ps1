Import-Module CredentialManager

If (!(Get-Module -Name CredentialManager)) {
    Install-Module CredentialManager -Force
    Import-Module CredentialManager
}

$Items = Get-StoredCredential -AsCredentialObject 
ForEach ($item in $items) {
    if ($item.TargetName -like "*OneDrive*") {
        Remove-StoredCredential -Target $item.TargetName
    }
}