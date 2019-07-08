module Grafika.Ui exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


{-|
User Interface component.

Defines minimal dimensions at which it can be rendered.
Requires the outer components to inform of the dimensions
at which it's going to be rendered.
Stretches to fill the whole space provided by the container.

Integrating this component with subscription to screen size
will allow to produce composable adaptive UI.
-}
type alias Ui msg =
  {
    minWidth : Int,
    minHeight : Int,
    render : Int -> Int -> Html msg
  }
