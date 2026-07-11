New-UDApp -Title 'Ops Console' -Content {

  New-UDDynamic -AutoRefresh:$true -AutoRefreshInterval 5 -Content {
    $services = Get-Service | Select-Object Name, Status, StartType
    New-UDTable -Data $services -Columns @(
      New-UDTableColumn -Property Name -Title 'Name'
      New-UDTableColumn -Property Status -Title 'State'
    )

  }
}
