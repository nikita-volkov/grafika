module Grafika.Ui exposing (..)

import Html exposing (Html, Attribute)
import Html.Attributes as Attribute
import Grafika.CoreExtensions.List as List
import Grafika.String as String


{-|
User Interface component.
-}
type alias Ui msg = List (Attribute Never) -> Html msg

empty : Ui msg
empty _ = Html.text ""

row : Int -> List (Ui msg) -> Ui msg
row spacing children =
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
          Attribute.style "margin-left" (String.intPx spacing)
        ]
    in
      List.mapHeadAndTail wrapHead wrapTail children |>
      htmlContainer Html.div

column : Int -> List (Ui msg) -> Ui msg
column spacing children =
  let
    wrapHead ui = ui []
    wrapTail ui =
      ui
        [
          Attribute.style "margin-top" (String.intPx spacing)
        ]
    in
      List.mapHeadAndTail wrapHead wrapTail children |>
      htmlContainer Html.div

pad : Int -> Int -> Int -> Int -> Ui msg -> Ui msg
pad top right bottom left =
  withAttributes
    [
      Attribute.style "margin" (String.intPx4d top right bottom left)
    ]

centerHorizontally : Ui msg -> Ui msg
centerHorizontally ui =
  htmlElement Html.div
    [
      Attribute.style "text-align" "center"
    ]
    [
      withAttributes
        [
          Attribute.style "display" "inline-block"
        ]
        ui
        []
    ]

withAttributes : List (Attribute Never) -> Ui msg -> Ui msg
withAttributes attributes ui extraAttributes = ui (extraAttributes ++ attributes)

text : String -> Ui msg
text x = html (\ extraAttributes -> Html.div extraAttributes [Html.text x])

map : (a -> b) -> Ui a -> Ui b
map aToB uiA = uiA >> Html.map aToB

html : (List (Attribute msg) -> Html msg) -> Ui msg
html attributesToHtml neverAttributes = List.map (Attribute.map never) neverAttributes |> attributesToHtml

htmlElement : (List (Attribute msg) -> List (Html msg) -> Html msg) -> List (Attribute msg) -> List (Html msg) -> Ui msg
htmlElement containerHtml attributeList childHtmlList =
  html (\ extraAttributes -> containerHtml (extraAttributes ++ attributeList) childHtmlList)

htmlContainer : (List (Attribute msg) -> List (Html msg) -> Html msg) -> List (Html msg) -> Ui msg
htmlContainer containerHtml childHtmlList =
  html (\ extraAttributes -> containerHtml extraAttributes childHtmlList)
