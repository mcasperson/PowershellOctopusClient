$PublishParams = @{
    Path = "$(Get-Location)\PowershellOctopusClient"
    NuGetApiKey = $env:PowershellGalleryApiKey
}

# There is no way to exclude files, so move the files were are interested in to a temporary location
If (Test-Path PowershellOctopusClient){
    Remove-Item -Recurse PowershellOctopusClient
}
mkdir PowershellOctopusClient
mkdir PowershellOctopusClient/lib
cp PowershellOctopusClient.psd1 PowershellOctopusClient
cp PowershellOctopusClient.psm1 PowershellOctopusClient
cp lib/Octopus.Client.dll PowershellOctopusClient/lib

# Publish the module
Publish-Module @PublishParams

# Clear the temporary files
Remove-Item -Recurse PowershellOctopusClient