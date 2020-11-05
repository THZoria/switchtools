@echo off
:: BatchGotAdmin, see https://sites.google.com/site/eneerge/scripts/batchgotadmin
::-------------------------------------
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
	echo Demande de privilèges administratifs...
	echo Requesting administrative privileges
	goto UACPrompt
) else (
	goto gotAdmin
)

:UACPrompt
	echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs"
	exit /B

:gotAdmin
	if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
	pushd "%CD%"
	cd /D "%~dp0"
::--------------------------------------
setlocal
@for %%n in (%0) do set fold=%%~dpn
color 5F
:menu
echo ------------------------
echo -- SwitchTools By Zoria --
echo         Version 1.6.0
echo ------------------------
echo.
if not exist "%fold%\ressource\ressource.txt" call "%fold%\Updaters.bat"
echo 1.NSCBuilder
echo 2.TegraRcmGUI
echo 3.SAK (Conversion NSP / XCI / NSZ / XCZ)
echo 4.SysDVR
echo 5.Update
echo 6.Quitter
echo.
set /p reponse="Quel programme voulez-vous executer ?"

If /i "%reponse%"=="1" goto :batch1
If /i "%reponse%"=="2" goto :batch2
If /i "%reponse%"=="3" goto :batch3
If /i "%reponse%"=="4" goto :batch4
If /i "%repose%%"=="5" goto :batch5
If /i "%reponse%"=="6" goto :batch6
If /i "%reponse%"=="7" goto :fin

:batch1
call "%fold%\ressource\NSCBuilder\NSCB_lang.bat"
goto :menu
:batch2
call "%fold%\ressource\TegraRcmGUI\TegraRcmGUI.exe"
goto :menu
:batch3
call "%fold%\ressource\SAK\SAK.bat"
goto :menu
:batch4
cd C:\switchtools\ressource\SysDVR
call "%fold%\ressource\sysDVR\sysDVR.bat"
goto :menu
:batch5
call "%fold%\Payloader"
goto :menu
:batch6
call "%fold%\Updaters.bat"
goto :menu
:batch7
exit
goto :menu
:fin
endlocal
exit
