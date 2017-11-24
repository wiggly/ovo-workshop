module Main where

import Data.List (unfoldr)

-- | this number was randomly chosen
randomNumber :: Int
randomNumber = 23

-- | this PRNG needs a seed every time you call it. unlike rand in C
-- | this cannot access any behind-the-scenes state that was set up for us.
generateRandom :: Integer -> (Integer, Integer)
generateRandom seed = let newSeed = 7 * seed `mod` 101
                          newRand = ((newSeed - 1) `mod` 10) + 1
                      in (newSeed, newRand)

-- | Generate an infinite list of random numbers given a starting seed
randomList :: Integer -> [Integer]
randomList seed = let (newSeed, rand) = generateRandom seed
                  in rand : (randomList' newSeed)

-- | Generate an infinite list of random numbers given a starting seed using unfoldr
randomList' :: Integer -> [Integer]
randomList' seed = unfoldr go seed
  where go s = let (newSeed, rand) = generateRandom s
                  in Just (rand, newSeed)

-- | Main function - returns an IO action that evaluates to Unit
main :: IO ()
main = do
  let seed = 41418321833
      (seed2,rand1) = generateRandom seed
      (seed3,rand2) = generateRandom seed2
      (seed4,rand3) = generateRandom seed3
      (seed5,rand4) = generateRandom seed4
      (seed6,rand5) = generateRandom seed5
      (seed7,rand6) = generateRandom seed6
      someRandoms = take 10 (randomList seed)
  putStrLn ("rand1: " ++ (show rand1))
  putStrLn ("rand2: " ++ (show rand2))
  putStrLn ("rand3: " ++ (show rand3))
  putStrLn ("rand4: " ++ (show rand4))
  putStrLn ("rand5: " ++ (show rand5))
  putStrLn ("rand6: " ++ (show rand6))
  putStrLn ("random list: " ++ (show someRandoms))
