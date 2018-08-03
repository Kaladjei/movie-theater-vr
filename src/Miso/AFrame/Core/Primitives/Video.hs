{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Video where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data VideoAttrs = VideoAttrs
  { videoColor          :: Maybe Color
  , videoHeight         :: Maybe Float
  , videoMetalness      :: Maybe Float
  , videoOpacity        :: Maybe Float
  , videoRepeat         :: Maybe Vec2
  , videoRoughness      :: Maybe Float
  , videoSegmentsHeight :: Maybe Float
  , videoSegmentsWidth  :: Maybe Float
  , videoShader         :: Maybe Value
  , videoSide           :: Maybe Side
  , videoSrc            :: Maybe Value
  , videoTransparent    :: Maybe Bool
  , videoWidth          :: Maybe Float
  } deriving (Generic)

defaultVideoAttrs :: VideoAttrs
defaultVideoAttrs = VideoAttrs
  { videoColor          = Nothing
  , videoHeight         = Nothing
  , videoMetalness      = Nothing
  , videoOpacity        = Nothing
  , videoRepeat         = Nothing
  , videoRoughness      = Nothing
  , videoSegmentsHeight = Nothing
  , videoSegmentsWidth  = Nothing
  , videoShader         = Nothing
  , videoSide           = Nothing
  , videoSrc            = Nothing
  , videoTransparent    = Nothing
  , videoWidth          = Nothing
  }

instance ToJSON VideoAttrs where toJSON = gtoJSONPrimitive

videoPrimitive :: VideoAttrs -> Entity action
videoPrimitive = primitive "a-video" . attrsFromJSON
