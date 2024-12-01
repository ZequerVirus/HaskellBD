module Profesor 
(
    addProfesor,
    -- deleteProfesor
) where

addProfesor::String->String->[[String]]->[[String]]
--codigo = Codigo de Profesor
--nombre = Nombre de Profesor
--profesores = Lista de Profesores
addProfesor codigo nombre profesores = let 
                                        lista = [codigo, nombre]
                                        newprofesores = profesores ++ [lista]
                                        in 
                                        newprofesores 
                                        -- "Profesor anadido"

