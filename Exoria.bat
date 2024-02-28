@echo off

: Foreground and Background ANSI color shortcuts
SET _fBlack=[30m
SET _bBlack=[40m
SET _fRed=[31m
SET _bRed=[41m
SET _fGreen=[32m
SET _bGreen=[42m
SET _fYellow=[33m
SET _bYellow=[43m
SET _fBlue=[34m
SET _bBlue=[44m
SET _fMag=[35m
SET _bMag=[45m
SET _fCyan=[36m
SET _bCyan=[46m
SET _fLGray=[37m
SET _bLGray=[47m
SET _fDGray=[90m
SET _bDGray=[100m
SET _fBRed=[91m
SET _bBRed=[101m
SET _fBGreen=[92m
SET _bBGreen=[102m
SET _fBYellow=[93m
SET _bBYellow=[103m
SET _fBBlue=[94m
SET _bBBlue=[104m
SET _fBMag=[95m
SET _bBMag=[105m
SET _fBCyan=[96m
SET _bBCyan=[106m
SET _fBWhite=[97m
SET _bBWhite=[107m
SET _RESET=[0m

SET _tUnderline=[4m
SET _ResetUnderlined=[24m

: Default save files location
SET _storyFolderLocation=%cd%\Chapters
SET _saveFolderLocation=%cd%\Saves
SET _inventoryFolderLocation=%cd%\Inventory
SET _lootFunctionFolderLocation=%cd%\Loot
SET _bagInventoryFileLocation=%_inventoryFolderLocation%\bag.txt
SET _equipementFileLocation=%_inventoryFolderLocation%\equipement.txt
SET _equipementFeriaFileLocation=%_inventoryFolderLocation%\equipement_Feria.txt
SET _equipementMalonisFileLocation=%_inventoryFolderLocation%\equipement_Malonis.txt
SET _characterFileLocation=%_saveFolderLocation%\character.txt
SET _positionFileLocation=%_saveFolderLocation%\position.txt

: Main Info about the character
SET _name=
SET _gender=
SET _class=
SET _level=
SET _xp=
SET _money=

: Main character's stats
SET _pv=
SET _pm=
SET _strength=
SET _agility=
SET _vitality=
SET _wisdom=
SET _luck=

:main
CLS
TITLE Exoria - Menu principal
ECHO:
ECHO ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º                                                               º
ECHO º                                                               º
ECHO º       Bienvenue dans Exoria, que voulez-vous faire ?          º
ECHO º                                                               º
ECHO º                                                               º
ECHO ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
ECHO:
ECHO 1. Nouvelle partie
IF EXIST %_characterFileLocation% (
    ECHO 2. Continuer la partie
)

CHOICE /C 12 /N /M "> "

IF %ERRORLEVEL% EQU 2 GOTO continue_game
IF %ERRORLEVEL% EQU 1 GOTO new_game

:continue_game
SET /p _position=<%_positionFileLocation%
SET /p _name=<%_characterFileLocation%
FOR /f "skip=1" %%G IN (%_characterFileLocation%) DO IF NOT DEFINED _gender SET "_gender=%%G"
FOR /f "skip=2" %%G IN (%_characterFileLocation%) DO IF NOT DEFINED _class SET "_class=%%G"
FOR /f "skip=3" %%G IN (%_characterFileLocation%) DO IF NOT DEFINED _level SET "_level=%%G"
FOR /f "skip=4" %%G IN (%_characterFileLocation%) DO IF NOT DEFINED _xp SET "_xp=%%G"
FOR /f "skip=5" %%G IN (%_characterFileLocation%) DO IF NOT DEFINED _money SET "_money=%%G"
CALL %_position%

:new_game
IF EXIST %_characterFileLocation% (
  CHOICE /C ON /N /M "Une progression existe d‚j…, la supprimer (O)ui ou (N)on ? > "
  IF %ERRORLEVEL% EQU 2 GOTO main
  IF %ERRORLEVEL% EQU 1 GOTO delete_it
) ELSE ( 
  ECHO > nul
  CLS
  GOTO new_character
)

:delete_it
DEL %_characterFileLocation%
DEL %_positionFileLocation%
DEL %_bagInventoryFileLocation%
DEL %_equipementFileLocation%
TYPE NUL > %_equipementFeriaFileLocation%
TYPE NUL > %_equipementMalonisFileLocation%
ECHO Progression supprim‚e
GOTO new_character

:new_character
CLS
ECHO Bienvenue dans le monde d'Exoria. Dans un premier temps, quel est ton nom ?
COPY NUL %_characterFileLocation% > NUL
COPY NUL %_bagInventoryFileLocation% > NUL
COPY NUL %_equipementFileLocation% > NUL
SET /p _name="> "
ECHO %_name% >> %_characterFileLocation%
CHOICE /C HF /N /M "Enchant‚ %_name%. Es-tu un (H)omme ou une (F)emme ? > "
IF %ERRORLEVEL% EQU 2 SET _gender=Femme
IF %ERRORLEVEL% EQU 1 SET _gender=Homme
ECHO %_gender% >> %_characterFileLocation%
IF %_gender%==Homme (
  SET _nobleTitle=Sir
  SET _hero=H‚ro
) ELSE (
  SET _nobleTitle=Miss
  SET _hero=H‚ro‹ne
)
ECHO Quel est ta classe ?
ECHO G. Guerrier
ECHO Le guerrier, un expert des armes aux corps-…-corps, d'une constitution impeccable.
ECHO %_fRed%" Ma hache dans leur crane, ‡a fait une chope ! "%_RESET%
ECHO:
ECHO M. Mage
ECHO Le mage, un maŒtre dans l'art d'appeler les forces sup‚rieurs et la manipulation du mana
ECHO %_fCyan%" Rien n'est vrai, tout est permis... "%_RESET%
ECHO:
ECHO A. Archer
ECHO L'archer, un mercenaire qui n'a besoin que de son arc et de ses flŠches pour tuer ses cibles … longue distance, peu importe les conditions.
ECHO %_fGreen%" Une flŠche, un mort. Ceci est mon credo. "%_RESET%
CHOICE /C GMA /N /M "> "
IF %ERRORLEVEL% EQU 3 SET _class=Archer
IF %ERRORLEVEL% EQU 2 SET _class=Mage
IF %ERRORLEVEL% EQU 1 SET _class=Guerrier
ECHO %_class% >> %_characterFileLocation%
ECHO Oh, tu es un %_class%, trŠs bien.
: Ligne du level dans le fichier de sauvegarde
ECHO 1 >> %_characterFileLocation%
: Ligne de l'Xp dans le fichier de sauvegarde
ECHO 0 >> %_characterFileLocation%
: Ligne de l'argent dans le fichier de sauvegarde
ECHO 5 >> %_characterFileLocation%
ECHO Avant de passer … la suite, regardons qui tu es:
ECHO Tu es %_nobleTitle% %_name%
ECHO Tu es un.e %_gender%
ECHO Et bien s–r tu es un %_class%
ECHO Est-ce exact (O)ui ou (N)on ?
CHOICE /C ON /N /M "> "
IF %ERRORLEVEL% EQU 2 GOTO new_character
IF %ERRORLEVEL% EQU 1 CALL %_storyFolderLocation%\introduction.bat

:eof
endlocal
ECHO TrŠs bien, au revoir
PAUSE > NUL