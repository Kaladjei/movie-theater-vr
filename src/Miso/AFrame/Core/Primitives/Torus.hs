{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Torus where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data TorusAttrs = TorusAttrs
  { torusAmbientOcclusionMap            :: Maybe Value
  , torusAmbientOcclusionMapIntensity   :: Maybe Float
  , torusAmbientOcclusionTextureOffset  :: Maybe Vec2
  , torusAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , torusArc                            :: Maybe Float
  , torusColor                          :: Maybe Color
  , torusDisplacementBias               :: Maybe Float
  , torusDisplacementMap                :: Maybe Value
  , torusDisplacementScale              :: Maybe Float
  , torusDisplacementTextureOffset      :: Maybe Vec2
  , torusDisplacementTextureRepeat      :: Maybe Vec2
  , torusEnvMap                         :: Maybe Value
  , torusFog                            :: Maybe Bool
  , torusHeight                         :: Maybe Float
  , torusMetalness                      :: Maybe Float
  , torusNormalMap                      :: Maybe Value
  , torusNormalScale                    :: Maybe Vec2
  , torusNormalTextureOffset            :: Maybe Vec2
  , torusNormalTextureRepeat            :: Maybe Vec2
  , torusRadius                         :: Maybe Float
  , torusRadiusTubular                  :: Maybe Float
  , torusRepeat                         :: Maybe Vec2
  , torusRoughness                      :: Maybe Float
  , torusSegmentsRadial                 :: Maybe Float
  , torusSegmentsTubular                :: Maybe Float
  , torusSphericalEnvMap                :: Maybe Value
  , torusSrc                            :: Maybe Value
  , torusWidth                          :: Maybe Float
  , torusWireframe                      :: Maybe Bool
  , torusWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultTorusAttrs :: TorusAttrs
defaultTorusAttrs = TorusAttrs
  { torusAmbientOcclusionMap            = Nothing
  , torusAmbientOcclusionMapIntensity   = Nothing
  , torusAmbientOcclusionTextureOffset  = Nothing
  , torusAmbientOcclusionTextureRepeat  = Nothing
  , torusArc                            = Nothing
  , torusColor                          = Nothing
  , torusDisplacementBias               = Nothing
  , torusDisplacementMap                = Nothing
  , torusDisplacementScale              = Nothing
  , torusDisplacementTextureOffset      = Nothing
  , torusDisplacementTextureRepeat      = Nothing
  , torusEnvMap                         = Nothing
  , torusFog                            = Nothing
  , torusHeight                         = Nothing
  , torusMetalness                      = Nothing
  , torusNormalMap                      = Nothing
  , torusNormalScale                    = Nothing
  , torusNormalTextureOffset            = Nothing
  , torusNormalTextureRepeat            = Nothing
  , torusRadius                         = Nothing
  , torusRadiusTubular                  = Nothing
  , torusRepeat                         = Nothing
  , torusRoughness                      = Nothing
  , torusSegmentsRadial                 = Nothing
  , torusSegmentsTubular                = Nothing
  , torusSphericalEnvMap                = Nothing
  , torusSrc                            = Nothing
  , torusWidth                          = Nothing
  , torusWireframe                      = Nothing
  , torusWireframeLinewidth             = Nothing
  }

instance ToJSON TorusAttrs where toJSON = gtoJSONPrimitive

torus :: TorusAttrs -> Entity action
torus = primitive "a-torus" . attrsFromJSON
