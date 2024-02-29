@echo off

SET _weapon.name=Baguette en bois
SET _weapon.class=Mage
SET _weapon.description=Une baguette magique, la plus simple de toute. Elle permet de canalyser la force magique en un point quand elle est utilisée
SET _weapon.magic_power=6
SET _weapon.force=0
SET _weapon.type=Magic

GOTO %1

:name
SET %~2=%_weapon.name%