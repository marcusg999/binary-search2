module Main where

import Control.Monad.Trans.Maybe (MaybeT(..), runMaybeT)
import Data.List (findIndex)

binarySearch :: Ord a => [a] -> a -> MaybeT IO Int
binarySearch xs x = MaybeT $ do
  let idx = findIndex (== x) xs
  case idx of
    Just i -> return $ Just i
    Nothing -> return Nothing

main :: IO ()
main = do
  let arr = [1, 3, 4, 7, 9, 11, 13, 15, 17, 19]
      target = 15
  idx <- runMaybeT $ binarySearch arr target
  case idx of
    Just i -> putStrLn $ "Target found at index " ++ show i ++ "."
    Nothing -> putStrLn "Target not found."
