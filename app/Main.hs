{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}


module Main where


import           Web.Spock.Shared

import           Opts
import           WebRoutes


main :: IO ()
main = do
    Serve{..} <- parseOpts
    runSpock servePort webRoutes