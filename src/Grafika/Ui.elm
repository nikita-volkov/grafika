module Grafika.Ui exposing (..)

import Html exposing (Html, Attribute)
import Html.Attributes as Attribute
import Grafika.CoreExtensions.List as List
import Grafika.String as String


{-|
User Interface component.
-}
type alias Ui msg = List (Attribute msg) -> Html msg

empty : Ui msg
empty _ = Html.text ""

row : Int -> List (Ui msg) -> Ui msg
row spacing children attributes =
  let
    wrapHead ui =
      ui
        [
          Attribute.style "display" "inline-block"
        ]
    wrapTail ui =
      ui
        [
          Attribute.style "display" "inline-block",
          Attribute.style "margin-left" (String.fromInt spacing ++ "px")
        ]
    in
      List.mapHeadAndTail wrapHead wrapTail children |>
      Html.div attributes

column : Int -> List (Ui msg) -> Ui msg
column spacing children attributes =
  let
    wrapHead ui = ui []
    wrapTail ui =
      ui
        [
          Attribute.style "margin-top" (String.fromInt spacing ++ "px")
        ]
    in
      List.mapHeadAndTail wrapHead wrapTail children |>
      Html.div attributes

pad : Int -> Int -> Int -> Int -> Ui msg -> Ui msg
pad top right bottom left ui attributes =
  ui
    (
      Attribute.style "margin" (String.intPx4d top right bottom left) ::
      attributes
    )

withAttributes : List (Attribute msg) -> Ui msg -> Ui msg
withAttributes attributes ui extraAttributes = ui (extraAttributes ++ attributes)

text : String -> Ui msg
text x _ = Html.text x
