{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Ring where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data RingAttrs = RingAttrs
  { ringAmbientOcclusionMap            :: Maybe Value
  , ringAmbientOcclusionMapIntensity   :: Maybe Float
  , ringAmbientOcclusionTextureOffset  :: Maybe Vec2
  , ringAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , ringColor                          :: Maybe Color
  , ringDisplacementBias               :: Maybe Float
  , ringDisplacementMap                :: Maybe Value
  , ringDisplacementScale              :: Maybe Float
  , ringDisplacementTextureOffset      :: Maybe Vec2
  , ringDisplacementTextureRepeat      :: Maybe Vec2
  , ringEnvMap                         :: Maybe Value
  , ringFog                            :: Maybe Bool
  , ringHeight                         :: Maybe Float
  , ringMetalness                      :: Maybe Float
  , ringNormalMap                      :: Maybe Value
  , ringNormalScale                    :: Maybe Vec2
  , ringNormalTextureOffset            :: Maybe Vec2
  , ringNormalTextureRepeat            :: Maybe Vec2
  , ringRadiusInner                    :: Maybe Float
  , ringRadiusOuter                    :: Maybe Float
  , ringRepeat                         :: Maybe Vec2
  , ringRoughness                      :: Maybe Float
  , ringSegmentsPhi                    :: Maybe Float
  , ringSegmentsTheta                  :: Maybe Float
  , ringSphericalEnvMap                :: Maybe Value
  , ringSrc                            :: Maybe Value
  , ringThetaLength                    :: Maybe Float
  , ringThetaStart                     :: Maybe Float
  , ringWidth                          :: Maybe Float
  , ringWireframe                      :: Maybe Bool
  , ringWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultRingAttrs :: RingAttrs
defaultRingAttrs = RingAttrs
  { ringAmbientOcclusionMap            = Nothing
  , ringAmbientOcclusionMapIntensity   = Nothing
  , ringAmbientOcclusionTextureOffset  = Nothing
  , ringAmbientOcclusionTextureRepeat  = Nothing
  , ringColor                          = Nothing
  , ringDisplacementBias               = Nothing
  , ringDisplacementMap                = Nothing
  , ringDisplacementScale              = Nothing
  , ringDisplacementTextureOffset      = Nothing
  , ringDisplacementTextureRepeat      = Nothing
  , ringEnvMap                         = Nothing
  , ringFog                            = Nothing
  , ringHeight                         = Nothing
  , ringMetalness                      = Nothing
  , ringNormalMap                      = Nothing
  , ringNormalScale                    = Nothing
  , ringNormalTextureOffset            = Nothing
  , ringNormalTextureRepeat            = Nothing
  , ringRadiusInner                    = Nothing
  , ringRadiusOuter                    = Nothing
  , ringRepeat                         = Nothing
  , ringRoughness                      = Nothing
  , ringSegmentsPhi                    = Nothing
  , ringSegmentsTheta                  = Nothing
  , ringSphericalEnvMap                = Nothing
  , ringSrc                            = Nothing
  , ringThetaLength                    = Nothing
  , ringThetaStart                     = Nothing
  , ringWidth                          = Nothing
  , ringWireframe                      = Nothing
  , ringWireframeLinewidth             = Nothing
  }

instance ToJSON RingAttrs where toJSON = gtoJSONPrimitive

ring :: RingAttrs -> Entity action
ring = primitive "a-ring" . attrsFromJSON
