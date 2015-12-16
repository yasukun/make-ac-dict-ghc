module Lib
    ( parseHTML
    , parseURL
    , Library(..)
    ) where

import Text.HTML.Scalpel

type Name = String

data Library = LibName Name
            deriving (Show, Eq)

targets :: Scraper String [Library]
targets = chroots ("span" @: [hasClass "module"]) target

target :: Scraper String Library
target = moduleRef

moduleRef :: Scraper String Library
moduleRef = do
  name <- text  $ "span" // "a"
  return $ LibName name

parseHTML :: String -> Maybe [Library]
parseHTML html = scrapeStringLike html targets

parseURL :: URL -> IO (Maybe [Library])
parseURL url = scrapeURL url targets
