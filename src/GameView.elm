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
            ,fill "blue"]
            []
      ,rect [key "bounds"
            ,x "0"
            ,y "0"
            ,width (toString canvasSize.width)
            ,height (toString canvasSize.height)
            ,fill "none"
            ,stroke "black"
            ,strokeWidth "2"]
            []
      ,text' [x "50"
             ,y "50"
             ,fill "blueviolet"
             ,Svg.Attributes.style "text-anchor: middle; font-size: 50px"]
             [text (toString model.score)]
      ,text' [x (toString (canvasSize.width - 50))
             ,y "50"
             ,fill "mauve"
             ,Svg.Attributes.style "text-anchor: middle; font-size: 50px"]
             [text (toString model.fuel)]
             ]
