module Lib
    ( --someFunc
        menuPrincipal,
        menuAltas,
        menuBajas,
        menuTablas,
    ) where

-- aqui las dependencias
import System.IO (hFlush, stdout) --para mostrar bien los out
import System.Console.ANSI (clearScreen) --para reiniciar la terminal
import Control.Concurrent (threadDelay) --para tiempos de espera
import Otros
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

                        let path = "json/GrupoMateria.json"
                        let gm = loadJSON path
                        let newgm = addGrupoMateria iD sig cod gm
                        saveJSON path newgm


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
                        threadDelay 1000000 
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
                        let (register:_) = words reg

                        let path = "src/json/Alumno.json"
                        alumnos <- loadJSON path
                        let newalumnos = deleteAlumno register alumnos
                        saveJSON path newalumnos
                        putStrLn "Eliminado con exito"
                        threadDelay 1000000
                        menuBajas

                    "2" -> do 
                        putStr "Ingrese codigo de profesor: "
                        hFlush stdout
                        cod <- getLine
                        let (codigo:_) = words cod

                        let path = "src/json/Profesor.json"
                        profesores <- loadJSON path
                        let newprofesores= deleteProfesor codigo profesores
                        saveJSON path newprofesores
                        putStrLn "Eliminado con exito"
                        threadDelay 1000000
                        menuBajas

                    "3" -> do
                        putStr "Ingrese sigla de materia: "
                        hFlush stdout
                        sig <- getLine
                        let (sigla:_) = words sig

                        let path = "src/json/Materia.json"
                        materias <- loadJSON path
                        let newmaterias= deleteMateria sigla materias
                        saveJSON path newmaterias
                        putStrLn "Eliminado con exito"
                        threadDelay 1000000
                        menuBajas

                    "4" -> do
                        putStr "Ingrese id de grupo-materia: "
                        hFlush stdout
                        ident <- getLine
                        let (iD:_) = words ident

                        let path = "src/json/GrupoMateria.json"
                        gm <- loadJSON path
                        let newgm = deleteGrupoMateria ident gm
                        saveJSON path newgm
                        putStrLn "Eliminado con exito"
                        threadDelay 1000000
                        menuBajas

                    "5" -> do
                        putStr "Ingrese registro e id de historico: "
                        hFlush stdout
                        regiD <- getLine 
                        let (register:iD:_) = words regiD
                        let path = "src/json/Historico.json"
                        historicos <- loadJSON path
                        let newhistoricos= deleteHistorico register iD historicos
                        saveJSON path newhistoricos
                        putStrLn "Eliminado con exito"
                        threadDelay 1000000
                        menuBajas

                    "6" -> do 
                        menuPrincipal

                    _ -> do 
                        putStrLn "Opcion invalida.\n Reiniciando..."
                        --esta en microsegundos (1000000 ms = 1 s)
                        threadDelay 1000000 
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

             putStr "Escoge una opcion: "
             hFlush stdout
             opcion <- getLine

             case opcion of 
                "1" -> do 
                    clearScreen
                    putStrLn "Presione cualquier tecla para volver al menu"
                    putStr "Cantidad:"
                    alumno <- loadJSON "src/json/Alumno.json"
                    mostrar alumno
                    hFlush stdout
                    boton <- getLine
                    case boton of 
                        _ -> menuTablas

                "2" -> do
                    clearScreen
                    putStrLn "Presione cualquier tecla para volver al menu"
                    putStr "Cantidad:"
                    profesor <- loadJSON "src/json/Profesor.json"
                    mostrar profesor
                    hFlush stdout
                    boton <- getLine
                    case boton of 
                        _ -> menuTablas

                "3" -> do
                    clearScreen
                    putStrLn "Presione cualquier tecla para volver al menu"
                    putStr "Cantidad:"
                    materia <- loadJSON "src/json/Materia.json"
                    mostrar materia
                    hFlush stdout
                    boton <- getLine
                    case boton of 
                        _ -> menuTablas

                "4" -> do
                    clearScreen
                    putStrLn "Presione cualquier tecla para volver al menu"
                    putStr "Cantidad:"
                    gm <- loadJSON "src/json/GrupoMateria.json"
                    mostrar gm
                    hFlush stdout
                    boton <- getLine
                    case boton of 
                        _ -> menuTablas

                "5" -> do
                    clearScreen
                    putStrLn "Presione cualquier tecla para volver al menu"
                    putStr "Cantidad:"
                    historico <- loadJSON "src/json/Historico.json"
                    mostrar historico
                    hFlush stdout
                    boton <- getLine
                    case boton of 
                        _ -> menuTablas


                "6" -> do
                    menuPrincipal

                _ -> do 
                    putStrLn "Opcion invalida. \n Reiniciando..."
                    threadDelay 2000000
                    menuTablas
