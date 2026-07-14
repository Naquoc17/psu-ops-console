New-UDApp -Title 'Ops Console' -Pages @(
  New-UDPage -Name 'Server' -Url 'server' -Content {
    New-UDForm -Children {
      New-UDTextbox -Id 'ServiceName' -Label 'Enter name of the service'
    } -OnSubmit {
      $name = $EventData.ServiceName
      try
      {
        Restart-Service -Name $name
        Show-UDToast -Message "Restarted: $name"
      } catch
      {
        Show-UDToast -Message "Failed: $($_.Exception.Message)"
      }
    }

    New-UDDynamic -Id 'ServiceTable' -AutoRefresh:$true -AutoRefreshInterval 3 -Content {
      $services = Get-Service | Select-Object Name, Status, StartType
      New-UDTable -Data $services -Columns @(
        New-UDTableColumn -Property Name -Title 'Name'
        New-UDTableColumn -Property Status -Title 'State'
      )
    }
  }
  New-UDPage -Name 'Database' -Url 'database' -Content {}
)

