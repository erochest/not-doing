module Types where


import           Network.Wai.Handler.Warp

-- import           NotDoing.Types


data Actions
        = Serve { servePort :: !Port
                }
        deriving (Show, Eq)