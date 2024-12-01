module Alumno 
(
    addAlumno,
    -- deleteAlumno
) where

addAlumno::String->String->[[String]]->[[String]]
--reg = Registro de Alumno
--nombre = Nombre de Alumno
--alumnos = Lista de Alumnos
addAlumno reg nombre alumnos = let 
                                lista = [reg, nombre]
                                newalumnos = alumnos ++ [lista]
                               in 
                                newalumnos
                                -- "Alumno anadido"