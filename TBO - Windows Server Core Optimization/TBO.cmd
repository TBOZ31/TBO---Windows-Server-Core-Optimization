@echo off
Pushd "%~dp0"
set WorkDir=%CD%

:OSCHECK
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OSARCH=32BIT || set OSARCH=64BIT

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment" > nul
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to run THE BIG ONE's Windows 10 Optimization Script.
 Goto END
)

:
echo				THE BIG ONE's WINDOWS 10 OPTIMIZIATION SCRIPT v12.0 BETA
echo				========================================================
:STEP1
echo.
echo 1)		Disabling UAC [User Account Control] - Elevated Administrator Privledges
REM Disable User Account Control, Run Applications as Administrator:
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f > nul


:STEP2
echo 2)		Configuring GUI visual effects settings for performance and speed
REM Set Windows "Performance" Visual Effects settings to Custom:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f > nul
REM Disable Animating & Delaying Minimizing and Maximizing Windows:
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f > nul
REM Disable Animations in Taskbar:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f > nul
REM Disable "Aero-Peek" (Preview Desktop when moving mouse to 'Show Desktop' button at end/corner of taskbar:
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f > nul
REM Enable: "Smooth-scroll list boxes", "Show Window Contents While Dragging"	Disable: "Slide open combo boxes", "Fade or slide menus into view", "Fade or slide ToolTips into view", "Fade out menu items after clicking", "Show shadows under mouse pointer":
Reg.exe add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9812068010000000" /f > nul


:STEP3
echo 3)		Disable Windows Telemetry - Spybot AntiBeacon Immunization
REM Execute Spybot AntiBeacon Telemetry Neutralization:
start /WAIT "SpybotAntoBeaconPortable" "%WorkDir%\SpybotAntiBeaconPortable\App\SpybotAntiBeacon\SDAntiBeacon.exe" /silent /apply


:STEP4
echo 4)		Disable and Stop Unnecessary Windows Services
REM Execute TBO Service Optimization Routine:
GOTO TBO.Services


:STEP5
echo 5)		Configuring Windows Theme color settings
REM Enable Windows Desktop Composition Manager:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "1" /f > nul
REM Disable Start Menu / Windows Transparency:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorizationGlassAttribute" /t REG_DWORD /d "0" /f > nul
REM Disable "Automatically Pick Accent Color From My Background" setting:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorizationColorBalance" /t REG_DWORD /d "89" /f > nul
REM Set Accent Colors to Gray:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "3288334336" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t REG_DWORD /d "3296097910" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorizationAfterglowBalance" /t REG_DWORD /d "10" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorizationBlurBalance" /t REG_DWORD /d "1" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "7763574" /f > nul
REM Show Accent Color on Start Menu, Taskbar, Action Center, etc:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "1" /f > nul
REM Disable "Aero-Peek" (Preview Desktop when moving mouse to 'Show Desktop' button at end/corner of taskbar:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f > nul
REM Disable Save Taskbar Thumbnail Previews to Cache:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f > nul
REM Set Theme Accent Colors to Gray:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "cccccc00aeaeae0092929200767676004f4f4f003737370026262600d1343800" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "4283387727" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "4285953654" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "1" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SpecialColor" /t REG_DWORD /d "2721740" /f > nul
REM Disable Start Menu / Windows Transparency:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f > nul
REM Enable Dark Mode:
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f > nul
REM Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f > nul
REM Remove Thick Borders on Windows
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "BorderWidth" /t REG_SZ /d "0" /f > nul
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /t REG_SZ /d "0" /f > nul


:STEP6
echo 6)		Configuring Windows Explorer GUI View, Navigation, and Start Menu settings
REM Start Menu Button Left Alignment
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f > nul
REM Disable Web Search Results in Start Menu::
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f > nul
REM Disable Start Menu "Suggested Applications":
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f > nul
REM Disable "Replace Command Prompt with Windows PowerShell in the Menu when right clicking start button / Pressing Win+X":
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontUsePowerShellOnWinX" /t REG_DWORD /d "1" /f > nul
REM Always Show Menus in Windows Explorer (No Longer Valid, Re-Enable):
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t REG_DWORD /d "0" /f > nul
REM Show Hidden Files:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f > nul
REM Always Show File Extensions:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f > nul
REM Windows Explorer will launch to "This PC" by default instead of "Quick Access":
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f > nul
REM Automatically Expand to Current Directory/Folder in Windows Explorer Navigation Pane:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneExpandToCurrentFolder" /t REG_DWORD /d "1" /f > nul
REM Show All Folders in Windows Explorer Navigation Pane:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d "1" /f > nul
REM Show Status Bar at bottom of Windows Explorer:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d "0" /f > nul
REM Show Hidden System Files in Windows Explorer:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d "1" /f > nul
REM Show Extended Details During File Transfer Dialog Box:
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "EnthusiastMode" /t REG_DWORD /d "1" /f > nul
REM Disable "Show Frequently Used Files / Folders" in Windows Explorer Quick Access:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f > nul
REM Disable "Show Recently Used Files / Folders" in Windows Explorer Quick Access:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f > nul
REM Disable "Show Recently Opened Items in Jump Lists" on Start Menu & Windows Explorer Quick Access:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f > nul
REM Disable "Use Sharing Wizard" in Windows Explorer File / Directory Sharing:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SharingWizardOn" /t REG_DWORD /d "0" /f > nul
REM Disable Window "Snapping" Arrangement:
Reg.exe add "HKCU\Control Panel\Desktop" /v "WindowArrangementActive" /t REG_SZ /d "0" /f > nul
REM Disable Showing ZIP files as directories in Windows Explorer:
Reg.exe delete "HKLM\CompressedFolder\CLSID" /f > nul 2>&1
Reg.exe delete "HKLM\SystemFileAssociations\.zip\CLSID" /f > nul 2>&1
REM Enable Confirmation Dialog When Deleting Files in Windows Explorer:
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ConfirmFileDelete" /t REG_DWORD /d "1" /f > nul


