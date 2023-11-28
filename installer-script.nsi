!include "FileFunc.nsh"
!include "MUI2.nsh"

OutFile "InstallPDFRightClick.exe"
InstallDir "$LOCALAPPDATA\PDFRightClick"


Section "Install"
    SetOutPath $INSTDIR
    File "scripts\split.bat"
    File "scripts\merge.bat"
    File "icons\split.ico"
    File "icons\merge.ico"
    File "pdftk_free-2.02-win-setup.exe"

    MessageBox MB_OK "PDFRightClick - add shortcut in SendTo context menu. Github https://github.com/remmel/pdf-right-click"
    ExecWait "pdftk_free-2.02-win-setup.exe"
    CreateShortCut "$SENDTO\PDF Split.lnk" "$INSTDIR\split.bat" "" "$INSTDIR\split.ico"
    CreateShortCut "$SENDTO\PDF Merge.lnk" "$INSTDIR\merge.bat" "" "$INSTDIR\merge.ico"
    WriteUninstaller "$INSTDIR\uninstall.exe"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\PDFRightClick" "DisplayName" "PDFRightClick - shortcuts to pdf operations"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\PDFRightClick" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
SectionEnd

Section "Uninstall"
    Delete "$SENDTO\PDF Split.lnk"
    Delete "$SENDTO\PDF Merge.lnk"
    Delete "$INSTDIR\split.bat"
    Delete "$INSTDIR\merge.bat"
    Delete "$INSTDIR\split.ico"
    Delete "$INSTDIR\merge.ico"
    Delete "$INSTDIR\pdftk_free-2.02-win-setup.exe"
    Delete "$INSTDIR\uninstall.exe"
    RMDir $INSTDIR
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\PDFRightClick"
SectionEnd
