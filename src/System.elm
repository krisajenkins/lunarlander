module System where

import Time exposing (..)

canvasSize : Size
canvasSize = { width = 400, height = 600}

gravity : Float
gravity = 0.3

type Action
  = Thrust
  | TurnLeft
  | TurnRight
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
  {position : Position
  ,momentum : Momentum
  ,fuel : Int}
