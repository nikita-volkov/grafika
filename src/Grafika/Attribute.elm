module Grafika.Attribute exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


width : Int -> Attribute msg
width x = style "width" (String.fromInt x ++ "px")

height : Int -> Attribute msg
height x = style "height" (String.fromInt x ++ "px")

horizontalBlock : Attribute msg
horizontalBlock = style "display" "inline-block"

verticalBlock : Attribute msg
verticalBlock = style "display" "block"
