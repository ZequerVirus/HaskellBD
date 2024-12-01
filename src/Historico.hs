module Historico 
    (   
        addHistorico,
    ) where

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


