{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Cone where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data ConeAttrs = ConeAttrs
  { coneAmbientOcclusionMap            :: Maybe Value
  , coneAmbientOcclusionMapIntensity   :: Maybe Float
  , coneAmbientOcclusionTextureOffset  :: Maybe Vec2
  , coneAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , coneColor                          :: Maybe Color
  , coneDisplacementBias               :: Maybe Float
  , coneDisplacementMap                :: Maybe Value
  , coneDisplacementScale              :: Maybe Float
  , coneDisplacementTextureOffset      :: Maybe Vec2
  , coneDisplacementTextureRepeat      :: Maybe Vec2
  , coneEnvMap                         :: Maybe Value
  , coneFog                            :: Maybe Bool
  , coneHeight                         :: Maybe Float
  , coneMetalness                      :: Maybe Float
  , coneNormalMap                      :: Maybe Value
  , coneNormalScale                    :: Maybe Vec2
  , coneNormalTextureOffset            :: Maybe Vec2
  , coneNormalTextureRepeat            :: Maybe Vec2
  , coneOpenEnded                      :: Maybe Bool
  , coneRadiusBottom                   :: Maybe Float
  , coneRadiusTop                      :: Maybe Float
  , coneRepeat                         :: Maybe Vec2
  , coneRoughness                      :: Maybe Float
  , coneSegmentsHeight                 :: Maybe Float
  , coneSegmentsRadial                 :: Maybe Float
  , coneSphericalEnvMap                :: Maybe Value
  , coneSrc                            :: Maybe Value
  , coneThetaLength                    :: Maybe Float
  , coneThetaStart                     :: Maybe Float
  , coneWidth                          :: Maybe Float
  , coneWireframe                      :: Maybe Bool
  , coneWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultConeAttrs :: ConeAttrs
defaultConeAttrs = ConeAttrs
  { coneAmbientOcclusionMap            = Nothing
  , coneAmbientOcclusionMapIntensity   = Nothing
  , coneAmbientOcclusionTextureOffset  = Nothing
  , coneAmbientOcclusionTextureRepeat  = Nothing
  , coneColor                          = Nothing
  , coneDisplacementBias               = Nothing
  , coneDisplacementMap                = Nothing
  , coneDisplacementScale              = Nothing
  , coneDisplacementTextureOffset      = Nothing
  , coneDisplacementTextureRepeat      = Nothing
  , coneEnvMap                         = Nothing
  , coneFog                            = Nothing
  , coneHeight                         = Nothing
  , coneMetalness                      = Nothing
  , coneNormalMap                      = Nothing
  , coneNormalScale                    = Nothing
  , coneNormalTextureOffset            = Nothing
  , coneNormalTextureRepeat            = Nothing
  , coneOpenEnded                      = Nothing
  , coneRadiusBottom                   = Nothing
  , coneRadiusTop                      = Nothing
  , coneRepeat                         = Nothing
  , coneRoughness                      = Nothing
  , coneSegmentsHeight                 = Nothing
  , coneSegmentsRadial                 = Nothing
  , coneSphericalEnvMap                = Nothing
  , coneSrc                            = Nothing
  , coneThetaLength                    = Nothing
  , coneThetaStart                     = Nothing
  , coneWidth                          = Nothing
  , coneWireframe                      = Nothing
  , coneWireframeLinewidth             = Nothing
  }

instance ToJSON ConeAttrs where toJSON = gtoJSONPrimitive

cone :: ConeAttrs -> Entity action
cone = primitive "a-cone" . attrsFromJSON
