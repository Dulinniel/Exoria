@echo off

SET _weapon.name=Hache de bataille
SET _weapon.class=Guerrier
SET _weapon.description=Prévu pour les bourrins, cette hache fait de gros dégâts 
SET _weapon.magic_power=0
SET _weapon.force=9
SET _weapon.type=Physic

GOTO %1

:name
SET %~2=%_weapon.name%
