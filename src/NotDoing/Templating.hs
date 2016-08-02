{-# LANGUAGE OverloadedStrings #-}


module NotDoing.Templating where


import           Control.Monad.IO.Class
import qualified Data.List              as L
import qualified Data.Text              as T
import           Text.Mustache
import           Text.Parsec.Error
import           Web.Spock

import           NotDoing.Types


render :: ToMustache v => FilePath -> v -> NotDoingAction ctx T.Text
render tmplFile v = do
    searchPath <- _templatePath <$> getState
    tmplE <- liftIO $ automaticCompile searchPath tmplFile
    case tmplE of
         Right tmpl -> return $ substitute tmpl v
         Left  pe   -> fail
                    .  L.intercalate "\n"
                    .  map messageString
                    $  errorMessages pe
