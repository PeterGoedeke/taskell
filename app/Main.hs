module Main where

import System.IO
import Control.Monad (when)
import Data.Char
import Control.Exception
import Text.Read

import qualified Data.IntMap.Strict as Im

import Lib

main = undefined
getInt :: IO (Int)
getInt = do
    value <- getLine
    getInt' $ (readMaybe value :: Maybe Int)

getInt' :: (Maybe Int) -> IO (Int)
getInt' (Just a) = return a
getInt' Nothing = do
    putStrLn "Invalid input"
    value <- getLine
    let parsed = readMaybe value :: Maybe Int
    getInt' parsed

