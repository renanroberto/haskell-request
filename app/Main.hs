module Main where

import ReqLens
import ReqDecode

main :: IO ()
main = do
  putStrLn "Starting request tests..."
  reqDecode
  reqLens
  putStrLn "Tests done"
