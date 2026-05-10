param(
    [Parameter(Mandatory = $true)]
    [int]$Count,

    [string]$ApiUrl = "http://127.0.0.1:5000/random-image",

    [string]$OutputDir = "$HOME\Downloads\picz"
)

if ($Count -le 0) {
    throw "Count must be greater than 0."
}

if (-not (Test-Path -Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

for ($i = 1; $i -le $Count; $i++) {
    $response = Invoke-RestMethod -Uri $ApiUrl -Method Get

    if (-not $response.image_url) {
        throw "API response does not contain 'image_url'."
    }

    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss_fff"
    $fileName = "pic_${timestamp}_$i.jpg"
    $filePath = Join-Path $OutputDir $fileName

    Invoke-WebRequest -Uri $response.image_url -OutFile $filePath
    Write-Host "Saved: $filePath"
}

Write-Host "Done. Saved $Count image(s) to $OutputDir"
