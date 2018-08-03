{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Curvedimage where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data CurvedimageAttrs = CurvedimageAttrs
  { curvedimageColor                          :: Maybe Color
  , curvedimageHeight                         :: Maybe Float
  , curvedimageMetalness                      :: Maybe Float
  , curvedimageOpacity                        :: Maybe Float
  , curvedimageOpenEnded                      :: Maybe Bool
  , curvedimageRadius                         :: Maybe Float
  , curvedimageRepeat                         :: Maybe Vec2
  , curvedimageRoughness                      :: Maybe Float
  , curvedimageSegmentsHeight                 :: Maybe Float
  , curvedimageSegmentsRadial                 :: Maybe Float
  , curvedimageShader                         :: Maybe Value
  , curvedimageSide                           :: Maybe Side
  , curvedimageSrc                            :: Maybe Value
  , curvedimageThetaLength                    :: Maybe Float
  , curvedimageThetaStart                     :: Maybe Float
  , curvedimageTransparent                    :: Maybe Bool
  } deriving (Generic)

defaultCurvedimageAttrs :: CurvedimageAttrs
defaultCurvedimageAttrs = CurvedimageAttrs
  { curvedimageColor                          = Nothing
  , curvedimageHeight                         = Nothing
  , curvedimageMetalness                      = Nothing
  , curvedimageOpacity                        = Nothing
  , curvedimageOpenEnded                      = Nothing
  , curvedimageRadius                         = Nothing
  , curvedimageRepeat                         = Nothing
  , curvedimageRoughness                      = Nothing
  , curvedimageSegmentsHeight                 = Nothing
  , curvedimageSegmentsRadial                 = Nothing
  , curvedimageShader                         = Nothing
  , curvedimageSide                           = Nothing
  , curvedimageSrc                            = Nothing
  , curvedimageThetaLength                    = Nothing
  , curvedimageThetaStart                     = Nothing
  , curvedimageTransparent                    = Nothing
  }

instance ToJSON CurvedimageAttrs where toJSON = gtoJSONPrimitive

curvedimage :: CurvedimageAttrs -> Entity action
curvedimage = primitive "a-curvedimage" . attrsFromJSON
