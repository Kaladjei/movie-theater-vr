{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Circle where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data CircleAttrs = CircleAttrs
  { circleAmbientOcclusionMap            :: Maybe Value
  , circleAmbientOcclusionMapIntensity   :: Maybe Float
  , circleAmbientOcclusionTextureOffset  :: Maybe Vec2
  , circleAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , circleColor                          :: Maybe Color
  , circleDisplacementBias               :: Maybe Float
  , circleDisplacementMap                :: Maybe Value
  , circleDisplacementScale              :: Maybe Float
  , circleDisplacementTextureOffset      :: Maybe Vec2
  , circleDisplacementTextureRepeat      :: Maybe Vec2
  , circleEnvMap                         :: Maybe Value
  , circleFog                            :: Maybe Bool
  , circleHeight                         :: Maybe Float
  , circleMetalness                      :: Maybe Float
  , circleNormalMap                      :: Maybe Value
  , circleNormalScale                    :: Maybe Vec2
  , circleNormalTextureOffset            :: Maybe Vec2
  , circleNormalTextureRepeat            :: Maybe Vec2
  , circleRadius                         :: Maybe Float
  , circleRepeat                         :: Maybe Vec2
  , circleRoughness                      :: Maybe Float
  , circleSegments                       :: Maybe Float
  , circleSphericalEnvMap                :: Maybe Value
  , circleSrc                            :: Maybe Value
  , circleThetaLength                    :: Maybe Float
  , circleThetaStart                     :: Maybe Float
  , circleWidth                          :: Maybe Float
  , circleWireframe                      :: Maybe Bool
  , circleWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultCircleAttrs :: CircleAttrs
defaultCircleAttrs = CircleAttrs
  { circleAmbientOcclusionMap            = Nothing
  , circleAmbientOcclusionMapIntensity   = Nothing
  , circleAmbientOcclusionTextureOffset  = Nothing
  , circleAmbientOcclusionTextureRepeat  = Nothing
  , circleColor                          = Nothing
  , circleDisplacementBias               = Nothing
  , circleDisplacementMap                = Nothing
  , circleDisplacementScale              = Nothing
  , circleDisplacementTextureOffset      = Nothing
  , circleDisplacementTextureRepeat      = Nothing
  , circleEnvMap                         = Nothing
  , circleFog                            = Nothing
  , circleHeight                         = Nothing
  , circleMetalness                      = Nothing
  , circleNormalMap                      = Nothing
  , circleNormalScale                    = Nothing
  , circleNormalTextureOffset            = Nothing
  , circleNormalTextureRepeat            = Nothing
  , circleRadius                         = Nothing
  , circleRepeat                         = Nothing
  , circleRoughness                      = Nothing
  , circleSegments                       = Nothing
  , circleSphericalEnvMap                = Nothing
  , circleSrc                            = Nothing
  , circleThetaLength                    = Nothing
  , circleThetaStart                     = Nothing
  , circleWidth                          = Nothing
  , circleWireframe                      = Nothing
  , circleWireframeLinewidth             = Nothing
  }

instance ToJSON CircleAttrs where toJSON = gtoJSONPrimitive

circle :: CircleAttrs -> Entity action
circle = primitive "a-circle" . attrsFromJSON
