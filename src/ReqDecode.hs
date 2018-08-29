module ReqDecode ( reqDecode ) where

import Network.Wreq
import qualified Data.ByteString.Lazy as B
import Data.Map as Map
import Data.Aeson
import Control.Lens ((^.))

type JSON = Map String Value

reqDecode :: IO ()
reqDecode = do
  putStrLn "reqDecode start"
  req <- get "https://yesno.wtf/api"
  let yesno = getResponse req
  print $ yesno "answer"
  putStrLn "reqDecode done"

getResponse :: Response B.ByteString -> String -> Maybe Value
getResponse req key =
  getBody req >>= getField key

getBody :: Response B.ByteString -> Maybe JSON
getBody req =
  decode $ req ^. responseBody

getField :: String -> JSON -> Maybe Value
getField key json =
  Map.lookup key json
