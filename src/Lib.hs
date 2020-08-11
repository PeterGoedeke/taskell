module Lib where

data Task a = Task a | Category [Task a] deriving (Show)

instance Functor Task where
    fmap f (Task a) = Task (f a)
    fmap f (Category a) = Category (map (\x -> fmap f x) a)

test = Category [Task "h", Task "i"]
