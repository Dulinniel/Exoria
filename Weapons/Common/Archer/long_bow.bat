@echo off

SET _weapon.name=Arc long
SET _weapon.class=Archer
SET _weapon.description=Un arc de base, très utilisé pour les entraînements et les débutants, il est très long.
SET _weapon.magic_power=0
SET _weapon.force=4
SET _weapon.type=Physic

GOTO %1

:name
SET %~2=%_weapon.name%