@echo off

SET _weapon.name=‚p‚e rouill‚e
SET _weapon.class=Guerrier
SET _weapon.description=Une ‚p‚e en acier, qui a rouill‚ … cause du manque d'entretien
SET _weapon.magic_power=0
SET _weapon.force=4
SET _weapon.type=Physic

GOTO %1

:name
SET %~2=%_weapon.name%
