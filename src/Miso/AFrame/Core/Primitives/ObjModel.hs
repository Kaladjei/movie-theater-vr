{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.ObjModel where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data ObjModelAttrs = ObjModelAttrs
  { objModelSrc :: Maybe Value
  , objModelMtl :: Maybe Value
  } deriving (Generic)

defaultObjModelAttrs :: ObjModelAttrs
defaultObjModelAttrs = ObjModelAttrs
  { objModelSrc = Nothing
  , objModelMtl = Nothing
  }

instance ToJSON ObjModelAttrs where toJSON = gtoJSONPrimitive

objModel :: ObjModelAttrs -> Entity action
objModel = primitive "a-obj-model" . attrsFromJSON
