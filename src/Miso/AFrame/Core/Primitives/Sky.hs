{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Sky where

import Data.Aeson
import GHC.Generics

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data SkyAttrs = SkyAttrs
  { skyColor          :: Maybe Color
  , skyMetalness      :: Maybe Float
  , skyOpacity        :: Maybe Float
  , skyPhiLength      :: Maybe Float
  , skyPhiStart       :: Maybe Float
  , skyRadius         :: Maybe Float
  , skyRepeat         :: Maybe Vec2
  , skyRoughness      :: Maybe Float
  , skySegmentsHeight :: Maybe Float
  , skySegmentsWidth  :: Maybe Float
  , skyShader         :: Maybe Value
  , skySrc            :: Maybe Value
  , skyThetaLength    :: Maybe Float
  , skyThetaStart     :: Maybe Float
  , skyTransparent    :: Maybe Bool
  } deriving (Generic)

defaultSkyAttrs :: SkyAttrs
defaultSkyAttrs = SkyAttrs
  { skyColor          = Nothing
  , skyMetalness      = Nothing
  , skyOpacity        = Nothing
  , skyPhiLength      = Nothing
  , skyPhiStart       = Nothing
  , skyRadius         = Nothing
  , skyRepeat         = Nothing
  , skyRoughness      = Nothing
  , skySegmentsHeight = Nothing
  , skySegmentsWidth  = Nothing
  , skyShader         = Nothing
  , skySrc            = Nothing
  , skyThetaLength    = Nothing
  , skyThetaStart     = Nothing
  , skyTransparent    = Nothing
  }

instance ToJSON SkyAttrs where toJSON = gtoJSONPrimitive

sky :: SkyAttrs -> Entity action
sky = primitive "a-sky" . attrsFromJSON
