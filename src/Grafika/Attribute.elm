module Grafika.Attribute exposing (..)

import Html.Attributes exposing (..)
import Grafika.Units exposing (..)
import Html exposing (Attribute)
import Color exposing (Color)
import Grafika.CssValue as CssValue


width : Length -> Attribute msg
width = style "width" << CssValue.length

height : Length -> Attribute msg
height = style "height" << CssValue.length

fontSize : Length -> Attribute msg
fontSize = style "font-size" << CssValue.length

background : Color -> Attribute msg
background = style "background" << CssValue.color

color : Color -> Attribute msg
color = style "color" << CssValue.color

horizontalBlock : Attribute msg
horizontalBlock = style "display" CssValue.inlineBlock

verticalBlock : Attribute msg
verticalBlock = style "display" CssValue.block
