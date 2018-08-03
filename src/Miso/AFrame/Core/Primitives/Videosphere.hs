{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Videosphere where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data VideosphereAttrs = VideosphereAttrs
  { videosphereAutoplay       :: Maybe Bool
  , videosphereCrossOrigin    :: Maybe Value
  , videosphereLoop           :: Maybe Bool
  , videosphereRadius         :: Maybe Float
  , videosphereSegmentsHeight :: Maybe Float
  , videosphereSegmentsWidth  :: Maybe Float
  } deriving (Generic)

defaultVideosphereAttrs :: VideosphereAttrs
defaultVideosphereAttrs = VideosphereAttrs
  { videosphereAutoplay       = Nothing
  , videosphereCrossOrigin    = Nothing
  , videosphereLoop           = Nothing
  , videosphereRadius         = Nothing
  , videosphereSegmentsHeight = Nothing
  , videosphereSegmentsWidth  = Nothing
  }

instance ToJSON VideosphereAttrs where toJSON = gtoJSONPrimitive

videosphere :: VideosphereAttrs -> Entity action
videosphere = primitive "a-videosphere" . attrsFromJSON
