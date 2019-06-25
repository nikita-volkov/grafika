module Grafika.Attributes exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Attributes msg = List (Attribute msg)

width : Int -> Attributes msg
width x = [style "width" (String.fromInt x ++ "px")]

height : Int -> Attributes msg
height x = [style "height" (String.fromInt x ++ "px")]

size : Int -> Int -> Attributes msg
size w h = width w ++ height h

horizontalBlock : Attributes msg
horizontalBlock = [style "display" "inline-block"]

verticalBlock : Attributes msg
verticalBlock = [style "display" "block"]
