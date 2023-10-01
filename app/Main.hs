module Main where

import System.Environment (getArgs)
import Graphics.Vty
import Yi.Rope as R
import Data.Text

type Rope = YiString

main :: IO ()
main = do
  (file : _) <- getArgs
  print file
  vty <- mkVty =<< standardIOConfig
  render vty file
  nextEvent vty
  shutdown vty

render :: Vty -> FilePath -> IO ()
render v p = R.readFile p >>= \case
  Left e -> error $ unpack e
  Right r -> update v . picForImage . text' defAttr $ toText r
