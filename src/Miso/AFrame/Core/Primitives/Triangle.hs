{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Triangle where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data TriangleAttrs = TriangleAttrs
  { triangleAmbientOcclusionMap            :: Maybe Value
  , triangleAmbientOcclusionMapIntensity   :: Maybe Float
  , triangleAmbientOcclusionTextureOffset  :: Maybe Vec2
  , triangleAmbientOcclusionTextureRepeat  :: Maybe Vec2
  , triangleColor                          :: Maybe Color
  , triangleDisplacementBias               :: Maybe Float
  , triangleDisplacementMap                :: Maybe Value
  , triangleDisplacementScale              :: Maybe Float
  , triangleDisplacementTextureOffset      :: Maybe Vec2
  , triangleDisplacementTextureRepeat      :: Maybe Vec2
  , triangleEnvMap                         :: Maybe Value
  , triangleFog                            :: Maybe Bool
  , triangleHeight                         :: Maybe Float
  , triangleMetalness                      :: Maybe Float
  , triangleNormalMap                      :: Maybe Value
  , triangleNormalScale                    :: Maybe Vec2
  , triangleNormalTextureOffset            :: Maybe Vec2
  , triangleNormalTextureRepeat            :: Maybe Vec2
  , triangleRepeat                         :: Maybe Vec2
  , triangleRoughness                      :: Maybe Float
  , triangleSphericalEnvMap                :: Maybe Value
  , triangleSrc                            :: Maybe Value
  , triangleVertexA                        :: Maybe Vec3
  , triangleVertexB                        :: Maybe Vec3
  , triangleVertexC                        :: Maybe Vec3
  , triangleWidth                          :: Maybe Float
  , triangleWireframe                      :: Maybe Bool
  , triangleWireframeLinewidth             :: Maybe Float
  } deriving (Generic)

defaultTriangleAttrs :: TriangleAttrs
defaultTriangleAttrs = TriangleAttrs
  { triangleAmbientOcclusionMap            = Nothing
  , triangleAmbientOcclusionMapIntensity   = Nothing
  , triangleAmbientOcclusionTextureOffset  = Nothing
  , triangleAmbientOcclusionTextureRepeat  = Nothing
  , triangleColor                          = Nothing
  , triangleDisplacementBias               = Nothing
  , triangleDisplacementMap                = Nothing
  , triangleDisplacementScale              = Nothing
  , triangleDisplacementTextureOffset      = Nothing
  , triangleDisplacementTextureRepeat      = Nothing
  , triangleEnvMap                         = Nothing
  , triangleFog                            = Nothing
  , triangleHeight                         = Nothing
  , triangleMetalness                      = Nothing
  , triangleNormalMap                      = Nothing
  , triangleNormalScale                    = Nothing
  , triangleNormalTextureOffset            = Nothing
  , triangleNormalTextureRepeat            = Nothing
  , triangleRepeat                         = Nothing
  , triangleRoughness                      = Nothing
  , triangleSphericalEnvMap                = Nothing
  , triangleSrc                            = Nothing
  , triangleVertexA                        = Nothing
  , triangleVertexB                        = Nothing
  , triangleVertexC                        = Nothing
  , triangleWidth                          = Nothing
  , triangleWireframe                      = Nothing
  , triangleWireframeLinewidth             = Nothing
  }

instance ToJSON TriangleAttrs where toJSON = gtoJSONPrimitive

triangle :: TriangleAttrs -> Entity action
triangle = primitive "a-triangle" . attrsFromJSON
