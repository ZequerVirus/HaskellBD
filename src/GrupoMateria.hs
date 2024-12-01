module GrupoMateria 
(
    addGrupoMateria,
    -- deleteGrupoMateria
) where

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