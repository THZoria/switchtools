::Script by Shadow256
Setlocal enabledelayedexpansion
@echo on
chcp 65001
IF EXIST templogs (
	del /q templogs 2>nul
	rmdir /s /q templogs 2>nul
)
mkdir templogs
IF NOT EXIST Payloads\*.* (
	del /q Payloads 2>nul
	mkdir Payloads
)
:list_payloads
copy nul templogs\payload_list.txt
set max_payload=1
cd Payloads
for %%z in (*.bin) do (
	echo !max_payload!: %%z >>..\templogs\payloads_list.txt
	set /a max_payload+=1
)
cd ..
:select_payload
echo Choisir un payload. >con
echo.>con
TOOLS\gnuwin32\bin\tail.exe -q -n+0 templogs\payloads_list.txt >con
echo 0: Choisir un fichier de payload >con
echo N'importe quel autre choix: Revenir au menu principal. >con
echo.>con
set /p payload_number=Entrez le numéro du payload à lancer: >con
IF "%payload_number%"=="" goto:finish_script
call TOOLS\Storage\functions\strlen.bat nb "%payload_number%"
set i=0
:check_chars_payload_number
IF %i% NEQ %nb% (
	set check_chars=0
	FOR %%z in (0 1 2 3 4 5 6 7 8 9) do (
		IF "!payload_number:~%i%,1!"=="%%z" (
			set /a i+=1
			set check_chars=1
			goto:check_chars_payload_number
		)
	)
	IF "!check_chars!"=="0" (
		goto:finish_script
	)
)
IF "%payload_number%"=="0" (
	%windir%\system32\wscript.exe //Nologo TOOLS\Storage\functions\open_file.vbs "" "Fichier de payload Switch (*.bin)|*.bin|" "Sélection du payload" "templogs\tempvar.txt"
	set /p payload_path=<templogs\tempvar.txt
)
IF "%payload_number%"=="0" (
	IF "%payload_path%"=="" (
		echo Aucun payload sélectionné, retour à la sélection de payloads. >con
		set payload_number=
		goto:select_payload
	)
	goto:launch_payload
)
TOOLS\gnuwin32\bin\grep.exe "%payload_number%: " <templogs\payloads_list.txt | TOOLS\gnuwin32\bin\cut.exe -d : -f 2 > templogs\tempvar.txt
set /p payload_path=<templogs\tempvar.txt
IF "%payload_path%"=="" (
	goto:finish_script
)
set payload_path=%payload_path:~1,-1%
:launch_payload
echo ********************************************* >con
echo ***    CONNECTEZ LA SWITCH EN MODE RCM    *** >con
echo ********************************************* >con
echo 1) Connecter la Switch en USB et l'éteindre >con
echo 2) Appliquer le JoyCon Haxx : PIN1 + PIN10 ou PIN9 + PIN10 >con
echo 3) Faire un appui long sur VOLUME UP + appui court sur POWER >con
echo En attente d'une Switch en mode RCM... >con
tools\TegraRcmSmash\TegraRcmSmash.exe -w "payloads\%payload_path%"
IF %errorlevel% GTR 0 (
	echo Une erreur s'est produite pendant l'injection du payload. Vérifiez que le mode RCM de la Switch est lancé, que votre cable USB est bien relié à l'ordinateur et que les drivers ont été installés puis recommencez. >con
) else (
	echo ********************************************* >con
	echo ***            Payload injecté            *** >con
	echo ********************************************* >con
)
:end_script
pause >con
:finish_script
IF EXIST templogs (
	rmdir /s /q templogs
)
endlocal
