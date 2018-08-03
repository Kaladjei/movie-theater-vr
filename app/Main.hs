{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Main where

import Data.Aeson (Value)
import Miso hiding (text)
import Miso.String hiding (map, concatMap)
import Miso.AFrame
import Miso.AFrame.Core

type Model = Maybe Value

initialModel :: Model
initialModel = Nothing

data Action
  = NoOp
  | Display Value

main :: IO ()
main = startApp App {..}
  where
    initialAction = NoOp
    update        = updateModel
    model         = initialModel
    view          = viewModel
    events        = defaultEvents
    subs          = []
    mountPoint    = Nothing

updateModel :: Action -> Model -> Effect Action Model
updateModel NoOp model = noEff model
updateModel (Display val) _ = noEff $ Just val

viewModel :: Model -> View Action
viewModel model = scene [] $
  [ assets Nothing
      [ img "stars" "assets/stars.jpg"
      , img "floor" "assets/floor.jpg"
      , img "wall" "assets/wall.jpg"
      , img "door" "assets/door.png"
      , img "exit-sign" "assets/exit-sign.png"
      , video "movie" "assets/motivation.mp4"
      , assetItem "sofa" "assets/sofa.gltf"
      ]
  , camera defaultCameraAttrs
      { cameraLookControlsEnabled = Just True
      , cameraWasdControlsEnabled = Just True
      }
      [ position $ Vec3 0 1.7 7.5
      ] []
  , theaterFloor "#floor"
  , theaterCeiling "#stars"
  , frontWall
  , backWall
  , sideWall 11
  , sideWall (-11)
  , molding $ Vec3 (-10.75) 0.5 2
  , molding $ Vec3 10.75 0.5 2
  , molding $ Vec3 (-10.75) 12.5 2
  , molding $ Vec3 10.75 12.5 2
  , door
  , exitSign
  , box defaultBoxAttrs
      { boxDepth  = Just 2
      , boxHeight = Just 16
      , boxWidth  = Just 18
      , boxColor  = Just $ ColorName "#000"
      }
      [ position $ Vec3 0 2.8 (-9.1)
      , prop "material" ("shader: standard" :: MisoString)
      ] []
  , videoPrimitive defaultVideoAttrs
      { videoSrc = Just "#movie"
      , videoWidth = Just 19
      , videoHeight = Just 11
      }
      [ position $ Vec3 0 5.5 (-8)
      , prop "autoplay" True
      ] []
  , gltfModel defaultGltfModelAttrs
      { gltfModelSrc = Just "#sofa"
      }
      [ scale $ sym Vec3 1
      , position $ Vec3 0 0.35 7.6
      , rotation $ Vec3 0 90 0
      ] []
  , sky defaultSkyAttrs { skyColor = Just $ ColorName "#000" } [] []
  ] ++ pillars
    ++ sconces
    ++ speakers

theaterFloor :: Value -> View Action
theaterFloor tFloor = plane defaultPlaneAttrs
  { planeHeight    = Just 24
  , planeWidth     = Just 22
  , planeRoughness = Just 1
  , planeSrc       = Just tFloor
  }
  [ rotation $ Vec3 (-90) 0 0
  , position $ Vec3 0 0.5 2
  ] []

theaterCeiling :: Value -> View Action
theaterCeiling stars = box defaultBoxAttrs
  { boxDepth  = Just 0.1
  , boxHeight = Just 24
  , boxWidth  = Just 22
  , boxSrc    = Just stars
  }
  [ position $ Vec3 0 (12.5) 2
  , rotation $ Vec3 (-90) 0 0
  , prop "material" ("shader: standard; side: bottom" :: MisoString)
  ] []

frontWall :: View Action
frontWall = box defaultBoxAttrs
  { boxDepth  = Just 0.1
  , boxHeight = Just 12
  , boxWidth  = Just 22
  , boxColor  = Just $ ColorName "#000"
  }
  [ position $ Vec3 0 6.5 (-10)
  , prop "material" ("shader: standard" :: MisoString)
  ] []

backWall :: View Action
backWall = box defaultBoxAttrs
  { boxDepth  = Just 0.1
  , boxHeight = Just 12
  , boxWidth  = Just 22
  , boxColor  = Just $ ColorName "#000"
  }
  [ position $ Vec3 0 6.5 14
  , prop "material" ("shader: standard" :: MisoString)
  ] []

sideWall :: Float -> View Action
sideWall xPos    = box defaultBoxAttrs
  { boxDepth     = Just 0.1
  , boxHeight    = Just 12
  , boxWidth     = Just 24
  , boxRoughness = Just 1
  , boxSrc       = Just "#wall"
  }
  [ position $ Vec3 xPos 6.5 2
  , rotation $ Vec3 0 90 0
  , prop "material" ("shader: standard" :: MisoString)
  ] []

molding :: Vec3 -> View Action
molding pos = box defaultBoxAttrs
  { boxDepth     = Just 0.5
  , boxHeight    = Just 0.5
  , boxWidth     = Just 24
  , boxMetalness = Just 0.5
  , boxColor     = Just $ ColorName "#000"
  }
  [ position pos
  , rotation $ Vec3 0 90 0
  , prop "material" ("shader: standard" :: MisoString)
  ] []

pillar :: Vec3 -> View Action
pillar pos = box defaultBoxAttrs
  { boxDepth     = Just 0.5
  , boxHeight    = Just 12
  , boxWidth     = Just 1
  , boxMetalness = Just 0.5
  , boxColor     = Just $ ColorName "#000"
  }
  [ position pos
  , rotation $ Vec3 0 90 0
  , prop "material" ("shader: standard" :: MisoString)
  ] []

pillars :: [View Action]
pillars = concatMap drawPillars [-5, 0, 5, 10]
  where
    drawPillars z = map (\x -> pillar $ Vec3 x 6.5 z) [-10.8, 10.8]

sconce :: Vec3 -> View Action
sconce pos = cylinder defaultCylinderAttrs
  { cylinderRadiusTop    = Just 0.2
  , cylinderRadiusBottom = Just 0.2
  , cylinderHeight       = Just 0.5
  , cylinderWidth        = Just 0.2
  , cylinderOpenEnded    = Just False
  , cylinderMetalness    = Just 0.5
  , cylinderColor        = Just $ ColorName "#26030d"
  }
  [ position pos
  , scale $ Vec3 0.25 1 0.2
  , prop "material" ("shader: standard" :: MisoString)
  ] []

sconces :: [View Action]
sconces = concatMap drawSconces [-2.5, 2.5, 7.5]
  where
    drawSconces z = map (\x -> sconce $ Vec3 x 9.5 z) [-10.7, 10.7]

speaker :: Vec3 -> Vec3 -> View Action
speaker pos rot = box defaultBoxAttrs
  { boxDepth     = Just 0.5
  , boxHeight    = Just 1
  , boxWidth     = Just 0.7
  , boxRoughness = Just 0.7
  , boxColor     = Just $ ColorName "#000"
  }
  [ position pos
  , rotation rot
  , prop "material" ("shader: standard" :: MisoString)
  ] []

speakers :: [View Action]
speakers = concatMap drawSpeakers [-7.5, 12]
  where
    drawSpeakers z = map (\x -> speaker (Vec3 x 9.5 z) $ rot x) [-10.5, 10.5]
    rot x = Vec3 ((negate $ signum x) * 10) 90 0

door :: View Action
door = plane defaultPlaneAttrs
  { planeHeight      = Just 2
  , planeWidth       = Just 1
  , planeSrc         = Just "#door"
  }
  [ position $ Vec3 5 1.5 13.93
  , prop "material" ("shader: flat; side: back; transparent: true" :: MisoString)
  ] []

exitSign :: View Action
exitSign = plane defaultPlaneAttrs
  { planeHeight      = Just 0.5
  , planeWidth       = Just 0.6
  , planeSrc         = Just "#exit-sign"
  }
  [ position $ Vec3 5 3.5 13.93
  , prop "material" ("shader: flat; side: back; transparent: true" :: MisoString)
  ] []

-- helpers

sym :: (a -> a -> a -> b) -> a -> b
sym f a = f a a a
