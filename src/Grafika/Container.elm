module Grafika.Container exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Container msg = List (Html msg) -> Html msg

horizontal : Int -> Int -> Container msg
horizontal width height =
  div
    [
      style "display" "inline-block",
      style "width" (String.fromInt width ++ "px"),
      style "height" (String.fromInt height ++ "px")
    ]

vertical : Int -> Int -> Container msg
vertical width height =
  div
    [
      style "display" "block",
      style "width" (String.fromInt width ++ "px"),
      style "height" (String.fromInt height ++ "px")
    ]
