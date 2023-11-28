@echo off
setlocal

cd %~dp1

pdftk %1 burst output %~n1_page_%%d.pdf

endlocal
