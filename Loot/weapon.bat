@echo off
setlocal EnableDelayedExpansion

SET _inventoryManager=%cd%\Inventory\manager.bat
SET _weaponFolder=%cd%\Weapons
SET _pickupFolder=%_weaponFolder%\%1\%2
SET /a _count=0
SET /a _index=0
SET _chosen=

REM put all the files into a pseudo-array prefixed with "WEAPON_"
FOR /r %_pickupFolder% %%A IN (*.bat) DO (
  SET WEAPON_!_count!=%%~A 
  SET /a _count+=1
)

SET /a _index=%random% %% %_count%
CALL !WEAPON_%_index%! name _chosen
REM Add the weapon to the inventory
CALL %_inventoryManager% add "%_chosen%" 1 !WEAPON_%_index%!
endlocal & SET %~3=%_chosen%