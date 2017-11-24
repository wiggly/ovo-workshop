module Main where

squared :: Int -> Int
squared a = a * a

doubled :: Int -> Int
doubled a = a + a

doublySquared :: Int -> Int
doublySquared n = doubled (squared n)

-- | composition takes two functions and creates a new function
-- | that is the same as applying them both in sequence
alsoDoublySquared :: Int -> Int
alsoDoublySquared = doubled . squared

-- | You can keep on composing as long as the functions can be fed into one another
thirdElement :: [a] -> a
thirdElement = head . tail . tail

-- | Main function - returns an IO action that evaluates to Unit
main :: IO ()
main = do
  let answer = 42
      question = doublySquared answer
      sameQuestion = alsoDoublySquared answer
      someList = [ "first", "second", "third", "fourth", "fifth", "sixth" ]
  putStrLn ("answer: " ++ (show answer))
  putStrLn ("question: " ++ (show question))
  putStrLn ("sameQuestion: " ++ (show sameQuestion))
  putStrLn ("element: " ++ (thirdElement someList))
