module Lib
  ( round6,
    plusMinus,
    rstrip,
    lstrip
  ) where

import Text.Printf (printf)
import  qualified Data.Text  as T

lstrip :: String -> String
lstrip = T.unpack . T.stripStart . T.pack

rstrip :: String -> String
rstrip = T.unpack . T.stripEnd . T.pack

round6 :: (Fractional a1, RealFrac a2, Floating a1) => a2 -> a1
round6 x = fromIntegral (round $ x * 1e6) / 1e6

-- printer ::  (HPrintfType  c, Text.Printf.PrintfArg a) => a -> c
-- printer = hPrintf stdout . printf "%0.6v\n"

plusMinus :: (Ord a, Num a) => [a] -> IO ()
plusMinus arr = do
  printf "%0.6f\n" (p :: Double)
  printf "%0.6f\n" (n :: Double)
  printf "%0.6f\n" (z :: Double)
  where
    p = fromIntegral (length . filter (> 0) $ arr) / fromIntegral (length arr)
    n = fromIntegral (length . filter (< 0) $ arr) / fromIntegral (length arr)
    z = fromIntegral (length . filter (== 0) $ arr) / fromIntegral (length arr)
