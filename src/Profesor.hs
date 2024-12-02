module Profesor 
(
    addProfesor,
    deleteProfesor,
    buscarProfesor,

) where


-- Dependencias
import Otros
-- Fin dependencias

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

deleteProfesor::String->[[String]]->[[String]]
deleteProfesor codigo [] = []
deleteProfesor codigo profesores = let 
                                    posicion = buscarProfesor codigo profesores 0
                                    newprofesores = eliminarElemento profesores posicion 
                                   in 
                                    if posicion<(length profesores) then
                                        newprofesores
                                    else 
                                        error "Error-Posicion invalida"

buscarProfesor::String->[[String]]->Int->Int
buscarProfesor codigo [] pos = pos
buscarProfesor codigo (x:l) pos = let 
                                    nuevapos = posicion + 1
                                    esclavo = buscarProfesor codigo l nuevapos
                                    elemcodigo = obtenerElemento x 0
                                  in 
                                    if codigo==elemcodigo then
                                        pos
                                    else 
                                        esclavo


