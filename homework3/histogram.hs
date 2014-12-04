module Histogram where

import Data.List
import GHC.Exts


histogram :: [Int] -> String
histogram x = outPutString . sortWith fst . fillInEmpty $ countOccurences x
  where
    countOccurences :: [Int] -> [(Int, Int)]
    countOccurences l = map (\arr -> (head arr, length arr) ) $ group $ sort l
    fillInEmpty :: [(Int, Int)] -> [(Int, Int)]
    fillInEmpty lc = lc ++(map addEmpty $ filter (not . (`elem` x) ) [0..9] )
      where
        addEmpty :: Int -> (Int, Int)
        addEmpty i = (i, 0)

    outPutString l =  (unlines $ reverse $ map (\le -> outputLine le l) [1..listMax]) ++ "==========\n0123456789\n"
      where
        listMax = maximum $ map snd $ countOccurences x
        outputLine :: Int -> [(Int, Int)] -> String
        outputLine le = map $ drawStars le
          where 
            drawStars  :: Int -> (Int,Int) -> Char
            drawStars le (_, c) 
              | c < le = ' '
              | otherwise = '*'
