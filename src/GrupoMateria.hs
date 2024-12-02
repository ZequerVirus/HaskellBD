module GrupoMateria 
(
    addGrupoMateria,
    deleteGrupoMateria, 
    buscarGrupoMateria,
) where


-- Dependencias
import Otros
-- Fin dependencias

addGrupoMateria::String->String->String->[[String]]->[[String]]
--iD = ID de Grupo-Materia
--sigla = Sigla de Materia
--codigo = Codigo de Profesor
--gm = Lista de Grupo-Materia's
addGrupoMateria iD sigla codigo gm = let 
                                    lista = [iD, sigla, codigo]
                                    newgm = gm ++ [lista]
                                in 
                                    newgm 
                                    -- "Grupo Materia anadido"

deleteGrupoMateria::String->[[String]]->[[String]]
deleteGrupoMateria iD [] = []
deleteGrupoMateria iD gm = let 
                            posicion = buscarGrupoMateria iD gm 0
                            nuevogm = eliminarElemento gm posicion 
                           in
                            if posicion < (length gm) then 
                                nuevogm
                            else 
                                error "Error-Posicion invalida"

buscarGrupoMateria::String->[[String]]->Int->Int
buscarGrupoMateria iD [] pos = pos
buscarGrupoMateria iD (x:l) pos = let 
                                    nuevapos = pos + 1
                                    esclavo = buscarGrupoMateria iD l nuevapos
                                    elementoiD = obtenerElemento x 0
                                  in 
                                    if iD==elementoiD then 
                                        pos
                                    else 
                                        esclavo
                                    