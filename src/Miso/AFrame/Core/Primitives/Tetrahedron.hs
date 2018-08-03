{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Tetrahedron where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data TetrahedronAttrs = TetrahedronAttrs
  { tetrahedronAmbientOcclusionMap            :: Maybe Value
  , tetrahedronAmbientOcclusionMapIntensity   :: Maybe Float
  , tetrahedronAmbientOcclusionTextureOffset  :: Maybe Vec2
  , tetrahedronAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , tetrahedronColor                          :: Maybe Color
  , tetrahedronDetail                         :: Maybe Float
  , tetrahedronDisplacementBias               :: Maybe Float
  , tetrahedronDisplacementMap                :: Maybe Value
  , tetrahedronDisplacementScale              :: Maybe Float
  , tetrahedronDisplacementTextureOffset      :: Maybe Vec2
  , tetrahedronDisplacementTextureRepeat      :: Maybe Vec2
  , tetrahedronEnvMap                         :: Maybe Value
  , tetrahedronFog                            :: Maybe Bool
  , tetrahedronHeight                         :: Maybe Float
  , tetrahedronMetalness                      :: Maybe Float
  , tetrahedronNormalMap                      :: Maybe Value
  , tetrahedronNormalScale                    :: Maybe Vec2
  , tetrahedronNormalTextureOffset            :: Maybe Vec2
  , tetrahedronNormalTextureRepeat            :: Maybe Vec2
  , tetrahedronRadius                         :: Maybe Float
  , tetrahedronRepeat                         :: Maybe Vec2
  , tetrahedronRoughness                      :: Maybe Float
  , tetrahedronSphericalEnvMap                :: Maybe Value
  , tetrahedronSrc                            :: Maybe Value
  , tetrahedronWidth                          :: Maybe Float
  , tetrahedronWireframe                      :: Maybe Bool
  , tetrahedronWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultTetrahedronAttrs :: TetrahedronAttrs
defaultTetrahedronAttrs = TetrahedronAttrs
  { tetrahedronAmbientOcclusionMap            = Nothing
  , tetrahedronAmbientOcclusionMapIntensity   = Nothing
  , tetrahedronAmbientOcclusionTextureOffset  = Nothing
  , tetrahedronAmbientOcclusionTextureRepeat  = Nothing
  , tetrahedronColor                          = Nothing
  , tetrahedronDetail                         = Nothing
  , tetrahedronDisplacementBias               = Nothing
  , tetrahedronDisplacementMap                = Nothing
  , tetrahedronDisplacementScale              = Nothing
  , tetrahedronDisplacementTextureOffset      = Nothing
  , tetrahedronDisplacementTextureRepeat      = Nothing
  , tetrahedronEnvMap                         = Nothing
  , tetrahedronFog                            = Nothing
  , tetrahedronHeight                         = Nothing
  , tetrahedronMetalness                      = Nothing
  , tetrahedronNormalMap                      = Nothing
  , tetrahedronNormalScale                    = Nothing
  , tetrahedronNormalTextureOffset            = Nothing
  , tetrahedronNormalTextureRepeat            = Nothing
  , tetrahedronRadius                         = Nothing
  , tetrahedronRepeat                         = Nothing
  , tetrahedronRoughness                      = Nothing
  , tetrahedronSphericalEnvMap                = Nothing
  , tetrahedronSrc                            = Nothing
  , tetrahedronWidth                          = Nothing
  , tetrahedronWireframe                      = Nothing
  , tetrahedronWireframeLinewidth             = Nothing
  }

instance ToJSON TetrahedronAttrs where toJSON = gtoJSONPrimitive

tetrahedron :: TetrahedronAttrs -> Entity action
tetrahedron = primitive "a-tetrahedron" . attrsFromJSON
