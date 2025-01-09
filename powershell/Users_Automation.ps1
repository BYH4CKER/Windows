$Users = Import-Csv -Path "C:\UserList.csv"
foreach ($User in $Users) {
    try {
        New-ADUser -GivenName $User.GivenName -Surname $User.Surname -Name "$($User.GivenName) $($User.Surname)" \
        -SamAccountName $User.SamAccountName -UserPrincipalName "$($User.SamAccountName)@domain.com" \
        -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString -String "Password123!" -AsPlainText -Force) \
        -Enabled $true
       
        Add-ADGroupMember -Identity $User.Group -Members $User.SamAccountName

        Write-Output "$($User.SamAccountName) başarıyla eklendi."
    }
    catch {
        Write-Error "Hata: $($_.Exception.Message)"
    }
}