@echo off
setlocal

set datetime=%DATE:~-4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%

cd %~dp1
pdftk %* cat output "%datetime%_merged.pdf"
endlocal
