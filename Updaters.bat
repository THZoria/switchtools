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
wget https://www.dropbox.com/s/xshrdqlk3gmr1xl/ressource.zip
@echo off
setlocal
cd /d %~dp0
7z x ressource.zip
del ressource.zip
cls
:fin
endlocal
exit