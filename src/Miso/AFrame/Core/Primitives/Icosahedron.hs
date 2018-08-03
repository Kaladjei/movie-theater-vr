{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Icosahedron where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data IcosahedronAttrs = IcosahedronAttrs
  { icosahedronAmbientOcclusionMap            :: Maybe Value
  , icosahedronAmbientOcclusionMapIntensity   :: Maybe Float
  , icosahedronAmbientOcclusionTextureOffset  :: Maybe Vec2
  , icosahedronAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , icosahedronColor                          :: Maybe Color
  , icosahedronDisplacementBias               :: Maybe Float
  , icosahedronDisplacementMap                :: Maybe Value
  , icosahedronDisplacementScale              :: Maybe Float
  , icosahedronDisplacementTextureOffset      :: Maybe Vec2
  , icosahedronDisplacementTextureRepeat      :: Maybe Vec2
  , icosahedronEnvMap                         :: Maybe Value
  , icosahedronFog                            :: Maybe Bool
  , icosahedronHeight                         :: Maybe Float
  , icosahedronMetalness                      :: Maybe Float
  , icosahedronNormalMap                      :: Maybe Value
  , icosahedronNormalScale                    :: Maybe Vec2
  , icosahedronNormalTextureOffset            :: Maybe Vec2
  , icosahedronNormalTextureRepeat            :: Maybe Vec2
  , icosahedronRadius                         :: Maybe Float
  , icosahedronRepeat                         :: Maybe Vec2
  , icosahedronRoughness                      :: Maybe Float
  , icosahedronSphericalEnvMap                :: Maybe Value
  , icosahedronSrc                            :: Maybe Value
  , icosahedronWidth                          :: Maybe Float
  , icosahedronWireframe                      :: Maybe Bool
  , icosahedronWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultIcosahedronAttrs :: IcosahedronAttrs
defaultIcosahedronAttrs = IcosahedronAttrs
  { icosahedronAmbientOcclusionMap            = Nothing
  , icosahedronAmbientOcclusionMapIntensity   = Nothing
  , icosahedronAmbientOcclusionTextureOffset  = Nothing
  , icosahedronAmbientOcclusionTextureRepeat  = Nothing
  , icosahedronColor                          = Nothing
  , icosahedronDisplacementBias               = Nothing
  , icosahedronDisplacementMap                = Nothing
  , icosahedronDisplacementScale              = Nothing
  , icosahedronDisplacementTextureOffset      = Nothing
  , icosahedronDisplacementTextureRepeat      = Nothing
  , icosahedronEnvMap                         = Nothing
  , icosahedronFog                            = Nothing
  , icosahedronHeight                         = Nothing
  , icosahedronMetalness                      = Nothing
  , icosahedronNormalMap                      = Nothing
  , icosahedronNormalScale                    = Nothing
  , icosahedronNormalTextureOffset            = Nothing
  , icosahedronNormalTextureRepeat            = Nothing
  , icosahedronRadius                         = Nothing
  , icosahedronRepeat                         = Nothing
  , icosahedronRoughness                      = Nothing
  , icosahedronSphericalEnvMap                = Nothing
  , icosahedronSrc                            = Nothing
  , icosahedronWidth                          = Nothing
  , icosahedronWireframe                      = Nothing
  , icosahedronWireframeLinewidth             = Nothing
  }

instance ToJSON IcosahedronAttrs where toJSON = gtoJSONPrimitive

icosahedron :: IcosahedronAttrs -> Entity action
icosahedron = primitive "a-icosahedron" . attrsFromJSON
