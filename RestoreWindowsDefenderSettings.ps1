# Restaurar la política de ejecución de PowerShell al estado predeterminado (usualmente Restricted o AllSigned)
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope LocalMachine -Force

# Reactivar las notificaciones de Windows Defender
Set-MpPreference -UILockdown $false

# Habilitar la protección en tiempo real
Set-MpPreference -DisableRealtimeMonitoring $false

# Habilitar el monitoreo de comportamiento
Set-MpPreference -DisableBehaviorMonitoring $false

# Habilitar el escaneo de scripts
Set-MpPreference -DisableScriptScanning $false

# Habilitar la protección de red
Set-MpPreference -EnableNetworkProtection 1

# Habilitar la protección de carpetas controladas
Set-MpPreference -EnableControlledFolderAccess 1

# Habilitar la protección contra aplicaciones potencialmente no deseadas
Set-MpPreference -PUAProtection 1

# Habilitar el escaneo de dispositivos removibles
Set-MpPreference -DisableRemovableDriveScanning $false

# Habilitar el escaneo de archivos de red en escaneos completos
Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan $false

# Habilitar el escaneo de archivos de correo electrónico
Set-MpPreference -DisableEmailScanning $false

# Habilitar la protección IOAV
Set-MpPreference -DisableIOAVProtection $false

# Habilitar el uso de proxy según configuración del sistema
Set-MpPreference -ForceUseProxyOnly $false

# Restablecer la acción predeterminada para amenazas graves a la configuración recomendada (generalmente Quarantine o Remove)
Set-MpPreference -HighThreatDefaultAction 6  # Cambiar 6 al valor por defecto adecuado, usualmente 0 (Quarantine) o 2 (Remove)

# Restablecer la acción predeterminada para amenazas moderadas y bajas a la configuración recomendada
Set-MpPreference -ModerateThreatDefaultAction 0 -LowThreatDefaultAction 0  # Cambiar a los valores por defecto adecuados, generalmente 0 (Quarantine)

# Reactivar la recopilación de muestras
Set-MpPreference -SubmitSamplesConsent 1

# Guardar los cambios y reiniciar los servicios necesarios para que los cambios tengan efecto
Restart-Service WinDefend
