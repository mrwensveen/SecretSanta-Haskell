module Lib
    ( randomRExcept
    , shuffle
    ) where

import System.Random
import qualified Data.List as List

randomRExcept :: RandomGen g => (Int, Int) -> [Int] -> g -> Int --(Int, g)
randomRExcept (lo, hi) except gen =
    filter (`notElem` except) (randomRs (lo, hi) gen) !! 0

shuffle :: RandomGen g => [a] -> g -> [a] --([a], g)
shuffle xs g =
    let xos = zip xs (randoms g :: [Int])
        sorted = List.sortBy (\(_, a) (_, b) -> compare a b) xos
    in map fst sorted

{-
shuffle' :: [Int] -> [a] -> [a]
shuffle' (rand:rands) xs =
    let (firsts, rest) = splitAt (rand `mod` length xs) xs
    in (head rest) : shuffle' rands (firsts ++ tail rest)
-}
