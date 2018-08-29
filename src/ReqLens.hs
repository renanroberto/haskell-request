{-# LANGUAGE OverloadedStrings #-}

module ReqLens ( reqLens ) where

import Network.Wreq
import Control.Lens ((^?))
import Data.Aeson.Lens (key, _String, _Bool)

reqLens :: IO ()
reqLens = do
  putStrLn "reqLens start"
  req <- get "https://yesno.wtf/api"
  let yesno = getResponse req
  print $ yesno "answer" _String
  putStrLn "reqLens done"


getResponse req field _type =
  req ^? (responseBody . key field . _type)
