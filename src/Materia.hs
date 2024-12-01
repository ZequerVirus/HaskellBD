module Materia 
(
    addMateria,
    -- deleteMateria
) where

addMateria::String->String->[[String]]->[[String]]
--sigla = Sigla de Materia
--nombre = Nombre de Materia
--materias = Lista de Materias
addMateria sigla nombre materias = let 
                                    lista = [sigla, nombre]
                                    newmaterias = materias ++ [lista]
                                    in 
                                    newmaterias
                                    -- "Materia anadida"