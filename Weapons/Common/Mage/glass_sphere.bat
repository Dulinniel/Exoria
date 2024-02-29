@echo off

SET _weapon.name=Orbe de verre
SET _weapon.class=Mage
SET _weapon.description=Une orbe parfaite en verre qui contient du mana et permet de lancer de puissants sorts
SET _weapon.magic_power=8
SET _weapon.force=0
SET _weapon.type=Magic

GOTO %1

:name
SET %~2=%_weapon.name%