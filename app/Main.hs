module Main where

import Core.Text.Rope
import Graphics.Vty

main :: IO ()
main = do
  vty <- mkVty =<< standardIOConfig
  update vty . picForImage . string defAttr $ fromRope "Hello, Haskell!"
  nextEvent vty
  shutdown vty
