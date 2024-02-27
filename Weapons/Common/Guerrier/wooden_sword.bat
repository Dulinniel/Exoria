@echo off

SET _weapon.name=‚p‚e en bois
SET _weapon.class=Guerrier
SET _weapon.description=L'‚p‚e de tous les guerriers, elle est utilis‚e pour les entraŒnements, mais elle peut aussi tuer
SET _weapon.magic_power=0
SET _weapon.force=7
SET _weapon.type=Physic

GOTO %1

:name
SET %~2=%_weapon.name%