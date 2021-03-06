{-# LANGUAGE FlexibleInstances #-}
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
  show s = show $ take 20 (streamToList s)

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
ruler = interleaveStreams streamFromOdds streamFromEvens 
  where 
    interleaveStreams :: Stream a -> Stream a -> Stream a
    interleaveStreams (Cons e1 s1) (Cons e2 s2) = Cons e1 $ Cons e2 $ interleaveStreams s1 s2 
streamFromOdds :: Stream Integer
streamFromOdds  = streamRepeat 0
streamFromEvens :: Stream Integer
streamFromEvens = streamMap determineRule natEvens 

natEvens :: Stream Integer
natEvens = streamFromSeed (+2) 2
determineRule :: Integer -> Integer
determineRule num = go num (floor $ logBase 2 $ fromIntegral num)
  where
    go num i 
      | num `mod` (2 ^ i) == 0 = i
      | otherwise = go num (i-1)


instance Num (Stream Integer) where
  {- fromInteger :: Integer -> Stream Integer -}
  fromInteger n = Cons n $ streamRepeat 0
  negate = streamMap negate
  (+) = streamZip (+) where
    streamZip :: (a -> b -> c) -> Stream a -> Stream b -> Stream c
    streamZip f (Cons v1 s1) (Cons v2 s2) = Cons (f v1  v2) (streamZip f s1 s2)
  
