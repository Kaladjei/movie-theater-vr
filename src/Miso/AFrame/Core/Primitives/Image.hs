{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Image where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data ImageAttrs = ImageAttrs
  { imageColor                          :: Maybe Color
  , imageHeight                         :: Maybe Float
  , imageMetalness                      :: Maybe Float
  , imageOpacity                        :: Maybe Float
  , imageRepeat                         :: Maybe Vec2
  , imageSegmemtsHeight                 :: Maybe Float
  , imageSegmemtsWidth                  :: Maybe Float
  , imageShader                         :: Maybe Value
  , imageSide                           :: Maybe Side
  , imageSrc                            :: Maybe Value
  , imageTransparent                    :: Maybe Bool
  , imageWidth                          :: Maybe Float
  } deriving (Generic)

defaultImageAttrs :: ImageAttrs
defaultImageAttrs = ImageAttrs
  { imageColor             = Nothing
  , imageHeight            = Nothing
  , imageMetalness         = Nothing
  , imageOpacity           = Nothing
  , imageRepeat            = Nothing
  , imageSegmemtsHeight    = Nothing
  , imageSegmemtsWidth     = Nothing
  , imageShader            = Nothing
  , imageSide              = Nothing
  , imageSrc               = Nothing
  , imageTransparent       = Nothing
  , imageWidth             = Nothing
  }

instance ToJSON ImageAttrs where toJSON = gtoJSONPrimitive

image :: ImageAttrs -> Entity action
image = primitive "a-image" . attrsFromJSON
