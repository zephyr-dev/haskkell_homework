import Data.Monoid (Product(..))
import Data.Foldable (fold)

fun1 :: [Integer] -> Integer
fun1 [] = 1
fun1 (x:xs)
    | even x = (x - 2) * fun1 xs
    | otherwise = fun1 xs


fun1' :: [Integer] -> Integer
fun1' = foldl (\a e -> a * (e - 2)) 1 . filter even

fun1'' :: [Integer] -> Integer
fun1'' = getProduct . fold . map (Product . (subtract 2)) . filter even

fun2 :: Integer -> Integer
fun2 1 = 0
fun2 n | even n = n + fun2 (n `div` 2)
      | otherwise = fun2 (3 * n + 1)


{- fun2 :: Integer -> Integer -}
{- fun2 1 = 0 -}
{- fun2 n | even n = n + fun2 $ f n -}
      {- | otherwise = fun2 $ g n -}
  {- where -}
    {- f n = n `div` 2 -}
    {- g n = 3 * n + 1 -}

fun2' :: Integer -> Integer
fun2' i = sum $ filter even $ takeWhile (/= 1) $ iterate createList i
  where
    createList :: Integer -> Integer
    createList n  | even n =  n `div` 2
                  | otherwise =  3 * n + 1

