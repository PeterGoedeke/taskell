module Lib where

data Task a = Task {
    description :: a,
    date :: Int
} deriving (Show, Read)

instance Functor Task where
    fmap f t@(Task{description=d}) = t{description=(f d)}

instance Eq (Task a) where
    Task{date=d1} == Task{date=d2} = d1 == d2

instance Ord (Task a) where
    compare Task{date=d1} Task{date=d2} = d1 `compare` d2

-- need addTask which puts it where it should be in the order
-- need remove and edit task