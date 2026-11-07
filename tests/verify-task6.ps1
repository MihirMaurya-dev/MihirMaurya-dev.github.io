$html = Get-Content -Raw "D:\DEV_OPS\Portfholio\index.html"

$tests = @(
  @{ Name = "Repository Search & Filter function"; Pattern = 'function filterRepositories\(' },
  @{ Name = "Theme toggle with View Transitions fallback"; Pattern = 'startViewTransition' },
  @{ Name = "LocalStorage theme persistence"; Pattern = "localStorage\.setItem\(['""]theme['""]" },
  @{ Name = "Web Audio click sound synthesizer"; Pattern = 'AudioContext' },
  @{ Name = "Audio mute toggle with persistence"; Pattern = "localStorage\.setItem\(['""]audio-mute['""]" },
  @{ Name = "Spotlight mousemove logic"; Pattern = '--mouse-x' }
)

$failed = $false
foreach ($t in $tests) {
  if ($html -notmatch $t.Pattern) {
    Write-Host "FAILED: $($t.Name)" -ForegroundColor Red
    $failed = $true
  } else {
    Write-Host "PASSED: $($t.Name)" -ForegroundColor Green
  }
}

if ($failed) {
  exit 1
} else {
  Write-Host "All Task 6 JavaScript verifications PASSED" -ForegroundColor Green
}
