@echo off
setlocal
@for %%n in (%0) do set fold=%%~dpn
color 5F
:menu
echo ------------------------
echo -- SwitchTools By Zoria --
echo  -- Version 1.5.3 --
echo ------------------------
echo.
echo 1.NSCBuilder
echo 2.TegraRcmGUI
echo 3.SAK (Converssion NSP / XCI / NSZ / XCZ)
echo 4.Update
echo 5.SysDVR (Screen Recorder)
echo 6.Quitter
echo.
set /p reponse="Quel programme voulez-vous executer ?"

If /i "%reponse%"=="1" goto :batch1
If /i "%reponse%"=="2" goto :batch2
If /i "%reponse%"=="3" goto :batch3
If /i "%reponse%"=="4" goto :batch4
If /i "%reponse%"=="5" goto :batch5
If /i "%reponse%"=="6" goto :fin

:batch1
call %fold%\ressource\NSCBuilder\NSCB_lang.bat
goto :menu
:batch2
call %fold%\ressource\TegraRcmGUI\TegraRcmGUI.exe
goto :menu
:batch3
call %fold%\ressource\SAK\SAK.bat
goto :menu
:batch4
call %fold%\ressource\Updaters.bat
goto :menu
:batch5
call %fold%\ressource\SysDVR\SysDVR.bat
goto :menu
:fin
endlocal
exit