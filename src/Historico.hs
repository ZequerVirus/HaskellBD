module Historico 
    (   
        addHistorico,
        deleteHistorico,
        buscarHistorico,
    ) where

-- Dependencias
import Otros
-- Fin dependencias

addHistorico::String->String->String->[[String]]->[[String]]
--reg = Registro de Alumno
--iD = Id de Grupo-Materia
--nota = Nota sacada en la materia
--historicos = Lista de Historicos
addHistorico reg iD nota historicos =  let 
                                    lista = [reg, iD, nota]
                                    newhistoricos = historicos ++ [lista]
                                    in
                                    newhistoricos
                                    -- "Historico anadido"

deleteHistorico::String->String->[[String]]->[[String]]
deleteHistorico reg iD [] = []
deleteHistorico reg iD historicos = let 
                                      posicion = buscarHistorico reg iD historicos 0
                                      newhistoricos = eliminarElemento historicos posicion
                                    in 
                                      if posicion < (length historico) then 
                                        newhistoricos
                                      else 
                                        error "Error - Posicion invalida"

buscarHistorico::String->String->[[String]]->Int->Int
buscarHistorico reg iD [] pos = pos
buscarHistorico reg iD (x:l) pos = let 
                                    nuevapos = pos + 1 
                                    esclavo = buscarHistorico reg iD l nuevapos
                                    elemreg = obtenerElemento x 0
                                    elemiD = obtenerElemento x 1
                                   in 
                                    if reg==elemreg && iD==elemiD then
                                        pos
                                    else 
                                        esclavo





