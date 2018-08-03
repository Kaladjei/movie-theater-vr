{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Plane where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data PlaneAttrs = PlaneAttrs
  { planeAmbientOcclusionMap            :: Maybe Value
  , planeAmbientOcclusionMapIntensity   :: Maybe Float
  , planeAmbientOcclusionTextureOffset  :: Maybe Vec2
  , planeAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , planeColor                          :: Maybe Color
  , planeDisplacementBias               :: Maybe Float
  , planeDisplacementMap                :: Maybe Value
  , planeDisplacementScale              :: Maybe Float
  , planeDisplacementTextureOffset      :: Maybe Vec2
  , planeDisplacementTextureRepeat      :: Maybe Vec2
  , planeEnvMap                         :: Maybe Value
  , planeFog                            :: Maybe Bool
  , planeHeight                         :: Maybe Float
  , planeMetalness                      :: Maybe Float
  , planeNormalMap                      :: Maybe Value
  , planeNormalScale                    :: Maybe Vec2
  , planeNormalTextureOffset            :: Maybe Vec2
  , planeNormalTextureRepeat            :: Maybe Vec2
  , planeRepeat                         :: Maybe Vec2
  , planeRoughness                      :: Maybe Float
  , planeSegmentsHeight                 :: Maybe Float
  , planeSegmentsWidth                  :: Maybe Float
  , planeSphericalEnvMap                :: Maybe Value
  , planeSrc                            :: Maybe Value
  , planeWidth                          :: Maybe Float
  , planeWireframe                      :: Maybe Bool
  , planeWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultPlaneAttrs :: PlaneAttrs
defaultPlaneAttrs = PlaneAttrs
  { planeAmbientOcclusionMap            = Nothing
  , planeAmbientOcclusionMapIntensity   = Nothing
  , planeAmbientOcclusionTextureOffset  = Nothing
  , planeAmbientOcclusionTextureRepeat  = Nothing
  , planeColor                          = Nothing
  , planeDisplacementBias               = Nothing
  , planeDisplacementMap                = Nothing
  , planeDisplacementScale              = Nothing
  , planeDisplacementTextureOffset      = Nothing
  , planeDisplacementTextureRepeat      = Nothing
  , planeEnvMap                         = Nothing
  , planeFog                            = Nothing
  , planeHeight                         = Nothing
  , planeMetalness                      = Nothing
  , planeNormalMap                      = Nothing
  , planeNormalScale                    = Nothing
  , planeNormalTextureOffset            = Nothing
  , planeNormalTextureRepeat            = Nothing
  , planeRepeat                         = Nothing
  , planeRoughness                      = Nothing
  , planeSegmentsHeight                 = Nothing
  , planeSegmentsWidth                  = Nothing
  , planeSphericalEnvMap                = Nothing
  , planeSrc                            = Nothing
  , planeWidth                          = Nothing
  , planeWireframe                      = Nothing
  , planeWireframeLinewidth             = Nothing
  }

instance ToJSON PlaneAttrs where toJSON = gtoJSONPrimitive

plane :: PlaneAttrs -> Entity action
plane = primitive "a-plane" . attrsFromJSON
