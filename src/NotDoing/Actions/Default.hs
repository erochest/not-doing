{-# LANGUAGE OverloadedStrings #-}


module NotDoing.Actions.Default where


import           Web.Spock.Safe

-- import           NotDoing.Types


defaultAction :: ActionCtxT ctx IO ()
defaultAction = text "Good-bye, cruel world!"