{-# OPTIONS_GHC -Wall #-}

module Golf where

skips :: [a] -> [[a]]
skips l = map (filteredString l) [1..length l]
  where
    filteredString :: [a] -> Int -> [a]
    filteredString s n = map fst $ filter ( modIsZero . snd ) $ zip s $ cycle [1..length s] 
      where
        modIsZero i = i `mod` n == 0

localMaxima :: [Integer] -> [Integer]
localMaxima = undefined
{- "ABCD" -> ["ABCD", "BD", "C", "D"] -}


{- [f s 1, f s 2, f s 3, f s 4] -}


{- map (f s) [1..length s] -}


{- f s n = map fst $ filter (\(c,i) -> i % n == 0 ) $ zip s $ cycle [1..length s] -}

{- h xs = map (*2) $ filter odd xs -}


