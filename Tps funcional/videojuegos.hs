
data Genero = Accion | Lucha | Singenero deriving(Show, Eq)
data VideoJuego = VideoJuego {nombrev:: String, categoria:: Genero, precio:: Float} deriving (Show,Eq)
data Jugador = Jugador {nombre:: String, edad:: Int, presupuesto:: Float,gusto::Genero} deriving (Show,Eq)

type Inventario = [VideoJuego]


comprarVJ :: Jugador -> VideoJuego -> Inventario -> Jugador
comprarVJ j v i | (elem v i)==True && (presupuesto j) >= (precio v) = Jugador (nombre j) (edad j) ((presupuesto j)-(precio v)) (gusto j)
                |otherwise = j


totalVentas :: [VideoJuego] -> Float
totalVentas [] = 0
totalVentas (x:xs) = (totalVentas xs) + precio x

recomendarJuegos :: Jugador -> Inventario -> [VideoJuego]
recomendarJuegos j [] = []
recomendarJuegos j (x:xs) | (presupuesto j) >= (precio x) && (gusto j) == (categoria x) =  recomendarJuegos j xs ++ [x]
                          | otherwise = recomendarJuegos j xs



