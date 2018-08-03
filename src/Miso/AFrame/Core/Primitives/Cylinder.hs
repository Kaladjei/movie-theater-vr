{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Cylinder where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data CylinderAttrs = CylinderAttrs
  { cylinderAmbientOcclusionMap            :: Maybe Value
  , cylinderAmbientOcclusionMapIntensity   :: Maybe Float
  , cylinderAmbientOcclusionTextureOffset  :: Maybe Vec2
  , cylinderAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , cylinderColor                          :: Maybe Color
  , cylinderDisplacementBias               :: Maybe Float
  , cylinderDisplacementMap                :: Maybe Value
  , cylinderDisplacementScale              :: Maybe Float
  , cylinderDisplacementTextureOffset      :: Maybe Vec2
  , cylinderDisplacementTextureRepeat      :: Maybe Vec2
  , cylinderEnvMap                         :: Maybe Value
  , cylinderFog                            :: Maybe Bool
  , cylinderHeight                         :: Maybe Float
  , cylinderMetalness                      :: Maybe Float
  , cylinderNormalMap                      :: Maybe Value
  , cylinderNormalScale                    :: Maybe Vec2
  , cylinderNormalTextureOffset            :: Maybe Vec2
  , cylinderNormalTextureRepeat            :: Maybe Vec2
  , cylinderOpenEnded                      :: Maybe Bool
  , cylinderRadiusBottom                   :: Maybe Float
  , cylinderRadiusTop                      :: Maybe Float
  , cylinderRepeat                         :: Maybe Vec2
  , cylinderRoughness                      :: Maybe Float
  , cylinderSegmentsHeight                 :: Maybe Float
  , cylinderSegmentsRadial                 :: Maybe Float
  , cylinderSphericalEnvMap                :: Maybe Value
  , cylinderSrc                            :: Maybe Value
  , cylinderThetaLength                    :: Maybe Float
  , cylinderThetaStart                     :: Maybe Float
  , cylinderWidth                          :: Maybe Float
  , cylinderWireframe                      :: Maybe Bool
  , cylinderWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultCylinderAttrs :: CylinderAttrs
defaultCylinderAttrs = CylinderAttrs
  { cylinderAmbientOcclusionMap            = Nothing
  , cylinderAmbientOcclusionMapIntensity   = Nothing
  , cylinderAmbientOcclusionTextureOffset  = Nothing
  , cylinderAmbientOcclusionTextureRepeat  = Nothing
  , cylinderColor                          = Nothing
  , cylinderDisplacementBias               = Nothing
  , cylinderDisplacementMap                = Nothing
  , cylinderDisplacementScale              = Nothing
  , cylinderDisplacementTextureOffset      = Nothing
  , cylinderDisplacementTextureRepeat      = Nothing
  , cylinderEnvMap                         = Nothing
  , cylinderFog                            = Nothing
  , cylinderHeight                         = Nothing
  , cylinderMetalness                      = Nothing
  , cylinderNormalMap                      = Nothing
  , cylinderNormalScale                    = Nothing
  , cylinderNormalTextureOffset            = Nothing
  , cylinderNormalTextureRepeat            = Nothing
  , cylinderOpenEnded                      = Nothing
  , cylinderRadiusBottom                   = Nothing
  , cylinderRadiusTop                      = Nothing
  , cylinderRepeat                         = Nothing
  , cylinderRoughness                      = Nothing
  , cylinderSegmentsHeight                 = Nothing
  , cylinderSegmentsRadial                 = Nothing
  , cylinderSphericalEnvMap                = Nothing
  , cylinderSrc                            = Nothing
  , cylinderThetaLength                    = Nothing
  , cylinderThetaStart                     = Nothing
  , cylinderWidth                          = Nothing
  , cylinderWireframe                      = Nothing
  , cylinderWireframeLinewidth             = Nothing
  }

instance ToJSON CylinderAttrs where toJSON = gtoJSONPrimitive

cylinder :: CylinderAttrs -> Entity action
cylinder = primitive "a-cylinder" . attrsFromJSON
