@echo off
setlocal
@for %%n in (%0) do set fold=%%~dpn
color 5F
:menu
echo ------------------------
echo -- SwitchTools By Zoria --
echo         Version 1.5.6
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
If /i "%reponse%"=="5" goto :batch6
If /i "%reponse%"=="5" goto :fin

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
call "%fold%\ressource\Updaters.bat"
goto :menu
:batch6
exit
goto :menu
:fin
endlocal
exit
