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

New-PSUEndpoint -Url "/report" -Method 'POST' -Endpoint {
  param(
    [switch]$IncludeServices
  )
  $job = Invoke-PSUScript -Name 'Get-SystemReport.ps1' -Integrated -Parameters @{ IncludeServices = $IncludeServices}
  @{
    Status = 'Accepted'
    JobId = $job.Id
  }
}

New-PSUEndpoint -Url "/report/:jobId" -Method 'Get' -Endpoint {
  param(
    [Parameter(Mandatory)]$JobId
  )
  $job = Get-PSUJobOutput -Integrated -JobId $JobId
  @{
    Result = $job
  }
}
