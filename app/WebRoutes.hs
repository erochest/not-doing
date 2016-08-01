{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}


module WebRoutes where


import           Network.Wai
import           Web.Spock.Safe

-- import           Types

import NotDoing.Actions.Default


webRoutes :: IO Middleware
webRoutes = spockT id $
    get root $ defaultAction