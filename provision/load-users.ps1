Import-Module ActiveDirectory
New-ADOrganizationalUnit -Name "Employees"
$Users = Import-Csv -Delimiter ";" -Path ".\userslist.csv"  
foreach ($User in $Users)  
{  
    $OU = "OU=Employees,DC=example,DC=com"  
    $Password = $User.password 
    $Detailedname = $User.firstname + " " + $User.name 
    $UserFirstname = $User.Firstname 
    $FirstLetterFirstname = $UserFirstname.substring(0,1) 
    $SAM =  $FirstLetterFirstname + $User.name 
    New-ADUser -Name $Detailedname -SamAccountName $SAM -UserPrincipalName $SAM -DisplayName $Detailedname -GivenName $user.firstname -Surname $user.name -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path $OU  
} 
