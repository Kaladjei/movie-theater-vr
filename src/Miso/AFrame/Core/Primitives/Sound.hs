{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.Sound where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data SoundAttrs = SoundAttrs
  { soundAutoplay :: Maybe Bool
  , soundLoop     :: Maybe Bool
  , soundOn       :: Maybe Value
  , soundSrc      :: Maybe Value
  , soundVolume   :: Maybe Float
  } deriving (Generic)

defaultSoundAttrs :: SoundAttrs
defaultSoundAttrs = SoundAttrs
  { soundAutoplay = Nothing
  , soundLoop     = Nothing
  , soundOn       = Nothing
  , soundSrc      = Nothing
  , soundVolume   = Nothing
  }

instance ToJSON SoundAttrs where toJSON = gtoJSONPrimitive

sound :: SoundAttrs -> Entity action
sound = primitive "a-sound" . attrsFromJSON
