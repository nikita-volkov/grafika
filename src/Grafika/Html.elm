module Grafika.Html exposing (..)
{-|
Wraps the typical patterns in HTML.
-}

import Html exposing (..)
import Html.Attributes as Attribute
import Grafika.CoreExtensions.List as List
import Grafika.String as String
import Markdown


empty : Html msg
empty = text ""

row : Int -> List (Html msg) -> Html msg
row spacing children =
  let
    wrapHead html =
      div
        [
          Attribute.style "display" "inline-block"
        ]
        [
          html
        ]
    wrapTail html =
      div
        [
          Attribute.style "display" "inline-block",
          Attribute.style "margin-left" (String.intPx spacing)
        ]
        [
          html
        ]
    in
      List.mapHeadAndTail wrapHead wrapTail children |>
      Html.div
        [
          Attribute.style "text-align" "left"
        ]

column : Int -> List (Html msg) -> Html msg
column spacing children =
  let
    wrapTail html =
      div
        [
          Attribute.style "margin-top" (String.intPx spacing)
        ]
        [
          html
        ]
    in
      List.mapTail wrapTail children |>
      Html.div []

centerHorizontally : Html msg -> Html msg
centerHorizontally html =
  div
    [
      Attribute.style "text-align" "center"
    ]
    [
      div
        [
          Attribute.style "display" "inline-block"
        ]
        [html]
    ]

centerVertically : Html msg -> Html msg
centerVertically html =
  div
    [
      Attribute.style "width" "100%",
      Attribute.style "height" "100%"
    ]
    [
      div
        [
          Attribute.style "height" "100%",
          Attribute.style "width" "100%",
          Attribute.style "display" "table"
        ]
        [
          div
            [
              Attribute.style "display" "table-cell",
              Attribute.style "vertical-align" "middle",
              Attribute.style "width" "100%"
            ]
            [html]
        ]
    ]

attributed : Html msg -> List (Attribute msg) -> Html msg
attributed child attributes = div attributes [child]

stylesheet : String -> Html msg
stylesheet css =
  node "style"
    [
      Attribute.rel "stylesheet",
      Attribute.type_ "text/css"
    ]
    [
      text css
    ]

markdown : List (Attribute msg) -> String -> Html msg
markdown = Markdown.toHtml
