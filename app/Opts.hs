{-# LANGUAGE LambdaCase #-}


module Opts
    ( Actions(..)
    , opts
    , execParser
    , parseOpts
    ) where


import           Network.Wai.Handler.Warp

import           Options.Applicative

-- import           NotDoing.Types

import           Types


portOpt :: Parser Port
portOpt = option auto (  short 'p' <> long "port" <> metavar "PORT_NO"
                      <> help "This port to serve on.")

serverOpts :: Parser Actions
serverOpts = Serve <$> portOpt

-- opts' :: Parser Actions
-- opts' = subparser
--       (  command "default" (info (helper <*> serverOpts)
--                           (progDesc "Serve the webapp."))
--       )

opts :: ParserInfo Actions
opts = info (helper <*> serverOpts)
            (  fullDesc
            <> progDesc "An app to track things that you aren't doing."
            <> header "not-doing - What aren't you doing?")

parseOpts :: IO Actions
parseOpts = execParser opts