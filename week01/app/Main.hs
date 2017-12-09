module Main where

import Lib

main :: IO ()
main = someFunc

-- EXERCISE 1
toDigits    :: Integer -> [Integer]
toDigitsRev :: Integer -> [Integer]

toDigits n = reverse (toDigitsRev n)
toDigitsRev n
    | n > 0     = (n `mod` 10) : toDigitsRev (n `div` 10)
    | otherwise = []

-- EXERCISE 2
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther [x, y] = (2*x) : [y]
doubleEveryOther (x:y:xs)
    | (length (x:y:xs)) `mod` 2 == 1 = x : doubleEveryOther (y:xs)
    | otherwise                      = (2*x) : y : (doubleEveryOther xs)

-- EXERCISE 3
sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs) = (x `div` 10) + (x `mod` 10) + sumDigits xs

-- EXERCISE 4
validate :: Integer -> Bool
validate num = ((sumDigits (doubleEveryOther (toDigits num))) `mod` 10) == 0

-- EXERCISE 5
type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 2 a b c = [(a, b), (a, c), (b, c)]
hanoi n a b c = (hanoi (n-1) a c b) ++ [(a, c)] ++ (hanoi (n-1) b a c)