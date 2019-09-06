module Grafika.Html exposing (..)
{-|
Wraps the typical patterns in HTML.
-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Grafika.CoreExtensions.List as List
import Grafika.CssValue as CssValue
import Markdown


foldMapMaybe : (a -> Html msg) -> Maybe a -> Html msg
foldMapMaybe proj maybeA = case maybeA of
  Just a -> proj a
  Nothing -> text ""

foldMaybe : Maybe (Html msg) -> Html msg
foldMaybe = Maybe.withDefault (text "")

empty : Html msg
empty = text ""

row : Int -> List (Html msg) -> Html msg
row spacing children =
  let
    wrapHead html =
      div
        [
          style "height" "100%",
          style "display" "inline-block"
        ]
        [
          html
        ]
    wrapTail html =
      div
        [
          style "height" "100%",
          style "display" "inline-block",
          style "margin-left" (CssValue.intPx spacing)
        ]
        [
          html
        ]
    in
      List.mapHeadAndTail wrapHead wrapTail children |>
      Html.div
        [
          style "text-align" "left"
        ]

column : Int -> List (Html msg) -> Html msg
column spacing children =
  let
    wrapTail html =
      div
        [
          style "margin-top" (CssValue.intPx spacing)
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
      style "text-align" "center"
    ]
    [
      div
        [
          style "display" "inline-block"
        ]
        [html]
    ]

centerVertically : Html a -> Html a
centerVertically =
  List.singleton >>
  div
    [
      style "height" "100%",
      style "width" "100%",
      style "display" "flex",
      style "align-items" "center"
    ]

attributed : Html msg -> List (Attribute msg) -> Html msg
attributed child attributes = div attributes [child]

stylesheet : String -> Html msg
stylesheet css =
  node "style"
    [
      rel "stylesheet",
      type_ "text/css"
    ]
    [
      text css
    ]

markdown : List (Attribute msg) -> String -> Html msg
markdown = Markdown.toHtml

{-|
Sequence horizontally giving space preference to the element on the left.
-}
sequenceHorizontallyToLeft : Int -> List (Html a) -> Html a
sequenceHorizontallyToLeft spacing =
  let
    wrapHead html =
      div
        [
          style "flex-grow" "1",
          style "height" "100%"
        ]
        [
          html
        ]
    wrapTail html =
      div
        [
          style "height" "100%",
          style "margin-left" (CssValue.intPx spacing)
        ]
        [
          html
        ]
    in
      List.mapHeadAndTail wrapHead wrapTail >>
      div
        [
          style "display" "flex",
          style "justify-content" "space-between",
          style "width" "100%",
          style "height" "100%"
        ]
