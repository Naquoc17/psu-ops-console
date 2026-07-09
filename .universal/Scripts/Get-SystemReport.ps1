param(
  [switch]$IncludeServices
)
Start-Sleep -Second 5
if ($IncludeServices)
{
  Get-Service | Select-Object -First 5
} else
{
  Get-Date
}
