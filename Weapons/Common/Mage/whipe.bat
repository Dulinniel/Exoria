@echo off

SET _weapon.name=Fouet
SET _weapon.class=Mage
SET _weapon.description=Un fouet, une arme léthal qui peut toucher plusieurs ennemis, la seule arme non-magique pour un mage
SET _weapon.magic_power=3
SET _weapon.force=3
SET _weapon.type=Physic

GOTO %1

:name
SET %~2=%_weapon.name%