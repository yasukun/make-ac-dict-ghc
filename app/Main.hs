{-# LANGUAGE DeriveDataTypeable #-}
module Main where

import Lib
import System.Console.CmdArgs

data MakeDictArgs = MakeDictArgs {
      url :: String
    } deriving (Show, Data, Typeable)

makedictargs = MakeDictArgs
         {
           url = "https://downloads.haskell.org/~ghc/latest/docs/html/libraries/" &= args &= typ "String"
         }

main :: IO ()
main = do
  opts <- cmdArgs makedictargs
  n <- parseURL (url opts)
  let (Just n') = n
  putStrLn $ unlines $ map (\x -> let (LibName y) = x in y) n'
