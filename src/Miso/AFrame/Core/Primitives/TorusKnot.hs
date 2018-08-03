{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.TorusKnot where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data TorusKnotAttrs = TorusKnotAttrs
  { torusKnotAmbientOcclusionMap            :: Maybe Value
  , torusKnotAmbientOcclusionMapIntensity   :: Maybe Float
  , torusKnotAmbientOcclusionTextureOffset  :: Maybe Vec2
  , torusKnotAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , torusKnotColor                          :: Maybe Color
  , torusKnotDisplacementBias               :: Maybe Float
  , torusKnotDisplacementMap                :: Maybe Value
  , torusKnotDisplacementScale              :: Maybe Float
  , torusKnotDisplacementTextureOffset      :: Maybe Vec2
  , torusKnotDisplacementTextureRepeat      :: Maybe Vec2
  , torusKnotEnvMap                         :: Maybe Value
  , torusKnotFog                            :: Maybe Bool
  , torusKnotHeight                         :: Maybe Float
  , torusKnotMetalness                      :: Maybe Float
  , torusKnotNormalMap                      :: Maybe Value
  , torusKnotNormalScale                    :: Maybe Vec2
  , torusKnotNormalTextureOffset            :: Maybe Vec2
  , torusKnotNormalTextureRepeat            :: Maybe Vec2
  , torusKnotP                              :: Maybe Float
  , torusKnotQ                              :: Maybe Float
  , torusKnotRadius                         :: Maybe Float
  , torusKnotRadiusTubular                  :: Maybe Float
  , torusKnotRepeat                         :: Maybe Vec2
  , torusKnotRoughness                      :: Maybe Float
  , torusKnotSegmentsRadial                 :: Maybe Float
  , torusKnotSegmentsTubular                :: Maybe Float
  , torusKnotSphericalEnvMap                :: Maybe Value
  , torusKnotSrc                            :: Maybe Value
  , torusKnotWidth                          :: Maybe Float
  , torusKnotWireframe                      :: Maybe Bool
  , torusKnotWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultTorusKnotAttrs :: TorusKnotAttrs
defaultTorusKnotAttrs = TorusKnotAttrs
  { torusKnotAmbientOcclusionMap            = Nothing
  , torusKnotAmbientOcclusionMapIntensity   = Nothing
  , torusKnotAmbientOcclusionTextureOffset  = Nothing
  , torusKnotAmbientOcclusionTextureRepeat  = Nothing
  , torusKnotColor                          = Nothing
  , torusKnotDisplacementBias               = Nothing
  , torusKnotDisplacementMap                = Nothing
  , torusKnotDisplacementScale              = Nothing
  , torusKnotDisplacementTextureOffset      = Nothing
  , torusKnotDisplacementTextureRepeat      = Nothing
  , torusKnotEnvMap                         = Nothing
  , torusKnotFog                            = Nothing
  , torusKnotHeight                         = Nothing
  , torusKnotMetalness                      = Nothing
  , torusKnotNormalMap                      = Nothing
  , torusKnotNormalScale                    = Nothing
  , torusKnotNormalTextureOffset            = Nothing
  , torusKnotNormalTextureRepeat            = Nothing
  , torusKnotP                              = Nothing
  , torusKnotQ                              = Nothing
  , torusKnotRadius                         = Nothing
  , torusKnotRadiusTubular                  = Nothing
  , torusKnotRepeat                         = Nothing
  , torusKnotRoughness                      = Nothing
  , torusKnotSegmentsRadial                 = Nothing
  , torusKnotSegmentsTubular                = Nothing
  , torusKnotSphericalEnvMap                = Nothing
  , torusKnotSrc                            = Nothing
  , torusKnotWidth                          = Nothing
  , torusKnotWireframe                      = Nothing
  , torusKnotWireframeLinewidth             = Nothing
  }

instance ToJSON TorusKnotAttrs where toJSON = gtoJSONPrimitive

torusKnot :: TorusKnotAttrs -> Entity action
torusKnot = primitive "a-torus-knot" . attrsFromJSON
