module Grafika.Ui exposing (..)

import Html exposing (Html, Attribute)
import Html.Attributes as Attribute


{-|
User Interface component.

Defines minimal dimensions at which it can be rendered.
Requires the outer components to inform of the dimensions
at which it should be rendered.
Stretches to fill the whole space provided by the container.

Integrating this component with subscription to screen size
allows to produce composable adaptive UI.
-}
type alias Ui msg =
  {
    minWidth : Int,
    minHeight : Int,
    render : Int -> Int -> List (Attribute msg) -> Html msg
  }

type alias Screen =
  {
    screenWidth : Int,
    screenHeight : Int,
    -- https://developer.mozilla.org/en-US/docs/Web/API/Window/devicePixelRatio
    density : Float
  }

empty : Ui msg
empty = Ui 0 0 (\ _ _ extraAttributes -> Html.div extraAttributes [])

{-|
This is a sketch, showing how to implement spacing,
but it doesn't do anything about the available dimensions.
-}
horizontally : Int -> List (Ui msg) -> Ui msg
horizontally spacing list =
  let
    amount = List.length list
    minWidth = List.sum (List.map .minWidth list) + (max 0 (amount - 1) * spacing)
    minHeight = list |> List.map .minHeight |> List.maximum |> Maybe.withDefault 0
    render width height extraAttributes =
      let
        nodes uiList = case uiList of
          ui :: uiTail -> ui.render width height [] :: nodesAfterHead uiTail
          _ -> []
        nodesAfterHead = List.map <| \ ui -> ui.render width height [Attribute.style "margin-left" (String.fromInt spacing ++ "px")] 
        in Html.div extraAttributes (nodes list)
    in Ui minWidth minHeight render

{-|
Precede an element horizontally, clipping the preceding element first.
-}
precedeH : Int -> Ui msg -> Ui msg -> Ui msg
precedeH spacing = Debug.todo ""

{-|
Succeed an element horizontally, clipping the succeeding element first.
-}
succeedH : Int -> Ui msg -> Ui msg -> Ui msg
succeedH spacing = Debug.todo ""

centerH : Ui msg -> Ui msg
centerH = precedeH 0 empty >> succeedH 0 empty

alignRight : Ui msg -> Ui msg
alignRight = precedeH 0 empty

alignLeft : Ui msg -> Ui msg
alignLeft = succeedH 0 empty
