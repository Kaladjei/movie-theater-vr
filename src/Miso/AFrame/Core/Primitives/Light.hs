{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Light where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data LightAttrs = LightAttrs
  { lightAngle       :: Maybe Float
  , lightColor       :: Maybe Color
  , lightDecay       :: Maybe Float
  , lightDistance    :: Maybe Float
  , lightGroundColor :: Maybe Color
  , lightIntensity   :: Maybe Float
  , lightPenumbra    :: Maybe Float
  , lightType        :: Maybe LightType
  , lightTarget      :: Maybe Value
  } deriving (Generic)

defaultLightAttrs :: LightAttrs
defaultLightAttrs = LightAttrs
  { lightAngle       = Nothing
  , lightColor       = Nothing
  , lightDecay       = Nothing
  , lightDistance    = Nothing
  , lightGroundColor = Nothing
  , lightIntensity   = Nothing
  , lightPenumbra    = Nothing
  , lightType        = Nothing
  , lightTarget      = Nothing
  }

instance ToJSON LightAttrs where toJSON = gtoJSONPrimitive

light :: LightAttrs -> Entity action
light = primitive "a-light" . attrsFromJSON
