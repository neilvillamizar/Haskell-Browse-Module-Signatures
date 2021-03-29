module Functions where

import Data.Maybe

sum_ :: Int -> Int -> Int
sum_ a b = a + b

mult :: Int -> Int -> Int
mult a b = a * b

hello_you_str :: String -> String
hello_you_str name = "Hello " ++ name ++ "!"

fact :: Int -> Int
fact n = n * fact (n-1)

maybe_dice :: Int -> Maybe Int
maybe_dice n
  | n > 6 || n < 1 = Nothing
  | otherwise      = Just n