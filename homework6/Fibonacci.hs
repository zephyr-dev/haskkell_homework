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

testStreamShow :: [a] -> Stream a
testStreamShow l = Cons (value l) (newStream l)
  where
    value :: [a] -> a
    value l1 = head l1
    newStream :: [a] -> Stream a
    newStream nl = testStreamShow $ tail nl



streamRepeat :: a -> Stream a
streamRepeat v = Cons v (streamRepeat v)


streamMap :: (a -> b) -> Stream a -> Stream b
streamMap f (Cons v s) = Cons (f v) (streamMap f s)


streamFromSeed :: (a -> a) -> a -> Stream a
streamFromSeed f x = Cons x (newStream f x)
  where
    newStream :: (a -> a) -> a -> Stream a
    newStream d e = streamFromSeed d (d e)



nats :: Stream Integer
nats = streamFromSeed (+1) 0


ruler :: Stream Integer
ruler = undefined
