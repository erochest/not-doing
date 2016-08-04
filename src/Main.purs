module Main where

import Prelude

import Control.Monad.Eff.Console (log)

main :: forall t1. Eff (console :: CONSOLE | t1) Unit
main = log "Good-bye, cruel world."

