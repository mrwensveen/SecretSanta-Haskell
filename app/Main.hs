module Main (main) where

import Lib
import System.Random

main :: IO ()
main = do
  gen <- getStdGen
  let users = ["Alice", "Bob", "Zeke", "Mariah", "Jim", "Sue", "Cathy", "Tom"]
      shuffled = shuffle users gen
  print shuffled
