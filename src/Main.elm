module Main where

import StartApp exposing (App)
import Task exposing (Task)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Effects exposing (..)
import Signal exposing (Address)
import GameView
import System exposing (..)
import Time exposing (fps,Time)
import Signal exposing ((<~))

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Tick t -> let newMomentum = { dx = model.momentum.dx
                                , dy = model.momentum.dy + gravity}
                  newPosition = { x = model.position.x + newMomentum.dx
                                , y = model.position.y + newMomentum.dy }
              in if newPosition.y > canvasSize.height
                 then ({model | momentum <- initialMomentum
                              , position <- initialPosition}
                      ,none)
                 else ({model | momentum <- newMomentum
                              , position <- newPosition}
                      ,none)
    _ -> (model, none)

initialPosition : Position
initialPosition =
  {x = canvasSize.width * 0.5
  ,y = canvasSize.height * 0.2}

initialMomentum : Momentum
initialMomentum = { dx = 0, dy = 0}

init : (Model, Effects Action)
init =
  ({position = initialPosition
   ,momentum = initialMomentum
   ,fuel = 100}
  , none)

------------------------------------------------------------

rootView : Address Action -> Model -> Html
rootView channel model =
  div []
      [div []
           [code [] [text (toString model)]]
      ,GameView.root model]

------------------------------------------------------------

app : App Model
app = StartApp.start {init = init
                     ,view = rootView
                     ,update = update
                     ,inputs = [Tick <~ fps 25]}

main : Signal Html
main = app.html

port tasks : Signal (Task.Task Never ())
port tasks = app.tasks
