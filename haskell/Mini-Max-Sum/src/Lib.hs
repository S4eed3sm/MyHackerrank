module Lib
  ( calculateMinMaxSum,
  )
where

calculateMinMaxSum :: (Num b, Ord b) => [b] -> (b, b)
calculateMinMaxSum arr = (_min, _max)
  where
    sums = replicate (length arr) $ sum arr
    diffs = zipWith (\x y -> x - y) sums arr
    _min = minimum diffs
    _max = maximum diffs
