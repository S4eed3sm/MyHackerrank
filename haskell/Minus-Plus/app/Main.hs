-- {-# LANGUAGE DuplicateRecordFields, FlexibleInstances, UndecidableInstances #-}

module Main where

import Lib ( plusMinus, lstrip, rstrip )


main :: IO()
main = do
    nTemp <- getLine
    let n = read $ lstrip $ rstrip nTemp :: Int

    arrTemp <- getLine

    let arr = map (read :: String -> Int) . words $ rstrip arrTemp

    plusMinus arr
