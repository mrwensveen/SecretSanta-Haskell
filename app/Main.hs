module Main (main) where

import Lib
import System.Random

main :: IO ()
main = do
  gen <- getStdGen
  let users = ["Alice", "Bob", "Zeke", "Mariah", "Jim", "Sue", "Cathy", "Tom"]
      (gen1, gen2) = split gen
      shuffled = shuffle users gen1
      chunks = randomChunks shuffled gen2
  print chunks
  print $ concatMap (\xs -> zipWith Secret (last xs : xs) xs) chunks

data Secret = Secret {giver :: String, reciever :: String} deriving (Show)
