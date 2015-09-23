module GameView where

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (key)
import System exposing (..)

root : Model -> Html
root model =
  svg [width (toString canvasSize.width)
      ,height (toString canvasSize.height)]
      [rect [key "ship"
            ,x ((toString model.position.x))
            ,y ((toString model.position.y))
            ,width "20px"
            ,height "20px"
            ,fill "black"]
            []]
