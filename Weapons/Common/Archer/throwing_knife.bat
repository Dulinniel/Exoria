@echo off

SET _weapon.name=Couteaux de lancer
SET _weapon.class=Archer
SET _weapon.description=Des couteaux plus petits prévus pour être lancé sur l'adversaire
SET _weapon.magic_power=0
SET _weapon.force=2
SET _weapon.type=Physic

GOTO %1

:name
SET %~2=%_weapon.name%