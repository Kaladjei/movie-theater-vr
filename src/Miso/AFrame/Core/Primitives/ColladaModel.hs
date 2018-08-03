{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.ColladaModel where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data ColladaModelAttrs = ColladaModelAttrs
  { colladaModelSrc :: Maybe Value
  } deriving (Generic)

defaultColladaModelAttrs :: ColladaModelAttrs
defaultColladaModelAttrs = ColladaModelAttrs
  { colladaModelSrc = Nothing
  }

instance ToJSON ColladaModelAttrs where toJSON = gtoJSONPrimitive

colladaModel :: ColladaModelAttrs -> Entity action
colladaModel = primitive "a-collada-model" . attrsFromJSON
