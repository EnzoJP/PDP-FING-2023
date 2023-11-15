main = do
    putStrLn "Pinky y Cerebro"

-- Ir guardando los estados de los objetos con let (poniendo let antes en todo lo que hagamos)
-- 1)
data Animal = Animal {ci :: Int, especie :: String, capacidades :: [String]} deriving(Show)

pinky = Animal {ci = 17, especie = "raton", capacidades = ["destruenglonir el mundo", "hacer planes desalmados"]}
cerebro = Animal {ci= 200, especie ="raton", capacidades = ["conquistar el mundo", "hacer planes desalmados"]}
marti = Animal {ci = 50 , especie = "cebra", capacidades =["sobrevivir"]}
ratonPere = Animal {ci = 120, especie = "raton", capacidades=["dar plata"]}
trompita = Animal {ci = 98, especie = "elefante", capacidades=["pisar fuerte"]}

-- 2)
inteligenciaSuperior :: Animal -> Int -> Animal
inteligenciaSuperior a n = Animal {ci = ci a + n, especie = especie a, capacidades = capacidades a}

pinkificar :: Animal -> Animal
pinkificar a = Animal {ci = ci a, especie = especie a, capacidades = []}

superpoderes :: Animal -> Animal
superpoderes a  
  |(ci a >100) && (especie a) == "raton" = Animal {ci = ci a, especie = especie a, capacidades = capacidades a ++ ["hablar"]}
  |(especie a == "elefante") = Animal {ci = ci a, especie = especie a, capacidades = capacidades a ++ ["no tenerle miedo a los ratones"]}
  |otherwise = Animal {ci = ci a, especie = especie a, capacidades = capacidades a}

--3)

antropomorfico :: Animal -> Bool
antropomorfico a
  |(((ci a) > 60) && (elem "hablar" (capacidades a))) = True
  |otherwise = False

--4)


experimentoExitosoAux :: (Animal -> Bool) -> Animal -> Bool
experimentoExitosoAux cond a = cond a

experimentoExitoso :: (Animal -> Animal) -> (Animal -> Bool) -> Animal -> Bool
experimentoExitoso expe cond a  = experimentoExitosoAux cond (expe a)

--experimentoss :: [(Animal -> Animal)] -> (Animal -> Bool) -> Animal -> Bool
--experimentoss [] cond a = True
--experimentoss (x:xs) cond a 
--  | (experimentoExitoso x cond a ==True) = experimentoss xs cond a
--  | (experimentoExitoso x cond a ==False) = False

------------------------------------------------
--otra forma

--type Transformacion = Animal -> Animal
--type Transformacion2 = Animal -> Int -> Animal

--data Experimento = Experimento {transformacion1 :: Transformacion, transformacion2 :: Transformacion2, transformacion3 :: Transformacion, criterioExito :: Animal -> Bool} deriving(Show)

--experimentoRaton = Experimento {transformacion1 = pinkificar, transformacion2 = inteligenciaSuperior 10, transformacion3 = superpoderes, criterioExito = antropomorfico}

--experimentoExitoso :: Experimento -> Animal -> Bool
--experimentoExitoso 
