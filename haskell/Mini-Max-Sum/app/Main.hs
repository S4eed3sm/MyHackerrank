module Main where

import qualified Data.Text as T
import Text.Printf


calculateMinMaxSum :: (Num b, Ord b) => [b] -> (b, b)
calculateMinMaxSum arr = (_min, _max)
  where
    sums = replicate (length arr) $ sum arr
    diffs = zipWith (\x y -> x - y) sums arr
    _min = minimum diffs
    _max = maximum diffs


miniMaxSum arr = do
    let (_min, _max) = calculateMinMaxSum arr
    printf "%d %d\n" _min _max

lstrip = T.unpack . T.stripStart . T.pack
rstrip = T.unpack . T.stripEnd . T.pack

main :: IO()
main = do

    arrTemp <- getLine

    let arr = map (read :: String -> Int) . words $ rstrip arrTemp

    miniMaxSum arr
