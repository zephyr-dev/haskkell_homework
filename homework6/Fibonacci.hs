fib :: Integer -> Integer
fib 1 = 0
fib 2 = 1
fib n = fib(n-1) + fib(n-2)


fibs1 :: [Integer]
fibs1 = foldr (\x y -> (fib x):y) [] [1..]

{- fibs2 :: [Integer] -}
{- fibs2 = foldr buildFibs [] [0..]  -}
  {- where -}
{- buildFibs :: a -> [Integer] -> [Integer] -}
{- buildFibs _ []        = [0] -}
{- buildFibs _ l@(x:xs)  -}
  {- | length l == 1     = [0,1] -}
{- buildFibs _ l@(x:s:y) = l ++ [(s + y)] -}

data Stream a = Cons a (Stream a)

instance Show a => Show (Stream a) where
  show s = show $ take 10 (streamToList s)

streamToList :: Stream b -> [b]
streamToList (Cons v1 s) = [v1] ++ (streamToList s)