:STEP7
echo 7)		Disabling Windows Defender Services, SmartScreen, GPO, and Startup
"%WorkDir%\Tools\SetACL.exe" -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features\\" -ot reg -actn setowner -ownr "n:Administrators" > nul
"%WorkDir%\Tools\SetACL.exe" -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features\\" -ot reg -actn ace -ace "n:Administrators;p:full" > nul
"%WorkDir%\Tools\NSudoLC.exe" -U:T -wait -ShowWindowMode:Hide Reg.exe add "HKLM\Software\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d "0" /f
"%WorkDir%\Tools\NSudoLC.exe" -U:T -wait -ShowWindowMode:Hide Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "3" /f
"%WorkDir%\Tools\NSudoLC.exe" -U:T -wait -ShowWindowMode:Hide Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
"%WorkDir%\Tools\NSudoLC.exe" -U:T -wait -ShowWindowMode:Hide Reg.exe delete "HKLM\Software\Microsoft\Windows Defender\Features" /v "TamperProtectionSource" /f
"%WorkDir%\Tools\PsExec.exe" -accepteula -s reg add "HKLM\Software\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d "0" /f > nul 2>&1
REM Disable Windows Defender GPO
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f > nul
REM Disable Autorun Startup of Windows Defender & Security Health Center:
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "WindowsDefender" /f > NUL 2>&1
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f > NUL 2>&1
taskkill /F /IM MSASCuiL.exe > NUL 2>&1
REM Disable Microsoft Defender Smart Screen
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d "Off" /f > nul
REM Disable Microsoft Defender Smart Screen for Microsoft Store Apps
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "PreventOverride" /t REG_DWORD /d "0" /f > nul
REM Disable Microsoft Defender Smart Screen for Microsoft Edge:
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v "PreventOverride" /t REG_DWORD /d "0" /f > nul
REM Disable Microsoft Defender Smart Screen for Apps & Files from Web:
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f > nul
Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "ShellSmartScreenLevel" /f > NUL 2>&1


:STEP8
echo 8)		Disabling Automatic Updates, Automatic Store Updates, and Automatic Driver Downloads
REM Disable Automatic Windows Update Group Policy:
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f > nul
REM Disable Peer to Peer Update Sharing:
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization\DODownloadMode" /v "DODownloadMode" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKU\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f > nul
REM Disable Automatic Download of Winodws Store / App Updates
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f > nul
REM Disable "Allow Apps to Run in Background":
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f > nul
REM Do Not Include Drivers With Windows Updates:
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f > nul
REM Prevent Device Metadata Retrieval from the Internet:
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f > nul


:STEP9
echo 9)		Disabling Windows Firewall on Internal Private Networks
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f > nul

:STEP10
echo 10)		Enabling F8 Advanced Startup / Diagnostics Menu
REM Set BCDBoot "bootmenupolicy" to Legacy to invoke F8 Start-Up Menu:
bcdedit /set {current} bootmenupolicy Legacy > nul 2>&1

