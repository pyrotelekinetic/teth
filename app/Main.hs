module Main where

import Brick

ui :: Widget ()
ui = str "Hello, Haskell!"

main :: IO ()
main = simpleMain ui
