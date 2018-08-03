{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Miso.AFrame.Core.Types where

import Data.Aeson (ToJSON(..))
import Data.Char (toLower)
import Data.String (IsString(..))
import GHCJS.Marshal (ToJSVal(..))
import Miso
import Miso.String (MisoString, toMisoString)
import Numeric (showHex)

type Component action = Attribute action

type Entity action = [Component action] -> [View action] -> View action

data Vec2 = Vec2 Float Float

data Vec3 = Vec3 Float Float Float

newtype Milliseconds = Milliseconds Int
  deriving (Eq, Ord, Num, ToJSON)

data Color
  = ColorName MisoString
  | ColorRGB Int Int Int

instance IsString Color where
  fromString = ColorName . toMisoString

data Side
  = SideFront
  | SideBack
  | SideDouble

data LightType
  = Ambient
  | Directional
  | Hemisphere
  | Point
  | Spot
  deriving (Show)

instance ToJSON Vec2 where
  toJSON (Vec2 x y) = toJSON
    (show x ++ " " ++ show y)

instance ToJSON Vec3 where
  toJSON (Vec3 x y z) = toJSON
    (show x ++ " " ++ show y ++ " " ++ show z)

instance ToJSON Color where
  toJSON (ColorName name) = toJSON name
  toJSON (ColorRGB r g b) = toJSON ("#" ++ showHex (65536 * r + 256 * g + b) "")

instance ToJSON Side where
  toJSON SideFront  = toJSON ("front" :: MisoString)
  toJSON SideBack   = toJSON ("back" :: MisoString)
  toJSON SideDouble = toJSON ("double" :: MisoString)

instance ToJSON LightType where
  toJSON = toJSON . (\(c:cs) -> toLower c : cs) . show

instance ToJSVal Vec2         where toJSVal = toJSVal . toJSON
instance ToJSVal Vec3         where toJSVal = toJSVal . toJSON
instance ToJSVal Milliseconds where toJSVal = toJSVal . toJSON
instance ToJSVal Color        where toJSVal = toJSVal . toJSON
instance ToJSVal Side         where toJSVal = toJSVal . toJSON
instance ToJSVal LightType    where toJSVal = toJSVal . toJSON
