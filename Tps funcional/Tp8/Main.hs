main = do
  putStrLn "Tp8"
--------------------------Ejercicio 1---------------------------------
-- vol esfera
volumen :: Float -> Float 
volumen radio = 4/3 * pi * (radio^3) 

-- aumentar una tripla
incrementaTupla :: (Int ,Int ,Int ) -> (Int ,Int ,Int )
incrementaTupla (a, b, c) = (a+1,b+1,c+1)

-- elevar a el cuadrado
cuadrado :: Int -> Int 
cuadrado a = a ^ 2

-- elevar a la 4 con composicion de cuadrado
alaCuatro a = (cuadrado.cuadrado)(a)

-- maximo de 3 numeros usando max
max3 :: Int -> Int -> Int -> Int
max3 a b c = max a (max b c)

-- calculo de el cuadrante 
cuadrante :: (Float, Float) -> Int
cuadrante (x,y) | x > 0 && y > 0 = 1
 | x > 0 && y < 0 = 2
 | x < 0 && y < 0 = 3
 | otherwise = 4

-- tres elementos diferentes
dif3 :: (Eq (a)) => a -> a -> a-> Bool
dif3 x y z = x /= y && y /= z && x /= z

-- iguales usando otra funcion
igualesTres :: Float -> Float -> Float -> Bool
igualesTres x y z = x == y && y == z

igualesCuatro :: Float -> Float -> Float -> Float -> Bool
igualesCuatro v x y z = igualesTres v y z && igualesTres x y z && igualesTres v x z

-- raices de eq de segundo grado 
raices :: Float -> Float -> Float -> (Float, Float)
raices a b c = ((-b + sqrt(b^2 - 4*a*c)) / (2*a), (-b - sqrt(b^2 - 4*a*c)) / (2*a))

--Determinar si un año es bisiesto
añoBisiesto :: Int -> Bool
añoBisiesto x = x `mod` 4 == 0 -- `` para indicar el orden de los parametros 

-- XOR
xor :: Bool -> Bool -> Bool
xor p q = not(p == q)

--------------------------Ejercicio 2---------------------------------

--divisores x es la lista de los divisores de x

divisores :: Int -> [Int]
divisores n=[x | x <- [1..n], n `mod` x == 0]

-- devuelve la cantidad de horas, minutos y segundos equivalente.

-- con horas 
horas :: Int -> [Int]
horas n = [n] ++ [n*60] ++ [n*60*60]

-- con segundos
sec :: Int -> (Int,Int,Int)
sec  x = (div x 3600, div (x `rem` 3600) 60, x `rem` 60)

--Lista de primos

primo:: Int -> Bool 
primo x
    | ((length.divisores)(x) == 2) = True
    | ((length.divisores)(x) == 1) = True
    | otherwise = False

l_primos :: Int -> [Int]
l_primos n = [x | x <- [1..n], primo x ]

--n primeros elementos de l
tomar :: Int -> [a] -> [a]
tomar 0 _ = []
tomar n (x:xs) = x : tomar (n-1) xs

--tomar y verificar una condicion 
tomarMientras :: (a -> Bool) -> [a] -> [a]
tomarMientras p [] = []
tomarMientras p (x:xs)
        |p x = x : tomarMientras p xs -- evaluamos la funcion p con x 
        |otherwise = []
        
--index 
nIndex :: Int -> [a] -> a
nIndex 0 (x:xs) = x
nIndex n (x:xs) = nIndex (n-1) xs
nIndex _ _ = error "Índice fuera de rango"

--definir un nuevo tipo de datos para numeros complejos
data Complex = Complex {real :: Float, i :: Float} deriving(Show)
suma :: Complex -> Complex -> Complex
suma (Complex a b) (Complex c d) = Complex (a + c) (b + d)

--colores 
data Color = Azul | Amarillo | Rojo | Verde | Violeta | Naranja | Blanco | Negro | Gris | Marron deriving(Show,Eq)

mezcla :: Color -> Color -> Color
mezcla Azul Rojo = Violeta
mezcla x y = error "No se puede mezclar estos colores"

--número de ocurrencias del elemento en la lista
ocurrencias :: Eq a => a -> [a] -> Int
ocurrencias x [] = 0
ocurrencias x (y:ys)
        |x == y = 1 + ocurrencias x ys
        |x /= y = ocurrencias x ys

--sucesor de toda la lista

mapToSuccesor :: [Int] -> [Int]
mapToSuccesor [] = []
mapToSuccesor (x:xs) = (x+1) : mapToSuccesor xs

--reverso de una lista

reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]

--------------------------Ejercicio 3---------------------------------

-- suma los elementos de los pares
sumaPar :: [(Int, Int)] -> [Int]
sumaPar [] = []  
sumaPar ((x, y):resto) = (x + y) : sumaPar resto

--devuelve una lista donde el elemento n es el máximo entre
--el elemento n de la lista 1 y de la lista 2.

zipMaximos :: [Int] -> [Int] -> [Int]
zipMaximos [] [] = []
zipMaximos (x:xs) (y:ys) = (max x y) : zipMaximos xs ys


--evuelve el segmento más largo de la lista con las personas que nacieron antes dicha fecha
data Date = Date {day :: Int,  month :: Int, year :: Int} deriving(Show)
data Persona = Persona {nombre :: String, apellido :: String, fecha :: Date} deriving(Show) 

beforeDate :: Date -> Date -> Bool
beforeDate (Date d1 m1 y1) (Date d2 m2 y2)
        |y1 < y2 = True
        |y1 == y2 && m1 < m2 = True
        |y1 == y2 && m1 == m2 && d1 < d2 = True
        |otherwise = False

takePersonas :: [Persona] -> Date -> [Persona]
takePersonas [] _ = []
takePersonas (p1:ps) d
        |beforeDate (fecha p1) d = p1 : takePersonas ps d
        |otherwise = []


data Pizza = Pizza {ingredientes :: [String],  precio :: Float} deriving(Show)

dropPrecio :: [Pizza] -> [Pizza]
dropPrecio  = takeWhile (\p -> precio p < 200)


--------------------------Ejercicio 4---------------------------------
--suma de una lsita
sumasl :: [Int] -> Int
sumasl [] = 0
sumasl (x:xs) = sumasl xs + x

--encuentra un true
alguno :: [Bool] -> Bool
alguno []= False
alguno (x:xs) 
    | x==True = True
    | x==False = alguno(xs)

--incrementar 
incr2 :: Num a => [a] -> [a]
incr2 x = map (+1) x 

--devuelve las long de las listas
long :: [a] -> Int
long [] = 0
long (x:xs) = 1 + long xs

lenL :: [[a]] -> [Int]
lenL [] = []
lenL ((x:xs):ys) = [long (x:xs)] ++ lenL ys 
--otra forma
longitudes :: [[a]] -> [Int]
longitudes [] = []
longitudes (x:xs) = long x : longitudes xs

masDe :: [[a]] -> Int -> [[a]]
masDe [] _ = []
masDe (x:xs) n
        |long x > n = x : masDe xs n
        |otherwise = masDe xs n

--definición de un operador que aplica una lista de funciones a un entero y devuelve la lista de enteros de los resultados

operador:: [Int -> Int] -> Int -> [Int]
operador [] _ = []
operador (x:xs) a = x a : operador xs a

-- encuentra una sublista 

--findSL :: [[Int]] -> [Int] -> a
--findSL [] _ = -1
--findSl (x:xs) y
--    | x==y = n
--    | x/=y = (n+1) :  findSL xs y







