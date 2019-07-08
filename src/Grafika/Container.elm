module Grafika.Container exposing (..)

import Html exposing (..)
import Grafika.Attribute as Attr


type alias Container msg = List (Html msg) -> Html msg

horizontal : Int -> Int -> Container msg
horizontal width height = div [Attr.horizontalBlock, Attr.width width, Attr.height height]

vertical : Int -> Int -> Container msg
vertical width height = div [Attr.verticalBlock, Attr.width width, Attr.height height]
