module Main where

import Keyboard exposing (wasd)
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
import Debug

initialModel : Model
initialModel =
  {position = {x = canvasSize.width * 0.5
              ,y = canvasSize.height * 0.2}
  ,momentum = { dx = 0, dy = 0}
  ,fuel = 30
  ,score = 0}

init : (Model, Effects Action)
init = (initialModel, none)

------------------------------------------------------------

rootView : Address Action -> Model -> Html
rootView channel model = GameView.root model

------------------------------------------------------------

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Tick t -> let newMomentum = { dx = model.momentum.dx
                                , dy = model.momentum.dy + gravity}
                  newPosition = { x = model.position.x + newMomentum.dx
                                , y = model.position.y + newMomentum.dy }
              in if newPosition.y > canvasSize.height
                 then ({initialModel | score <- model.score + (if newMomentum.dy < maxImpactSpeed
                                                               then 1
                                                               else -1)}
                      ,none)
                 else ({model | momentum <- newMomentum
                              , position <- newPosition}
                      ,none)

    Thrust direction -> let newMomentum = { dx = model.momentum.dx + (toFloat direction.x * thrustSize)
                                          , dy = model.momentum.dy - (toFloat direction.y * thrustSize)}
              in if model.fuel > 0
                 then ({model | fuel <- model.fuel - (abs direction.x + abs direction.y)
                              , momentum <- newMomentum}
                      ,none)
                 else (model, none)

------------------------------------------------------------

app : App Model
app = StartApp.start {init = init
                     ,view = rootView
                     ,update = update
                     ,inputs = [Tick <~ fps 25
                               ,Thrust <~ wasd]}

main : Signal Html
main = app.html

port tasks : Signal (Task.Task Never ())
port tasks = app.tasks
