--ejercicio de laboratorio

data Participante = Participante  {nombre :: String , curso :: String, habilidad:: Habilidad} deriving (Show,Eq)
type Habilidad = (Float,Float)
type Obstaculo = (Tiro -> Bool, Tiro -> Tiro)

data Tiro = Tiro {velocidad :: Float, precision :: Float, altura :: Float} deriving (Show)

tunel = ((\(_,p,a) -> p<90 && a==0) , (\(v,_,a)->(v*2,100,0)))

--Ej1

putter :: Habilidad -> Tiro
putter (fuerza, prec) = (Tiro 10 (prec * 2) 0)

madera :: Habilidad -> Tiro
madera (fuerza, prec) = (Tiro 100 (prec / 2) 5)

hierro :: Int -> Habilidad -> Tiro
hierro n (fuerza, prec) = (Tiro (fuerza * fromIntegral (n)) (prec / fromIntegral(n)) (fromIntegral (n^2)))
-- fromIntegral ya que operamos con dos tipos de numeros distintos

--Ej2

golpe :: Participante -> (Habilidad -> Tiro) -> Tiro
golpe part f = (f (habilidad part))

palos :: [Habilidad -> Tiro]
palos = (putter : madera : map hierro [1..10])


puedeSuperarConAlgunPalo :: Participante -> Obstaculo -> Bool
puedeSuperarConAlgunPalo alumno (funcion, nuevoTiro) = puedeSuperarAux alumno palos funcion

puedeSuperarAux :: Participante -> [(Habilidad -> Tiro)] -> (Tiro -> Bool) -> Bool
puedeSuperarAux _ [] _ = False
puedeSuperarAux alumno (h:t) func | func (golpe alumno h) == True = True
                                  | otherwise = puedeSuperarAux alumno t func

supaux :: Participante -> [Obstaculo] -> Bool
supaux  x [] = True
supaux  x (y:ys) | puedeSuperarConAlgunPalo x y == True = supaux x ys
                 | otherwise = False

superanTodo :: [Participante] -> [Obstaculo] -> [Participante]
superanTodo [] _ = []
superanTodo (x:xs) (y:ys) | supaux x (y:ys)== True = superanTodo xs (y:ys) ++ [x]
                          | supaux x (y:ys)== False = superanTodo xs (y:ys)


--alumnoGanador :: [Participante] -> [[Obstaculo]] -> String
--max (posc ())


alumnoGanador2 :: [Participante] -> [[Obstaculo]] -> [Int]
alumnoGanador2 []  _ =[]
alumnoGanador2  (x:xs) l = alumnoGanador2 xs l ++ [puntaje x l 0]


puntaje :: Participante -> [[Obstaculo]] -> Int -> Int
puntaje x (y:ys) n| superanTodo [x] y == [x] = n +10
                  | superanTodo [x] y == [] = n + 0




--alumnoGanador :: [Participante] -> [[Obstaculo]] -> String
--alumnoGanador (h:t) obst = mayor (h:t) obst h 0

--mayor :: [Participante] -> [[Obstaculo]] -> Participante -> Int -> String
--mayor [] obst alumno puntaje = nombre alumno
--mayor (h:t) obst alumno puntaje | compite h obst > puntaje = mayor t obst h (compite h obst)
   --                        | otherwise = mayor t obst alumno puntaje

--compite :: Participante -> [[Obstaculo]] -> Int
--compite _ [] = 0
--compite alumno (h:t) = puedeSuperar alumno h + compite alumno t








