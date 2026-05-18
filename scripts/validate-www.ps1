$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$registryPath = Join-Path $repoRoot "sites.json"

if (-not (Test-Path $registryPath)) {
  throw "Missing site registry: $registryPath"
}

$domainOwners = @{}
$registry = Get-Content -Path $registryPath -Raw | ConvertFrom-Json
$sites = @($registry.sites)

if (-not $sites) {
  throw "No sites found in sites.json"
}

foreach ($site in $sites) {
  if (-not $site.id -or -not $site.path) {
    throw "Every site registry entry needs id and path"
  }

  $siteRoot = Join-Path $repoRoot $site.path
  $siteJsonPath = Join-Path $siteRoot "site.json"
  $publicIndexPath = Join-Path $siteRoot "index.html"

  if (-not (Test-Path $siteJsonPath)) {
    throw "Missing site.json for $($site.id)"
  }

  if (-not (Test-Path $publicIndexPath)) {
    throw "Missing index.html for $($site.id)"
  }

  $siteConfig = Get-Content -Path $siteJsonPath -Raw | ConvertFrom-Json

  if (-not $siteConfig.id -or $siteConfig.id -ne $site.id) {
    throw "site.json id must match registry id for $($site.id)"
  }

  if (-not $siteConfig.path -or $siteConfig.path -ne $site.path) {
    throw "site.json path must match registry path for $($site.id)"
  }

  foreach ($domain in @($siteConfig.domains)) {
    if ([string]::IsNullOrWhiteSpace($domain)) {
      continue
    }

    if ($domainOwners.ContainsKey($domain)) {
      throw "Domain $domain is used by $($domainOwners[$domain]) and $($site.id)"
    }

    $domainOwners[$domain] = $site.id
  }
}

Write-Host "Validated $($sites.Count) site(s)."
