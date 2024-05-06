
$path = 'c$\Program Files\McAfee'
$exportLocation = '.\trellix.csv'


# Now that we know which PCs are live on the network
# proceed with the inventory

Get-Content ".\livePCs.txt" | ForEach-Object {
    [PSCustomObject]@{
        Computer_Name = $_
        Trellix        = Test-Path "\\$_\$path"
    }
} |Export-Csv $exportLocation -Append -NoTypeInformation