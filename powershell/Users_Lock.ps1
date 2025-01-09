$InactiveUsers = Get-ADUser -Filter {LastLogonDate -lt (Get-Date).AddDays(-180)} -Properties LastLogonDate
foreach ($User in $InactiveUsers) {
    Disable-ADAccount -Identity $User.SamAccountName
    Write-Output "$($User.SamAccountName) devre dışı bırakıldı."
}
