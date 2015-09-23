module GameView where

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html exposing (Html)
import System exposing (..)

root : Model -> Html
root model =
  svg [width (toString canvasSize.width)
      ,height (toString canvasSize.height)]
      [rect [x (toString model.position.x)
            ,y (toString model.position.y)
            ,width "20px"
            ,height "20px"
            ,fill "black"]
            []]
