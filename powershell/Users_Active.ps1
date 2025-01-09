Get-ADUser -Filter {LastLogonDate -lt (Get-Date).AddDays(-90)} -Properties LastLogonDate | 
Select-Object Name, SamAccountName, LastLogonDate | 
Export-Csv -Path "C:\InactiveUsers.csv" -NoTypeInformation