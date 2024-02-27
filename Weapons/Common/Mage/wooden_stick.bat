@echo off

SET _weapon.name=Bâton de bois
SET _weapon.class=Mage
SET _weapon.description=Un morceau de bois tout ce qu'il y a de plus simple, faible pour frapper, mais très efficace pour concentrer sa magie
SET _weapon.magic_power=5
SET _weapon.force=1
SET _weapon.type=Magic

GOTO %1

:name
SET %~2=%_weapon.name%