module Main where

import StartApp exposing (App)
import Task exposing (Task)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Effects exposing (..)
import Signal exposing (Address)

type Action
  = Thrust

type alias Model =
  {}

update : Action -> Model -> (Model, Effects Action)
update action model =
  (model, none)

init : (Model, Effects Action)
init = ({}, none)

rootView : Address Action -> Model -> Html
rootView channel model =
  div []
      [code [] [text (toString model)]
      ,h1 [] [text "Lunar Lander"]]

app : App Model
app = StartApp.start {init = init
                     ,view = rootView
                     ,update = update
                     ,inputs = []}

main : Signal Html
main = app.html

port tasks : Signal (Task.Task Never ())
port tasks = app.tasks
