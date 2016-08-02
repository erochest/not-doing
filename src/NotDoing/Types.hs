{-# LANGUAGE DeriveDataTypeable         #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}

-- {-# LANGUAGE DeriveFunctor              #-}
-- {-# LANGUAGE DeriveTraversable          #-}
-- {-# LANGUAGE OverloadedLists            #-}
-- {-# LANGUAGE RankNTypes                 #-}
-- {-# LANGUAGE RecordWildCards            #-}


module NotDoing.Types where


-- import qualified Data.Text              as T

import           Control.Lens
import           Data.Data
import           GHC.Generics hiding (to)
import           Web.Spock


data NotDoingState
    = NotDoing
    { _templatePath :: ![FilePath]
    } deriving (Show, Eq, Generic, Data, Typeable)
$(makeLenses ''NotDoingState)

type NotDoingApp ctx      = SpockCtxM ctx () () NotDoingState ()
type NotDoingAction ctx a = SpockActionCtx ctx () () NotDoingState a
