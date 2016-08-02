{-# LANGUAGE OverloadedStrings #-}


module NotDoing.Actions.Default where


import qualified Data.Text           as T
import           Text.Mustache
import           Web.Spock.Safe

import           NotDoing.Templating
import           NotDoing.Types


defaultAction :: NotDoingAction ctx ()
defaultAction =
    render "index.mustache"
           (object ["title" ~> ("Good-bye, cruel world!" :: T.Text)])
        >>= html
