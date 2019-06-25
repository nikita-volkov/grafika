module Grafika.Container exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Grafika.Attributes as Attributes


type alias Container msg = List (Html msg) -> Html msg

horizontal : Int -> Int -> Container msg
horizontal width height = div (Attributes.horizontalBlock ++ Attributes.size width height)

vertical : Int -> Int -> Container msg
vertical width height = div (Attributes.verticalBlock ++ Attributes.size width height)
