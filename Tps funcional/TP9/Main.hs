import Data.Char
import Data.List
main = do
  putStrLn "TP9"

-- lista de pares
lPares :: [Int] -> [Int]
lPares [] = []
lPares (x:xs) 
    | even x = x : lPares xs
    | otherwise = lPares xs 
-- copias de el mismo num
reemplazarPorCopias :: [Int] -> [Int]
reemplazarPorCopias [] = []  
reemplazarPorCopias (x:xs) = replicarElemento x x ++ reemplazarPorCopias xs
  where
    replicarElemento :: Int -> Int -> [Int]
    replicarElemento n elemento
        | n <= 0 = []  
        | otherwise = elemento : replicarElemento (n - 1) elemento

--ternas pitagoricas
pitagoricamente :: Int -> [(Int, Int, Int)]
pitagoricamente n = [(x,y,z) | x<-[1..n],y<-[1..n],z<-[1..n], (x^2+y^2)==z^2]

--numeros perfectos
divisores :: Int -> [Int]
divisores n=[x | x <- [1..n-1], n `mod` x == 0]
sumasl :: [Int] -> Int
sumasl [] = 0
sumasl (x:xs) = sumasl xs + x
numeroPerfecto :: Int -> Bool
numeroPerfecto n 
    |n==((sumasl.divisores)(n)) = True
    |otherwise = False
numerosPL :: Int -> [Int]
numerosPL x = [n | n<-[1..x], numeroPerfecto n]

-- lista de palabras ps que tienen longitud lon y poseen la letra l en la posición pos 
position :: Char -> Int -> String -> Bool
position x _ [] = False
position x n (y:xs)
    |x == y && n == 0 = True
    |x /= y && n == 0 = False
    |otherwise = position x (n-1) xs

buscaCrucigrama :: Char -> Int -> Int -> [String] -> [String]
buscaCrucigrama l pos lon ps = [x | x <- ps, length x == lon, position l pos x == True]

--eratostenes

criba :: [Int] -> [Int]
criba [] = []
criba (p:xs) = p : criba [x | x <- xs, x `mod` p > 0] 

cribaEratostenes :: Int -> [Int]
cribaEratostenes n = criba [2..n]


--repite funcion
dosVeces :: (a->a)->a->a
dosVeces f x = f (f x)


--números se deben escribir con palabra completa
casos ::  Char -> String
casos n
 | n == '1' = "uno"
 | n == '2' = "dos"
 | n == '3' = "tres"
 | n == '4' = "cuatro"
 | n == '5' = "cinco"
 | n == '6' = "seis"
 | n == '7' = "siete"
 | n == '8' = "ocho"
 | n == '9' = "nueve"
 | n == '0' = "cero"

fullWords :: Int -> [String]
fullWords n = map casos (show n)