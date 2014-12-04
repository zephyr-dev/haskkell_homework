module LogAnalysis where
  import Log
  parseMessage :: String -> LogMessage
  parseMessage l
    | head l == 'E' = LogMessage (errorCode l) (errorTimeStamp l) (message l)
    | otherwise = LogMessage (errorType l) (timestamp l) (message l)
    where 
      errorCode :: String -> MessageType
      errorCode l = Error $ extractInt l 1

      errorTimeStamp :: String -> Int
      errorTimeStamp l = extractInt l 2 

      extractInt :: String -> Int -> Int
      extractInt l i = read $ (words l)!!i

      message :: String -> String
      message l = last $ words l

      timestamp :: String -> Int
      timestamp l = read $ head $ tail $ reverse l 

      errorType :: String -> MessageType
      errorType = undefined
      {- errorType l = case errorChar of  -}
                    {- 'I' -> Info -}
                    {- 'W' -> Warning -}
                {- where errorChar = head l -}
