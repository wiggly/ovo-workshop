module Main where

-- | This is a function that returns an infinite list of natural numbers...
infiniteList :: [Int]
infiniteList = [1..]

complexCalc :: Bool -> Bool -> Int -> Int
complexCalc negative squared start =
  let negativeResult = (-start)
      positiveResult = start
      squaredResult = start * start
      negativeSquaredResult = (-squaredResult)
  in if negative
     then if squared
          then negativeSquaredResult
          else negativeResult
     else if squared
          then squaredResult
          else positiveResult

complexCalc' :: Bool -> Bool -> Int -> Int
complexCalc' True True start = - (start * start)
complexCalc' False True start = (start * start)
complexCalc' True False start = -start
complexCalc' False False start = start

main :: IO ()
main = do
  let singleNumber = 42 :: Integer
      someNumbers = take 40 infiniteList
      allNumbers = infiniteList

  putStrLn ("complexCalc  True False 23: " ++ (show (complexCalc True False 23)))
  putStrLn ("complexCalc' True False 23: " ++ (show (complexCalc' True False 23)))

  putStrLn ("single number: " ++ (show singleNumber))
  putStrLn ("some numbers: " ++ (show someNumbers))
--  putStrLn ("ALL THE NUMEBRS: " ++ (show allNumbers))
