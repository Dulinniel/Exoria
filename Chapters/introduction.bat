@echo off
TITLE Exoria - Introduction
CLS
COPY NUL %_positionFileLocation% > NUL
ECHO %_storyFolderLocation%\introduction.bat>>%_positionFileLocation%
FOR /f "skip=1" %%G IN (%_positionFileLocation%) DO IF NOT DEFINED _save_point SET "_save_point=%%G"
IF [%_save_point%] EQU [] GOTO :start_point
IF [%_save_point%] NEQ [] GOTO %_save_point% 
:start_point
ECHO %_fMag%Maintenant, c'est … mon tour de me pr‚senter %_hero%, je suis Shenaos dieu des ƒmes et des h‚ros. Je t'ai appel‚ de ton monde pour venir aider celui-ci.
ECHO Dans la paix relative qui s'est instor‚e … Exoria, un mal pernicieux et d‚l‚tŠre se faufile dans la population. 
ECHO Les monstres se multiplient, les donjons s'ouvrent … nouveau, des maladies inconnus des humains se d‚veloppent.
ECHO En tant que d‚it‚, je n'ai pas le droit d'intervenir directement. Je fais donc appel … toi, %_nobleTitle% %_name%. 
ECHO Guide les brebis ‚gar‚s dans les verts pƒturage et punis de ta foudre vengeresse, quiconque tentera de les corrompre.
ECHO Je m'en remet … toi %_hero%, pour t'aider dans ta quˆte, Naana, la d‚esse de la fortune, t'offrira une arme.%_RESET%
GOTO introduction_save_point

:introduction_save_point
ECHO introduction_save_point>>%_positionFileLocation%
ECHO %_fMag%Es-tu prˆt … recevoir ton arme ?%_RESET%
ECHO:
ECHO A. Oui, je le suis
ECHO B. Non, laisse moi y r‚fl‚chir
CHOICE /C AB /N /M "> "
IF %ERRORLEVEL%==2 GOTO introduction_save_point
IF %ERRORLEVEL%==1 CALL %_lootFunctionFolderLocation%\weapon.bat Common %_class% weapon

PAUSE