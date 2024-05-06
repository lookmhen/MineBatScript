Get-ChildItem -Path "D:\" -File -Recurse | Select-Object FullName, Length | Sort-Object -Property Length -Descending
