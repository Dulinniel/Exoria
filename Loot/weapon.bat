@echo off

SET _weaponFolder=%cd%\Weapons
SET _uniqueWeaponFolder=%_weaponFolder%\Unique
SET _legendaryWeaponFolder=%_weaponFolder%\Legendary
SET _rareWeaponFolder=%_weaponFolder%\Rare
SET _uncommonWeaponFolder=%_weaponFolder%\Uncommon
SET _commonWeaponFolder=%_weaponFolder%\Common

GOTO %1

:common
  FOR /f "tokens=*" %%G IN ('DIR %_commonWeaponFolder%\*.* ^| find "/"') DO SET /a _max_bound+=1
  SET /a _max_bound-=2
  SET /a %~2=%random% %% %_max_bound% + 1
:uncommon
  FOR /f "tokens=*" %%G IN ('DIR %_uncommonWeaponFolder%\*.* ^| find "/"') DO SET /a _max_bound+=1
  SET /a _max_bound-=2
  SET /a %~2=%random% %% %_max_bound% + 1

:rare
  FOR /f "tokens=*" %%G IN ('DIR %_rareWeaponFolder%\*.* ^| find "/"') DO SET /a _max_bound+=1
  SET /a _max_bound-=2
  SET /a %~2=%random% %% %_max_bound% + 1

:legendary
  FOR /f "tokens=*" %%G IN ('DIR %_legendaryWeaponFolder%\*.* ^| find "/"') DO SET /a _max_bound+=1
  SET /a _max_bound-=2
  SET /a %~2=%random% %% %_max_bound% + 1

:unique
  FOR /f "tokens=*" %%G IN ('DIR %_uniqueWeaponFolder%\*.* ^| find "/"') DO SET /a _max_bound+=1
  SET /a _max_bound-=2
  SET /a %~2=%random% %% %_max_bound% + 1