:STEP11
echo 11)		Removing Unnecessary Optional Features (Retail Demo Content, Contact Support, Quick Assist)
DISM /Online /Remove-Capability /CapabilityName:App.Support.ContactSupport~~~~0.0.1.0 > NUL
DISM /Online /Remove-Capability /CapabilityName:App.Support.QuickAssist~~~~0.0.1.0 > NUL
DISM /Online /Remove-Capability /CapabilityName:RetailDemo.OfflineContent.Content~~~~0.0.1.0 > NUL
DISM /Online /Remove-Capability /CapabilityName:RetailDemo.OfflineContent.Content~~~en-US~0.0.1.0 > NUL

:STEP12
GOTO EOF


REM	============================================================================================================================================

:TBO.Services
REM				THE BIG ONE Windows 10 Service Optimization
REM				===========================================
REM "Stopping and Disabling:	Connected User Experiences and Telemetry	(DiagTrack)"
sc stop "DiagTrack" > nul
sc config "DiagTrack" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Data Collection Publishing Service		(DcpSvc)"
sc stop DcpSvc > nul
sc config "DcpSvc" start= disabled > nul 

REM "Stopping and Disabling:	dmwappushsvc					(dmwappushservice)"
sc stop dmwappushservice > nul
sc config "dmwappushservice" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Downloaded Maps Manager				(MapsBroker)"
sc stop MapsBroker > nul
sc config "MapsBroker" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Geolocation Service				(lfsvc)"
sc stop lfsvc > nul
sc config "lfsvc" start= disabled > nul 2>&1

REM "Starting and Automating:	Function Discovery Resource Publication		(FDResPub)"
sc start FDResPub > nul
sc config "FDResPub" start= auto > nul

REM "Stopping and Disabling:	HomeGroup Listener				(HomeGroupListener)"
sc stop "HomeGroupListener" > nul
sc config "HomeGroupListener" start= disabled > nul 2>&1

REM "Stopping and Disabling:	HomeGroup Provider				(HomeGroupProvider)"
sc stop "HomeGroupProvider" > nul
sc config "HomeGroupProvider" start= disabled > nul 2>&1

REM "Stopping and Disabling:	One Drive Sync Service				(OneSyncSvc)
sc stop "OneSyncSvc" > nul
sc config "OneSyncSvc" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Program Compatability Assistant			(PcaSvc)"
sc stop "PcaSvc" > nul
sc config "PcaSvc" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Superfetch					(SysMain)"
sc stop "SysMain" > nul
sc config "SysMain" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Touch Keyboard and Handwriting Panel Service	(TabletInputService)"
sc stop "TabletInputService" > nul
sc config "TabletInputService" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Windows Error Reporting Service			(WerSvc)"
sc stop "WerSvc" > nul
sc config "WerSvc" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Windows Font Cache Service			(FontCache)"
sc stop "FontCache" > nul
sc config "FontCache" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Windows Search Indexer				(WSearch)"
sc stop "WSearch" > nul
sc config "WSearch" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Windows Presentation Foundation Font Cache	(FontCache3.0.0.0)"
sc stop "FontCache3.0.0.0" > nul
sc config "FontCache3.0.0.0" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Xbox Live Auth Manager				(XblAuthManager)"
sc stop "XblAuthManager" > nul
sc config "XblAuthManager" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Xbox Live Game Save				(XblGameSave)"
sc stop "XblGameSave" > nul
sc config "XblGameSave" start= disabled > nul 2>&1

REM "Stopping and Disabling:	Xbox Live Networking Service			(XboxNetApiSvc)"
sc stop "XboxNetApiSvc" > nul
sc config "XboxNetApiSvc" start= disabled > nul 2>&1

REM "Enabling:			Connected Devices Platform Service		(CDPSvc)"
REM sc stop "CDPSvc" > nul
REM sc config "CDPSvc" start= auto > nul 2>&1
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\CDPSvc" /v "Start" /t REG_DWORD /d "2" /f > nul

REM "Enabling:			Network Connection Broker			(NcbService)"
rem sc stop "NcbService" > nul
rem sc config "NcbService" start= disabled > nul 2>&1
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\NcbService" /v "Start" /t REG_DWORD /d "3" /f > nul


REM "Enabling:			Connected Devices Platform User Service		(CDPUserSvc)"
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\CDPUserSvc" /v "Start" /t REG_DWORD /d "2" /f > nul

ping 127.0.0.1 -n 1 > nul 2>&1
GOTO STEP5
REM	============================================================================================================================================


:EOF
echo			-Configuration and Optimization Complete-
:END
Pause
