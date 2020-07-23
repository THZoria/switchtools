@echo off
setlocal
@for %%n in (%0) do set fold=%%~dpn
color 5F
:menu
echo ------------------------
echo -- SwitchTools By Zoria --
echo ------------------------
echo.
echo - Verification des dernières mises a jour des ressources -
wget https://www.dropbox.com/s/30sgly6ju8omkz7/ressource.zip
cls
@echo off
setlocal
cd /d %~dp0
7z x ressource.zip
del ressource.zip
cls
:fin
endlocal
exit
