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