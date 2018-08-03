{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Miso.AFrame.Core.Primitives.GltfModel where

import Data.Aeson (ToJSON(..), Value)
import GHC.Generics (Generic)

import Miso.AFrame.Core.Types
import Miso.AFrame.Core.Internal.Utils

data GltfModelAttrs = GltfModelAttrs
  { gltfModelSrc :: Maybe Value
  } deriving (Generic)

defaultGltfModelAttrs :: GltfModelAttrs
defaultGltfModelAttrs = GltfModelAttrs
  { gltfModelSrc = Nothing
  }

instance ToJSON GltfModelAttrs where toJSON = gtoJSONPrimitive

gltfModel :: GltfModelAttrs -> Entity action
gltfModel = primitive "a-gltf-model" . attrsFromJSON
