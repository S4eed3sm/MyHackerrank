module Main where

import Control.Monad
import Data.Bits
import Data.List
import qualified Data.List.Split as S
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe
import qualified Text.Printf as P

--
-- Complete the 'timeConversion' function below.
--
-- The function is expected to return a STRING.
-- The function accepts STRING s as parameter.
--

timeConverter s = (hhii, mm,  ss)
  where
    (tm, am_pm) = splitAt (length s - 2) s
    [hh, mm, ss] = S.splitOn ":" tm
    hhi = (read hh :: Int) `mod` 12
    hhii =
      hhi + case am_pm of
        "AM" -> 0
        "PM" -> 12

timeConversion s = do
  let (hh, mm, ss) = timeConverter (s)
  P.printf "%02d:%s:%s" hh mm ss

main :: IO ()
main = do
  stdout <- getEnv "OUTPUT_PATH"
  fptr <- openFile stdout WriteMode

  s <- getLine

  let result = timeConversion s

  hPutStrLn fptr result

  hFlush fptr
  hClose fptr
