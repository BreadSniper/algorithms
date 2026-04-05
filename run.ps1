$ErrorActionPreference = "Stop"

$projectPath = Join-Path $PSScriptRoot "algorithms/algorithms.csproj"

dotnet restore $projectPath
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

dotnet build $projectPath --no-restore
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

dotnet test $projectPath --no-build --no-restore
exit $LASTEXITCODE
