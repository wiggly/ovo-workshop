module Main where

-- | sum a list of things that are Numbers...
sumList :: Num a => [a] -> a
sumList [] = 0
sumList (x:xs) = x + (sumList xs)

-- | print out a lot of strings...
printList :: [String] -> IO ()
printList [] = return ()
printList (x:xs) = do
  putStrLn x
  printList xs

-- | Main function - returns an IO action that evaluates to Unit
main :: IO ()
main = do
  let numbers = [1, 1, 2, 3, 5, 8] :: [Int]
      smallSum = sumList numbers
      strings = ["badger", "ferret", "weasel", "stoat", "mink", "marten"]
      printed = printList strings
      infiniteSum = sumList [0..]
  putStrLn ("numbers: " ++ (show numbers))
  putStrLn ("sum: " ++ (show smallSum))
  putStrLn ""
  putStrLn ("Strings: " ++ (show strings))
  printed
  putStrLn ("infinite sum: " ++ (show infiniteSum))
