# Solicita al usuario que ingrese la ruta de almacenamiento para el archivo de respaldo
$backupPath = Read-Host "Enter the full path:"

# Verifica si la carpeta de la ruta proporcionada existe, si no, la crea
$directory = Split-Path -Path $backupPath
if (-Not (Test-Path -Path $directory)) {
    Write-Host "The specified folder does not exist, creating it..."
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
}

# Exporta las configuraciones actuales a un archivo XML en la ruta especificada
$settings = Get-MpPreference
$settings | Export-Clixml -Path $backupPath

Write-Host "successfully supported in: $backupPath"

