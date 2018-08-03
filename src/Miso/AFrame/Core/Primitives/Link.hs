{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Link where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data LinkAttrs = LinkAttrs
  { linkHref  :: Maybe Value
  , linkTitle :: Maybe Value
  , linkSrc   :: Maybe Value
  } deriving (Generic)

defaultLinkAttrs :: LinkAttrs
defaultLinkAttrs = LinkAttrs
  { linkHref  = Nothing
  , linkTitle = Nothing
  , linkSrc   = Nothing
  }

instance ToJSON LinkAttrs where toJSON = gtoJSONPrimitive

link :: LinkAttrs -> Entity action
link = primitive "a-link" . attrsFromJSON
