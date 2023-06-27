$sourceou = "OU=Users,OU=Company,DC=Domain,DC=local"
$destinationou = "OU=Disabled,OU=Users,OU=Company,DC=Domain,DC=local"

$disabledusers = Get-ADUser -SearchBase $sourceou -Filter {Enabled -EQ $false}

foreach ($user in $disabledusers) {
    Move-AdObject -Identity $user.DistinguishedName -targetpath $destinationou
    write-host "Moved user $($user.name) to $destinationou"
}

