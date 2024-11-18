module Main (main) where

import Lib
import System.Random

main :: IO ()
main = do
  gen <- getStdGen
  -- print (randomRExcept (2, 4) [3] gen)
  let users = ["Alice", "Bob", "Zeke", "Mariah", "Jim", "Sue", "Cathy", "Tom"]
      (gen1, gen2) = split gen
      shuffled = shuffle users gen1
      chunks = randomChunks shuffled gen2
  print chunks
