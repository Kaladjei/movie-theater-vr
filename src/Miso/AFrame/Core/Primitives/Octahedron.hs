{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Octahedron where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data OctahedronAttrs = OctahedronAttrs
  { octahedronAmbientOcclusionMap            :: Maybe Value
  , octahedronAmbientOcclusionMapIntensity   :: Maybe Float
  , octahedronAmbientOcclusionTextureOffset  :: Maybe Vec2
  , octahedronAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , octahedronColor                          :: Maybe Color
  , octahedronDetail                         :: Maybe Float
  , octahedronDisplacementBias               :: Maybe Float
  , octahedronDisplacementMap                :: Maybe Value
  , octahedronDisplacementScale              :: Maybe Float
  , octahedronDisplacementTextureOffset      :: Maybe Vec2
  , octahedronDisplacementTextureRepeat      :: Maybe Vec2
  , octahedronEnvMap                         :: Maybe Value
  , octahedronFog                            :: Maybe Bool
  , octahedronHeight                         :: Maybe Float
  , octahedronMetalness                      :: Maybe Float
  , octahedronNormalMap                      :: Maybe Value
  , octahedronNormalScale                    :: Maybe Vec2
  , octahedronNormalTextureOffset            :: Maybe Vec2
  , octahedronNormalTextureRepeat            :: Maybe Vec2
  , octahedronRadius                         :: Maybe Float
  , octahedronRepeat                         :: Maybe Vec2
  , octahedronRoughness                      :: Maybe Float
  , octahedronSphericalEnvMap                :: Maybe Value
  , octahedronSrc                            :: Maybe Value
  , octahedronWidth                          :: Maybe Float
  , octahedronWireframe                      :: Maybe Bool
  , octahedronWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultOctahedronAttrs :: OctahedronAttrs
defaultOctahedronAttrs = OctahedronAttrs
  { octahedronAmbientOcclusionMap            = Nothing
  , octahedronAmbientOcclusionMapIntensity   = Nothing
  , octahedronAmbientOcclusionTextureOffset  = Nothing
  , octahedronAmbientOcclusionTextureRepeat  = Nothing
  , octahedronColor                          = Nothing
  , octahedronDetail                         = Nothing
  , octahedronDisplacementBias               = Nothing
  , octahedronDisplacementMap                = Nothing
  , octahedronDisplacementScale              = Nothing
  , octahedronDisplacementTextureOffset      = Nothing
  , octahedronDisplacementTextureRepeat      = Nothing
  , octahedronEnvMap                         = Nothing
  , octahedronFog                            = Nothing
  , octahedronHeight                         = Nothing
  , octahedronMetalness                      = Nothing
  , octahedronNormalMap                      = Nothing
  , octahedronNormalScale                    = Nothing
  , octahedronNormalTextureOffset            = Nothing
  , octahedronNormalTextureRepeat            = Nothing
  , octahedronRadius                         = Nothing
  , octahedronRepeat                         = Nothing
  , octahedronRoughness                      = Nothing
  , octahedronSphericalEnvMap                = Nothing
  , octahedronSrc                            = Nothing
  , octahedronWidth                          = Nothing
  , octahedronWireframe                      = Nothing
  , octahedronWireframeLinewidth             = Nothing
  }

instance ToJSON OctahedronAttrs where toJSON = gtoJSONPrimitive

octahedron :: OctahedronAttrs -> Entity action
octahedron = primitive "a-octahedron" . attrsFromJSON
