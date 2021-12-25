{-# LANGUAGE DuplicateRecordFields, FlexibleInstances, UndecidableInstances #-}

module Main where
import qualified Data.Text as T
import Text.Printf

--
-- Complete the 'matchingStrings' function below.
--
-- The function is expected to return an INTEGER_ARRAY.
-- The function accepts following parameters:
--  1. STRING_ARRAY strings
--  2. STRING_ARRAY queries
--

matchingStrings strings queries = do
    

lstrip = T.unpack . T.stripStart . T.pack
rstrip = T.unpack . T.stripEnd . T.pack

readMultipleLinesAsStringArray :: Int -> IO [String]
readMultipleLinesAsStringArray 0 = return []
readMultipleLinesAsStringArray n = do
    line <- getLine
    rest <- readMultipleLinesAsStringArray(n - 1)
    return (line : rest)

main :: IO()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    stringsCountTemp <- getLine
    let stringsCount = read $ lstrip $ rstrip stringsCountTemp :: Int

    strings <- readMultipleLinesAsStringArray stringsCount

    queriesCountTemp <- getLine
    let queriesCount = read $ lstrip $ rstrip queriesCountTemp :: Int

    queries <- readMultipleLinesAsStringArray queriesCount

    let res = matchingStrings strings queries

    hPutStrLn fptr $ Data.List.intercalate "\n" $ Data.List.map (\x -> show x) $ res

    hFlush fptr
    hClose fptr
