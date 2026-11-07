$html = Get-Content -Raw "D:\DEV_OPS\Portfholio\index.html"
$asserts = @(
  ($html -match 'id="experience"'),
  ($html -match 'DevOps Insiders'),
  ($html -match 'Cloud & DevOps Engineer Intern'),
  ($html -match 'University of Allahabad'),
  ($html -match 'M\.Sc, Computer Science'),
  ($html -match 'Ewing Christian College'),
  ($html -match 'B\.Sc, Mathematics & Computer Apps'),
  ($html -match '<footer>')
)
if ($asserts -contains $false) {
  Write-Error "Task 5 verification failed!"
  exit 1
} else {
  Write-Output "Task 5 verification PASSED"
}
