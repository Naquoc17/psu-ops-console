New-PSUEndpoint -Url "/hello" -Method @('GET') -Endpoint {
  @{
  Message = "Hello from PSU"
  Time = Get-Date
  }
}

New-PSUEndpoint -Url "/note" -Method 'POST' -Endpoint {
    param(
    [Parameter(Mandatory)]$Title, 
    $Text
    )
    @{
        Received = $Title
        Text = $Text
        Time = Get-Date
      }
  }
