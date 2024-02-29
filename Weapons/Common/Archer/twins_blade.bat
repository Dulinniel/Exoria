@echo off

SET _weapon.name=Lames jumelles
SET _weapon.class=Archer
SET _weapon.description=Les lames favorites des archers, elles peuvent frapper deux fois leur adversaire et peuvent être lancés sur l'adversaire quand elles sont utilisées
SET _weapon.magic_power=0
SET _weapon.force=5
SET _weapon.type=Physic

GOTO %1

:name
SET %~2=%_weapon.name%