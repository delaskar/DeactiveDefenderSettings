# Restaura la configuración de Windows Defender desde un archivo

# Importa las configuraciones desde un archivo de texto
$settings = Import-Clixml -Path "C:\Path\To\Backup\DefenderSettingsBackup.xml"
Set-MpPreference -DisableRealtimeMonitoring $settings.DisableRealtimeMonitoring
Set-MpPreference -DisableBehaviorMonitoring $settings.DisableBehaviorMonitoring
Set-MpPreference -DisableBlockAtFirstSeen $settings.DisableBlockAtFirstSeen
Set-MpPreference -DisableIOAVProtection $settings.DisableIOAVProtection
Set-MpPreference -DisablePrivacyMode $settings.DisablePrivacyMode
Set-MpPreference -DisableIntrusionPreventionSystem $settings.DisableIntrusionPreventionSystem
Set-MpPreference -DisableScriptScanning $settings.DisableScriptScanning
Set-MpPreference -EnableControlledFolderAccess $settings.ControlledFolderAccessStatus
Set-MpPreference -EnableNetworkProtection $settings.EnableNetworkProtection

