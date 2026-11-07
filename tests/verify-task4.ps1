$html = Get-Content -Raw "D:\DEV_OPS\Portfholio\index.html"
$repos = @(
  "azure-hub-spoke-architecture", "Master_PipeLine", "master-devsecops-pipeline", "azure-caf-modular-iac",
  "agentic-ai-devops", "genesis-iac-security-framework", "azure-devops-iis-automation",
  "axion-enterprise-infra", "PipeLine", "Terraform", "CI-CD", "FlexZone", "MihirMaurya-dev.github.io"
)
$missing = @()
foreach ($r in $repos) {
  if ($html -notmatch [regex]::Escape($r)) { $missing += $r }
}
$matches = [regex]::Matches($html, '<article\s+class="[^"]*\brepo-card\b[^"]*"')
if ($matches.Count -ne 13) {
  Write-Error "Expected exactly 13 repo-card elements, found $($matches.Count)"
  exit 1
}
if ($missing.Count -gt 0) {
  Write-Error "Missing repositories: $($missing -join ', ')"
  exit 1
}
Write-Output "Task 4 verification PASSED (all 13 repositories present)"
