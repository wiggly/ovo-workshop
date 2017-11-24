module Main where

import Data

-- | Main function - returns an IO action that evaluates to Unit
main :: IO ()
main = do
  let someList = mkList "ferret"
      largerList = prependList "wolverine" someList
      biggestList = prependList "stoat" largerList
      dangerous = tailList . tailList . tailList
  -- | different sizes of list
  putStrLn (show someList)
  putStrLn (show largerList)
  putStrLn (show biggestList)

  -- | Use our custom stringification
  putStrLn ""
  putStrLn ("stringList:  " ++ (stringList biggestList))

  -- | Figure out how long they are
  putStrLn ""
  putStrLn ("string length:  " ++ (stringList (mapList length biggestList)))

  -- | Use our functor instance to leverage existing functions
  putStrLn ""
  putStrLn ("string length:  " ++ (stringList (fmap length biggestList)))

  -- | Our list can cause a pure program to crash and burn...
  putStrLn ""
  putStrLn "Danger ahead"
  putStrLn (show (dangerous largerList))
