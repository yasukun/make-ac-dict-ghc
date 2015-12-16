module Main where

import Lib
import Data.Maybe

-- main :: IO ()
main = do
  n <- parseURL "https://downloads.haskell.org/~ghc/latest/docs/html/libraries/"
  let (Just n') = n
  putStrLn $ unlines $ map (\x -> let (LibName y) = x in y) n'
