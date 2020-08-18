module Main where

import System.IO
import Control.Monad (when)
import Data.Char
import Control.Exception
import Text.Read

import qualified Data.IntMap.Strict as Im

import Lib

createTask :: IO (Task String)
createTask = do
    putStrLn "Enter the description of the new task"
    description <- getLine
    putStrLn "Enter the expiry time of the new task"
    date <- getInt
    return (Task{description, date})

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

removeTask tasks = do
    putStrLn "Enter the index of the task to remove"
    index <- getInt
    return (Im.delete index tasks)

editTask tasks = do
    putStrLn "Enter the index of the task to edit"
    index <- getInt
    task <- createTask
    return (Im.insert index tasks)

readData = do
    file <- readFile "file.txt"
    let list = fmap read (lines file) :: [(Int, String)]
        fixedList = fmap (\(x,y) -> (x,(read y) :: Task String)) $ list
    return $ Im.fromList fixedList

main = do
    file <- (readFile "file.txt")
    tasks <- readData
    print tasks
