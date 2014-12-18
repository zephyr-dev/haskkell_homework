xor :: [Bool] -> Bool
xor l =  (foldr countTrues 0 l) `mod` 2 /= 0
  where
    countTrues :: (Bool -> Int -> Int)
    countTrues True i = i + 1
    countTrues _ i = i

map' :: (a -> b) -> [a] -> [b]
map' f l
  | length l == 1 = f $ head l
  | length l > 1 = (map' $ (tail l)) ++ [(f $ head l)]
