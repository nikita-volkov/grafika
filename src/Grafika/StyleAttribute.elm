module Grafika.StyleAttribute exposing (..)

import Html.Attributes exposing (..)
import Grafika.Types exposing (..)
import Html exposing (Attribute)
import Color exposing (Color)
import Grafika.CssValue as CssValue


width : Length -> Attribute msg
width = style "width" << CssValue.length

height : Length -> Attribute msg
height = style "height" << CssValue.length

{-|
Combined font property.

Syntax:
  font: font-style font-variant font-weight font-size/line-height font-family|caption|icon|menu|message-box|small-caption|status-bar|initial|inherit;

https://www.w3schools.com/cssref/pr_font_font.asp
-}
font : Font -> Attribute msg
font = style "font" << CssValue.font

fontFamily : String -> Attribute msg
fontFamily = style "font-family"

fontSize : Length -> Attribute msg
fontSize = style "font-size" << CssValue.length

fontWeight : FontWeight -> Attribute msg
fontWeight = style "font-weight" << CssValue.fontWeight

fontStyle : Bool -> Attribute msg
fontStyle = style "font-style" << CssValue.fontStyle

backgroundColor : Color -> Attribute msg
backgroundColor = style "background-color" << CssValue.color

color : Color -> Attribute msg
color = style "color" << CssValue.color

borderColor : Color -> Attribute msg
borderColor = style "border-color" << CssValue.color

display : Display -> Attribute msg
display = style "display" << CssValue.display

padding : FourDim -> Attribute msg
padding = style "padding" << CssValue.fourDim

margin : FourDim -> Attribute msg
margin = style "margin" << CssValue.fourDim
