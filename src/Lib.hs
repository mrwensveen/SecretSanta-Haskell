module Lib
  ( shuffle,
    randomChunks,
    randomRExcept,
  )
where

import qualified Data.List as List
import System.Random

shuffle :: (RandomGen g) => [a] -> g -> [a]
shuffle xs g =
  let xos = zip xs (randoms g :: [Int])
      sorted = List.sortBy (\(_, a) (_, b) -> compare a b) xos
   in map fst sorted

randomChunks :: (RandomGen g) => [a] -> g -> [[a]]
randomChunks [] _ = []
randomChunks xs gen =
  let l = length xs
   in if l <= 3
        then [xs]
        else
          let (gen1, gen2) = split gen
              i = randomRExcept (2, l) [l - 1] gen1
              (chunk, rest) = List.splitAt i xs
           in chunk : randomChunks rest gen2

randomRExcept :: (RandomGen g) => (Int, Int) -> [Int] -> g -> Int
randomRExcept (lo, hi) except gen =
  head $ filter (`notElem` except) (randomRs (lo, hi) gen)
