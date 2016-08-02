{-# LANGUAGE OverloadedStrings #-}


module NotDoing.Actions.Default where


import           Web.Spock.Safe

import           NotDoing.Types


defaultAction :: NotDoingAction ctx ()
defaultAction = text "Good-bye, cruel world!"
