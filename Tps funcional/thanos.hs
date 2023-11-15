data Personaje = Personaje {nombre :: String, edad :: Int, energia :: Float, planeta :: String, habilidades :: [String]} deriving (Show)

data Guantelete = Guantelete {material :: String, gemas :: Int} deriving (Show)

data Universo = Universo {habitantes :: [Personaje]} deriving (Show)

completo :: Guantelete -> Bool
completo g
    |(gemas g == 6 && material g == "oro") = True
    |otherwise = False

chasquidoUniverso :: Guantelete -> Universo -> Universo -- Función para hacer el chasquido en un universo
chasquidoUniverso guante univ
    |(completo guante == True) = chasquido guante univ
    |otherwise = univ -- No se pudo hacer el chasquido

chasquido :: Guantelete -> Universo -> Universo -- Función para eliminar la mitad de los habitantes de un universo
chasquido guante univ = Universo {habitantes = (drop (div (length (habitantes univ)) 2) (reverse (habitantes univ)))}


main :: IO ()
main = do
    let guantelete = Guantelete {material = "oro", gemas = 6}
    let universoInicial = Universo {
        habitantes = [Personaje "Personaje1" 30 100 "Planeta1" ["Habilidad1", "Habilidad2"],
                      Personaje "Personaje2" 25 90 "Planeta2" ["Habilidad3", "Habilidad4"],
                      Personaje "Personaje3" 40 80 "Planeta3" ["Habilidad5", "Habilidad6"]]
    }
    let universoDespuesChasquido = chasquidoUniverso guantelete universoInicial
    print universoDespuesChasquido
