$UserDetails = @{
    GivenName = "Ahmet"
    Surname = "Yılmaz"
    Name = "Ahmet Yılmaz"
    SamAccountName = "ayilmaz"
    UserPrincipalName = "ayilmaz@domain.com"
    Path = "OU=Users,DC=domain,DC=com"
    AccountPassword = (ConvertTo-SecureString -String "Password123!" -AsPlainText -Force)
    Enabled = $true
}
New-ADUser @UserDetails