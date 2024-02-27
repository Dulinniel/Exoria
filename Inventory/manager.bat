@echo off

SET _count=0
SET _found=
SET _storageFile=
SET out="new_equipement.txt"

GOTO %1

:add
FOR /f %%G IN ( %_equipementFileLocation% ) DO SET /a _count+=1
IF %_count% GTR 20 (
	 SET _storageFile=%_bagInventoryFileLocation% 
) ELSE (
	SET _storageFile=%_equipementFileLocation%
)

SET /a _count=0

FOR /f "tokens=1,2 delims=-" %%G IN (%_storageFile%) DO (
  SET /a _count+=1
  IF %%G ==%2 ( 
    IF %%H GTR 10 (
      ECHO %2-%3-%4 >> %out%
    ) ELSE (
      SET _x=%%H
      SET /a %_x%+=1
      ECHO %2-%_x%-%4 >> %out%
    )
  )
)

