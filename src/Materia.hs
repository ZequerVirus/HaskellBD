module Materia 
(
    addMateria,
    deleteMateria,
    buscarMateria,
) where


-- Dependencias
import Otros
-- Fin dependencias

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

deleteMateria::String->[[String]]->[[String]]
deleteMateria sigla [] = []
deleteMateria sigla materias = let 
                        posicion = buscarMateria sigla materias 0
                        nuevomaterias = eliminarElemento materias posicion 
                      in
                        if posicion < (length materias) then 
                            nuevomaterias
                        else 
                            error "Error-Posicion invalida"

buscarMateria::String->[[String]]->Int->Int
buscarMateria sigla [] pos = pos
buscarMateria sigla (x:l) pos = let 
                                nuevapos = pos + 1
                                esclavo = buscarMateria sigla l nuevapos
                                elemsigla = obtenerElemento x 0
                              in 
                                if sigla==elemsigla then 
                                    pos
                                else 
                                    esclavo