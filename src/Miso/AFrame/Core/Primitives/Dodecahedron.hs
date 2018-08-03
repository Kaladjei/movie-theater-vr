{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Dodecahedron where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data DodecahedronAttrs = DodecahedronAttrs
  { dodecahedronAmbientOcclusionMap            :: Maybe Value
  , dodecahedronAmbientOcclusionMapIntensity   :: Maybe Float
  , dodecahedronAmbientOcclusionTextureOffset  :: Maybe Vec2
  , dodecahedronAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , dodecahedronColor                          :: Maybe Color
  , dodecahedronDisplacementBias               :: Maybe Float
  , dodecahedronDisplacementMap                :: Maybe Value
  , dodecahedronDisplacementScale              :: Maybe Float
  , dodecahedronDisplacementTextureOffset      :: Maybe Vec2
  , dodecahedronDisplacementTextureRepeat      :: Maybe Vec2
  , dodecahedronEnvMap                         :: Maybe Value
  , dodecahedronFog                            :: Maybe Bool
  , dodecahedronHeight                         :: Maybe Float
  , dodecahedronMetalness                      :: Maybe Float
  , dodecahedronNormalMap                      :: Maybe Value
  , dodecahedronNormalScale                    :: Maybe Vec2
  , dodecahedronNormalTextureOffset            :: Maybe Vec2
  , dodecahedronNormalTextureRepeat            :: Maybe Vec2
  , dodecahedronOpenEnded                      :: Maybe Bool
  , dodecahedronRadiusBottom                   :: Maybe Float
  , dodecahedronRadiusTop                      :: Maybe Float
  , dodecahedronRepeat                         :: Maybe Vec2
  , dodecahedronRoughness                      :: Maybe Float
  , dodecahedronSegmentsHeight                 :: Maybe Float
  , dodecahedronSegmentsRadial                 :: Maybe Float
  , dodecahedronSphericalEnvMap                :: Maybe Value
  , dodecahedronSrc                            :: Maybe Value
  , dodecahedronThetaLength                    :: Maybe Float
  , dodecahedronThetaStart                     :: Maybe Float
  , dodecahedronWidth                          :: Maybe Float
  , dodecahedronWireframe                      :: Maybe Bool
  , dodecahedronWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultDodecahedronAttrs :: DodecahedronAttrs
defaultDodecahedronAttrs = DodecahedronAttrs
  { dodecahedronAmbientOcclusionMap            = Nothing
  , dodecahedronAmbientOcclusionMapIntensity   = Nothing
  , dodecahedronAmbientOcclusionTextureOffset  = Nothing
  , dodecahedronAmbientOcclusionTextureRepeat  = Nothing
  , dodecahedronColor                          = Nothing
  , dodecahedronDisplacementBias               = Nothing
  , dodecahedronDisplacementMap                = Nothing
  , dodecahedronDisplacementScale              = Nothing
  , dodecahedronDisplacementTextureOffset      = Nothing
  , dodecahedronDisplacementTextureRepeat      = Nothing
  , dodecahedronEnvMap                         = Nothing
  , dodecahedronFog                            = Nothing
  , dodecahedronHeight                         = Nothing
  , dodecahedronMetalness                      = Nothing
  , dodecahedronNormalMap                      = Nothing
  , dodecahedronNormalScale                    = Nothing
  , dodecahedronNormalTextureOffset            = Nothing
  , dodecahedronNormalTextureRepeat            = Nothing
  , dodecahedronOpenEnded                      = Nothing
  , dodecahedronRadiusBottom                   = Nothing
  , dodecahedronRadiusTop                      = Nothing
  , dodecahedronRepeat                         = Nothing
  , dodecahedronRoughness                      = Nothing
  , dodecahedronSegmentsHeight                 = Nothing
  , dodecahedronSegmentsRadial                 = Nothing
  , dodecahedronSphericalEnvMap                = Nothing
  , dodecahedronSrc                            = Nothing
  , dodecahedronThetaLength                    = Nothing
  , dodecahedronThetaStart                     = Nothing
  , dodecahedronWidth                          = Nothing
  , dodecahedronWireframe                      = Nothing
  , dodecahedronWireframeLinewidth             = Nothing
  }

instance ToJSON DodecahedronAttrs where toJSON = gtoJSONPrimitive

dodecahedron :: DodecahedronAttrs -> Entity action
dodecahedron = primitive "a-dodecahedron" . attrsFromJSON
