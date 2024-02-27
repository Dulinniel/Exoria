@echo off
setlocal EnableDelayedExpansion

SET _weaponFolder=%cd%\Weapons
SET _pickupFolder=%_weaponFolder%\%1\%2
SET _count=0
SET _index=0
SET _chosen=

REM put all the files into a pseudo-array prefixed with "WEAPON_"
FOR /r %_pickupFolder% %%A IN (*.bat) DO (
  SET WEAPON_!_count!=%%~A
  SET /a _count+=1
)

SET /a _index=%random% %% %_count%
CALL !WEAPON_%_index%! name _chosen
REM Use _chosen variable to update it here and being able to pass it as reference in the calling program
ECHO %_chosen% >> NUL
endlocal & SET %~3=%_chosen%