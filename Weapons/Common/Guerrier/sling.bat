@echo off

SET _weapon.name=Fronde
SET _weapon.class=Guerrier
SET _weapon.description=La seule arme qui permet de tirer sur les ennemis à distance pour un guerrier
SET _weapon.magic_power=0
SET _weapon.force=5
SET _weapon.type=Physic

GOTO %1

:name
SET %~2=%_weapon.name%
