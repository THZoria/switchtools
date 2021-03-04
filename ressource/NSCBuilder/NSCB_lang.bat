@echo off
setlocal
@for %%n in (%0) do set fold=%%~dpn
color 5F
:menu
echo ------------------------
echo -- SwitchTools By Zoria --
echo ------------------------
echo.
echo 1.French
echo 2.English
echo 3.Retour au script
echo.
set /p reponse="Quel programme voulez-vous executer ? "

If /i "%reponse%"=="1" goto :batch1
If /i "%reponse%"=="2" goto :batch2
If /i "%reponse%"=="3" goto :batch3

:batch1
call "%fold%\NSCB_fr.bat"
goto :menu
:batch2
call "%fold%\NSCB.bat"
:batch3
call .\..\..\switchtools.bat