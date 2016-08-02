{-# LANGUAGE OverloadedStrings #-}


module NotDoing.Controllers where


import qualified Data.Text           as T
import           Text.Mustache
import           Web.Spock.Safe

import           NotDoing.Templating
import           NotDoing.Types


getIndex :: NotDoingAction ctx ()
getIndex =
    render "index.mustache"
           (object ["title" ~> ("Good-bye, cruel world!" :: T.Text)])
        >>= html
