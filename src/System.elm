module System where

import Time exposing (..)

type Action
  = Thrust {x : Int, y : Int}
  | Tick Time

type alias Size =
  { width : Float
  , height : Float}

type alias Position =
  { x : Float
  , y : Float}

type alias Momentum =
  { dx : Float
  , dy : Float}

type alias Model =
  {fuel : Int
  ,score : Int
  ,position : Position
  ,momentum : Momentum}

canvasSize : Size
canvasSize = { width = 800, height = 600}

gravity : Float
gravity = 0.3

thrustSize : Float
thrustSize = 3.0

maxImpactSpeed : Float
maxImpactSpeed = 10

initialModel : Model
initialModel =
  {position = {x = canvasSize.width * 0.5
              ,y = canvasSize.height * 0.2}
  ,momentum = { dx = 0, dy = 0}
  ,fuel = 30
  ,score = 0}
