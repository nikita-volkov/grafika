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

backgroundColor : Color -> Attribute msg
backgroundColor = style "background-color" << CssValue.color

color : Color -> Attribute msg
color = style "color" << CssValue.color

display : Display -> Attribute msg
display = style "display" << CssValue.display

padding : FourDim -> Attribute msg
padding = style "padding" << CssValue.fourDim

margin : FourDim -> Attribute msg
margin = style "margin" << CssValue.fourDim
