module Grafika.Ui exposing (..)

import Html exposing (Html, Attribute)
import Html.Attributes as Attribute
import Grafika.CoreExtensions.List as List
import Grafika.String as String
import Markdown


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
      htmlElement Html.div
        [
          Attribute.style "text-align" "left"
        ]

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

centerVertically : Ui msg -> Ui msg
centerVertically ui =
  htmlElement Html.div
    [
      Attribute.style "width" "100%",
      Attribute.style "height" "100%"
    ]
    [
      htmlElement Html.div
        [
          Attribute.style "height" "100%",
          Attribute.style "width" "100%",
          Attribute.style "display" "table"
        ]
        [
          withAttributes
            [
              Attribute.style "display" "table-cell",
              Attribute.style "vertical-align" "middle",
              Attribute.style "width" "100%"
            ]
            ui
            []
        ]
        []
    ]

withAttributes : List (Attribute Never) -> Ui msg -> Ui msg
withAttributes attributes ui extraAttributes = ui (extraAttributes ++ attributes)

withInteractiveAttributes : List (Attribute msg) -> Ui msg -> Ui msg
withInteractiveAttributes attributes ui = 
  html <| \ extraAttributes -> Html.div (extraAttributes ++ attributes) [ui []]

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

uiContainer : (List (Attribute msg) -> List (Html msg) -> Html msg) -> List (Ui msg) -> Ui msg
uiContainer containerHtml childUiList =
  html (\ attributes -> containerHtml attributes (List.map (\ ui -> ui []) childUiList))

markdown : String -> Ui msg
markdown string =
  html (\ extraAttributes -> Markdown.toHtml extraAttributes string)
