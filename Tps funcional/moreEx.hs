
-- ejercicios recuperatorio de 2022

extract :: Eq a => [a] -> Int -> Int -> [a]
extract x i k = extractAux (reverse (drop (i-1) x)) k

extractAux :: [a] -> Int -> [a]
extractAux x k = reverse (drop k x)

digitosInv :: Int -> [Int]
digitosInv n = reverse (toint (show n))

toint :: String -> [Int]
toint [] = []
toint (x:xs) = [(read [x] :: Int)]   ++ toint xs -- read trasnforma lo de la cadena a el otro tipo especificado

doblePosImpar :: [Int] -> [Int]
doblePosImpar l = doblePosImparAux l l

doblePosImparAux :: [Int] -> [Int] -> [Int]
doblePosImparAux [] l = []
doblePosImparAux (x:xs) l | mod (posInlist x l) 2 /= 0 = [x*2] ++ doblePosImparAux xs l
                          | otherwise =  [x] ++ doblePosImparAux xs l

posInlist :: (Eq a) => a -> [a] -> Int
posInlist x [] = 0
posInlist x l = posAux x 0 l

posAux :: (Eq a) => a -> Int -> [a] -> Int
posAux x _ [] = -1
posAux x long (y:ys) | x==y = long
                     | otherwise = posAux x (long+1) ys

getLastDigit :: Integer -> Integer
getLastDigit n = n `mod` 10

sumaDigitos :: [Int] -> Int
sumaDigitos [] = 0
sumaDigitos (x:xs)
    |x > 9 = (x `div` 10) + (x `mod` 10) + sumaDigitos xs
    |otherwise = x + sumaDigitos xs

luhn :: Int -> Bool
luhn n
    |ultimoDigito (sumaDigitos (doblePosImpar (digitosInv n))) == 0 = True
    |otherwise = False
