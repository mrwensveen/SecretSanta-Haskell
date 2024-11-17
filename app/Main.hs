module Main (main) where

import Lib
import System.Random

main :: IO ()
main = do
    gen <- getStdGen
    let users = ["Alice", "Bob", "Zeke", "Mariah", "Jim", "Sue", "Cathy", "Tom"]
    putStrLn $ show (shuffle users gen)
--    putStrLn $ show (randomRExcept (1, 8) [7] gen)
