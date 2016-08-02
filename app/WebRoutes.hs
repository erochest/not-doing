{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}


module WebRoutes where


import           Network.Wai
import           Network.Wai.Middleware.Static
import           Web.Spock.Safe

-- import           Types

import           NotDoing.Controllers
import           NotDoing.Types


webRoutes :: IO Middleware
webRoutes = do
    let cfg = defaultSpockCfg () PCNoDatabase $ NotDoing ["./templates", "."]

    spock cfg $ do
        middleware $ staticPolicy $ addBase "./static"

        get root getIndex
