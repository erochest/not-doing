{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}


module WebRoutes where


import           Network.Wai
import           Web.Spock.Safe

-- import           Types

import           NotDoing.Actions.Default
import           NotDoing.Types


webRoutes :: IO Middleware
webRoutes = do
    let cfg = defaultSpockCfg () PCNoDatabase $ NotDoing ["./templates", "."]
    spock cfg $
        get root defaultAction
