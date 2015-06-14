module TurretDefense
       (firstMiss
       )
       where

import Data.List

firstMiss :: [Int] -> [Int] -> [Int] -> Int
firstMiss xs ys times = getIndex $ foldl (\acc x -> getTuple acc x) ((0,0), -1, 0) (zip4 xs ys times [0..(length xs)])
  where
    getTuple ((oldX, oldY), missedIndex, curTime) (newX, newY, timeNeedToHit, curIndex)
      | missedIndex /= (-1) = ((-1, -1), missedIndex, -1) -- we already found missed index
      | timeOfArrival > timeNeedToHit = ((-1, -1), curIndex, -1) -- we just found the missed index
      | otherwise = ((newX, newY), missedIndex, timeNeedToHit) --we hit the target
      where
        timeToMove = (abs (newX - oldX)) + (abs (newY - oldY))
        timeOfArrival = timeToMove + curTime
    getIndex ((_,_),index,_) = index
                                           
                          

