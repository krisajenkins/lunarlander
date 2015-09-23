module System where

import Time exposing (..)

canvasSize : Size
canvasSize = { width = 400, height = 600}

gravity : Float
gravity = 0.3

thrustSize : Float
thrustSize = 5

type Action
  = Thrust
  | TurnLeft
  | TurnRight
  | Tick Time
  | UnknownControl

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
