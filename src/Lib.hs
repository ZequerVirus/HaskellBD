module Lib
    ( --someFunc
        menuPrincipal,
        menuAltas,
        menuBajas,
        menuTablas,
    ) where

-- aqui las dependencias
import System.IO (hFlush, stdout,) --para mostrar bien los out
import System.Console.ANSI (clearScreen) --para reiniciar la terminal
import Control.Concurrent (threadDelay) --para tiempos de espera
import Data.Aeson (encode, decode) -- encode en json
import qualified Data.ByteString.Lazy as BL --para escribir archivos
import Control.Exception (evaluate)
--import Control.DeepSeq (force) -- forzar que los archivos cierren
-- dependencias de tablas
import Historico
import Alumno 
import Profesor
import Materia 
import GrupoMateria
-- fin dependencias

-- cuando hay un "do" en el codigo debo hacer un return o algo de tipo IO 

menuPrincipal:: IO()
menuPrincipal = do 
                clearScreen
                putStr "\nAlumnos: " 
                alumnos <- loadJSON "src/json/Alumno.json"

                putStr "\nProfesores: " 
                alumnos <- loadJSON "src/json/Profesor.json"

                putStr "\nMaterias: " 
                alumnos <- loadJSON "src/json/Materia.json"


                putStrLn "\n--------Menu-Principal------"
                putStrLn "1. Altas"
                putStrLn "2. Bajas"
                putStrLn "3. Mostrar Tablas"
                putStrLn "4. Salir"
                putStrLn "----------------------------"
                putStr "Escoge una opcion: "
                
                hFlush stdout --Esto lo pongo porque opcion getLine 
                              --se esta ejecutando antes que el putStr
                
                opcion <- getLine
                case opcion of 
                    "1" -> do 
                        menuAltas

                    "2" -> do 
                        menuBajas

                    "3" -> do 
                        menuTablas

                    "4" -> do 
                        --return() no hace nada, salida limpia
                        clearScreen
                        return()

                    _ -> do 
                        putStrLn "Opcion invalida.\n Reiniciando..."
                        --esta en microsegundos (1000000 ms = 1 s)
                        threadDelay 1000000 
                        menuPrincipal


menuAltas:: IO()
menuAltas = do 
                clearScreen
                putStrLn "\n----------Menu-Altas--------"
                putStrLn "1. Alta Grupo Materia"
                putStrLn "2. Alta Historico"
                putStrLn "3. Volver (menu principal)"
                putStrLn "------------------------------"

                putStr "Escoge una opcion: "
                
                hFlush stdout --Esto lo pongo porque opcion getLine 
                              --se esta ejecutando antes que el putStr
                
                opcion <- getLine
                case opcion of 
                    "1" -> do 
                        putStr "Inserte Grupo-Materia (ID Sigla Codigo): "
                        hFlush stdout
                        -- recibo id, sigla materia y codigo profesor
                        sigcod <- getLine
                        let (sig:cod:_) = words sigcod

                        let path = "src/json/GrupoMateria.json"
                        gm <- loadJSON path
                        let iD = show (length gm)
                        let newgm = addGrupoMateria iD sig cod gm
                        saveJSON path newgm
                        putStr "Anadido con exito"
                        threadDelay 2000000
                        menuAltas

                    "2" -> do 
                        putStr "Inserte Historico (Registro Sigla Nota): "
                        hFlush stdout
                        -- aqui recibo registro, sigla y nota
                        regsignota <- getLine
                        let (reg:sig:nota:_) = words regsignota

                        let path = "src/json/Historico.json"
                        historicos <- loadJSON path
                        -- usar print historicos si no funciona
                        let newhistoricos = addHistorico reg sig nota historicos
                        saveJSON path newhistoricos
                        putStr "Anadido con exito"
                        threadDelay 2000000
                        menuAltas

                    "3" -> do 
                        menuPrincipal

                    _ -> do 
                        putStrLn "Opcion invalida.\n Reiniciando..."
                        --esta en microsegundos (1000000 ms = 1 s)
                        threadDelay 2000000 
                        menuAltas

menuBajas:: IO()
menuBajas = do 
                clearScreen
                putStrLn "\n---------Menu-Bajas---------"
                putStrLn "1. Baja Alumno"
                putStrLn "2. Baja Profesor"
                putStrLn "3. Baja Materia"
                putStrLn "4. Baja Grupo Materia"
                putStrLn "5. Baja Historico"
                putStrLn "6. Volver (menu principal)"
                putStrLn "----------------------------"

                putStr "Escoge una opcion: "
                
                hFlush stdout --Esto lo pongo porque opcion getLine 
                              --se esta ejecutando antes que el putStr
                
                opcion <- getLine
                --editar todos, los return()
                case opcion of 
                    "1" -> do 
                        putStr "Ingrese registro de alumno: "
                        hFlush stdout
                        reg <- getLine
                        return()

                    "2" -> do 
                        putStr "Ingrese codigo de profesor: "
                        hFlush stdout
                        codigo <- getLine
                        return()

                    "3" -> do
                        putStr "Ingrese sigla de materia: "
                        hFlush stdout
                        sigla <- getLine
                        return()

                    "4" -> do
                        putStr "Ingrese id de grupo-materia: "
                        hFlush stdout
                        iD <- getLine
                        return()

                    "5" -> do
                        putStr "Ingrese registro e id de historico: "
                        hFlush stdout
                        regiD <- getLine 
                        let (reg:iD:_) = words regiD
                        return()

                    "6" -> do 
                        menuPrincipal

                    _ -> do 
                        putStrLn "Opcion invalida.\n Reiniciando..."
                        --esta en microsegundos (1000000 ms = 1 s)
                        threadDelay 2000000 
                        menuBajas

menuTablas:: IO()
menuTablas = do
             clearScreen
             putStrLn "-------------Menu-Tablas------------"
             putStrLn "1. Mostrar Alumnos"
             putStrLn "2. Mostrar Profesores"
             putStrLn "3. Mostrar Materia"
             putStrLn "4. Mostrar GrupoMateria"
             putStrLn "5. Mostrar Historico"
             putStrLn "6. Volver (menu principal)"
             putStrLn "------------------------------------"

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