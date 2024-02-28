@ECHO off

SET _count=0
SET _tempFileLocation=%_inventoryFolderLocation%\temp-inventory.txt
SET _storageFile=
SET /a _empty=1

GOTO %1

:add
COPY NUL %_tempFileLocation% > NUL
FOR /f %%G IN ( %_equipementFileLocation% ) DO SET /a _count+=1
IF %_count% GEQ 20 (
	SET _storageFile=%_bagInventoryFileLocation% 
) ELSE (
	SET _storageFile=%_equipementFileLocation%
)
setlocal EnableDelayedExpansion
FOR /f "tokens=1,2,3 delims=-" %%G IN (%_storageFile%) DO (
  SET /a _empty=0
  IF %%G==%2 ( 
    SET /a _new_quantity=%%H+%3
    ECHO %%G-!_new_quantity!-%%I >> %_tempFileLocation%
  ) ELSE ECHO %%G-1-%%I >> %_tempFileLocation%
)
IF %_empty%==1 ECHO %2-%3-%4 >> %_tempFileLocation%
endlocal

TYPE %_tempFileLocation% > %_storageFile%
DEL %_tempFileLocation%

