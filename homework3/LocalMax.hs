
{- localMaxes :: [Int] -> [Int] -}
{- localMaxes xs@(x:y:z:_) | y > x && y > z  = y:(localMaxes $ tail xs) -}
                        {- | otherwise       = localMaxes $ tail xs -}
{- localMaxes _ = [] -}

import qualified Data.Map as M 
import  Data.Foldable 
import  Data.Monoid 


data Histogram = Histogram Occurences deriving Show
type Occurences = M.Map Int Int


{- class Monoid a where -}
  {- mempty :: a -}
  {- mappend :: a -> a -> a -}

{- class Show a where -}
  {- show :: a -> String -}

{- class Eq a where -}
  {- (==), (/=) :: a -> a -> Bool -}
  {- x == y = not $ x /= y -}
  {- x /= y = not $ x == y -}


{- class (Eq a) => Ord a where -}
  {- (>) :: Eq a => a -> a -> Bool -}

instance  Histogram where
  mempty = Histogram $ M.fromList $ zip [1..9] $ repeat 0 -- map (\x -> Occurences x 0) [1..9]
  (Histogram x) `mappend` (Histogram y) = Histogram $ M.unionWith (+) x y



histogram :: [Int] -> String
histogram = render . countup

countup :: [Int] -> Histogram
countup = fold . map (\x -> Histogram $ M.singleton x 1)

render = show







{- [> Histogram (generateOccurences l  ++ generateZeroOccurences ([0..9] - l)) <] -}


{- [> generateOccurences [1,2,3,1]   =>   [Occurence 1 2, Occurence 2, 1] <] -}

{- [> foldr :: (a -> b -> b) -> b -> [a] -> b <] -}

{- [> foldr :: (a -> a -> a) -> a -> [a] -> a <] -}


{- [> render :: Histogram -> String <] -}





{- [> mconcat [x, y, z]   <] -}

{- [> e <> x = x <] -}
{- [> x <> e = x <] -}

{- [> x <> y = z <] -}
{- [> y <> x = q <] -}


{- [> "as" "s"  "ass" <] -}
{- [> "s" "as"  "sas" <] -}


