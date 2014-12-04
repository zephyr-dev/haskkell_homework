
{- localMaxes :: [Int] -> [Int] -}
{- localMaxes xs = map fst $ filter isLocalMax $ zip xs [0..] -}
  {- where -}
    {- isLocalMax :: (Int, Int) -> Bool -}
    {- isLocalMax (x, i)   | i == (length xs)-1  = False -}
                        {- | i == 0              = False -}
                        {- | otherwise           = x > xs!!(i+1) && x > xs!!(i-1) -}





{- localMaxes :: [Int] -> [Int] -}

{- localMaxes xs@(x:y:z:_) | y > x && y > z  = y:(localMaxes $ tail xs) -}
                        {- | otherwise       = localMaxes $ tail xs -}
{- localMaxes _ = [] -}

{- import qualified Data.Map as M  -}
{- import  Data.Foldable  -}
{- import  Data.Monoid  -}


{- data Histogram = Histogram Occurences -}
{- type Occurences = M.Map Int Int -}

{- [> type Occurences = Occurences { <] -}
    {- [> number :: Int <] -}
  {- [> , count  :: Int <] -}
  {- [> } <] -}


{- instance Monoid Histogram where -}
  {- mempty = Histogram mempty -- map (\x -> Occurences x 0) [1..9] -}
  {- (Histogram x) `mappend` (Histogram y) = x `mappend` y -- Histogram $ foldr (\e acc ->   ) [] $ x ++ y -}



{- histogram :: [Int] -> String -}
{- histogram = render . countup -}

{- countup :: [Int] -> Histogram -}
{- countup = fold . map (\x -> Histogram $ M.singleton x 1) -}

{- render = show -}







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


