module Alumno 
(
    addAlumno,
    deleteAlumno,
    buscarAlumno,
) where

-- Dependencias
import Otros
-- Fin dependencias

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

deleteAlumno::String->[[String]]->[[String]]
deleteAlumno reg [] = []
deleteAlumno reg alumnos= let 
                            posicion = buscarAlumno reg alumnos 0
                            nuevoalumnos = eliminarElemento alumnos posicion
                          in 
                            if posicion < (length alumnos) then 
                                nuevoalumnos
                            else 
                                error "Error-Posicion invalida"


buscarAlumno::String->[[String]]->Int->Int
buscarAlumno reg [] posicion = posicion
buscarAlumno reg (x:l) posicion = let 
                                      nuevapos = posicion + 1
                                      esclavo = buscarAlumno reg l nuevapos
                                      elemreg = obtenerElemento x 0 
                                      -- 0  porque el primer elemento de x es el registro
                                  in 
                                    if reg == elemreg then 
                                        posicion
                                    else 
                                        esclavo