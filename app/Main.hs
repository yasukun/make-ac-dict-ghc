module Main where

import Lib

main :: IO ()
main = do
  -- print $ parseTest
  -- html <- readFile "../data/target.html"
  -- print $ parseHTML html
  print =<< parseURL "https://downloads.haskell.org/~ghc/latest/docs/html/libraries/"
