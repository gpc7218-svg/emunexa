!include "MUI2.nsh"

Name "EmuNexa"
OutFile "dist/EmuNexa-Setup-1.0.0-windows-x64.exe"
InstallDir "$PROGRAMFILES\EmuNexa"
InstallDirRegKey HKCU "Software\EmuNexa" ""
RequestExecutionLevel admin

!define MUI_ICON "build/icon.ico"
!define MUI_UNICON "build/icon.ico"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

Section "MainSection" SEC01
    SetOutPath "$INSTDIR"
    File /r "build\EmuNexa.exe"
    File /r "frontend\dist\*"
    WriteRegStr HKCU "Software\EmuNexa" "" "$INSTDIR"
    WriteUninstaller "$INSTDIR\Uninstall.exe"
    CreateDirectory "$SMPROGRAMS\EmuNexa"
    CreateShortCut "$SMPROGRAMS\EmuNexa\EmuNexa.lnk" "$INSTDIR\EmuNexa.exe"
    CreateShortCut "$DESKTOP\EmuNexa.lnk" "$INSTDIR\EmuNexa.exe"
SectionEnd

Section "Uninstall"
    Delete "$INSTDIR\EmuNexa.exe"
    RMDir /r "$INSTDIR"
    Delete "$SMPROGRAMS\EmuNexa\EmuNexa.lnk"
    Delete "$DESKTOP\EmuNexa.lnk"
    RMDir "$SMPROGRAMS\EmuNexa"
    DeleteRegKey HKCU "Software\EmuNexa"
SectionEnd
