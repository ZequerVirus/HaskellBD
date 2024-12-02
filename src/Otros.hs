module Otros 
(
    saveJSON, 
    loadJSON, 
    desempaquetar, 
    obtenerElemento,
    eliminarElemento,
    mostrar,

) where 

---- Dependencias -----
import Data.Aeson (encode, decode) -- encode en json
import qualified Data.ByteString.Lazy as BL --para escribir archivos
import Control.Exception (evaluate)
-- Fin dependencias ---

saveJSON::FilePath->[[String]]->IO()
-- funcion para guardar las tablas en su respectivo JSON
saveJSON path tabla = do 
                      let encodetabla = encode tabla 
                      BL.writeFile path encodetabla

loadJSON::FilePath->IO([[String]])
-- funcion para obtener el contenido de las tablas desde su JSON
loadJSON path = do 
                tabla <- BL.readFile path
                let contenido = decode tabla
                print (length(desempaquetar contenido))
                return (desempaquetar contenido) 


desempaquetar::Maybe[[String]]->[[String]]
desempaquetar (Just lista) = lista
desempaquetar Nothing = []

obtenerElemento::[a]->Int->a
--obtengo el elemento pos de una lista
obtenerElemento (x:l) 0 = x  
obtenerElemento (x:l) pos = let 
                                nuevapos = pos - 1
                                esclavo = obtenerElemento l nuevapos
                            in 
                                if pos < (length (x:l)) then
                                    esclavo
                                else 
                                    error "Error - Posicion invalida"

eliminarElemento::[a]->Int->[a]
-- devuelve otra lista sin el elemento pos
eliminarElemento (x:l) 0 =  l
eliminarElemento (x:l) pos = let
                                nuevapos = pos - 1 
                                esclavo = eliminarElemento l nuevapos
                             in
                                if pos < (length (x:l)) then 
                                    [x]++esclavo
                                else 
                                    []
                            
mostrar::[[String]]->IO()
mostrar [] = do 
                putStrLn "Fin"

mostrar (x:l) = do 
                putStrLn (show x)
                mostrar l