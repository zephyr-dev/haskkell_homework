xor :: [Bool] -> Bool
xor l =  (foldr countTrues 0 l) `mod` 2 /= 0
  where
    countTrues :: (Bool -> Int -> Int)
    countTrues True i = i + 1
    countTrues _ i = i

{- foldr :: (a -> x -> x) -> x -> [a] -> x -}
{- foldr' :: (a -> [b] -> [b]) -> [b] -> [a] -> [b] -}

map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x acc -> (f x):acc ) []


{- foldr :: (a -> b -> b) -> b -> [a] -> b -}


myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f z xs = foldr (flip f) z (reverse xs)
