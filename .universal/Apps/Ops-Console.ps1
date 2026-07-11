New-UDApp -Title 'Ops Console' -Content {
  $services = Get-Service | Select-Object Name, Status, StartType

  New-UDTable -Data $services -Columns @(
    New-UDTableColumn -Property Name -Title 'Name'
    New-UDTableColumn -Property Status -Title 'State'
  )
}
