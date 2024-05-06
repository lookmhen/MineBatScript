$testcomputers = Get-Content -Path '.\Computer.txt'
$path = 'c$\Users\*\AppData\Local\Microsoft\Teams'
$exportLocation = '.\pcInventory.csv'

# Test connection to each computer before getting the MS-Teams Status
foreach ($computer in $testcomputers) {
  if (Test-Connection -ComputerName $computer -Quiet -count 2){
    Add-Content -value $computer -path .\livePCs.txt
  }else{
    Add-Content -value $computer -path .\deadPCs.txt
  }
}


# Now that we know which PCs are live on the network
# proceed with the inventory

Get-Content ".\livePCs.txt" | ForEach-Object {
    [PSCustomObject]@{
        Computer_Name = $_
        MSTeams        = Test-Path "\\$_\$path"
    }
} |Export-Csv $exportLocation -Append -NoTypeInformation
