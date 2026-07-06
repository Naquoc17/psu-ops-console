New-PSUEndpoint -Url "/hello" -Method @('GET') -Endpoint {
  @{
  Message = "Hello from PSU"
  Time = Get-Date
  }
}
