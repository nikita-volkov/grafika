module Grafika.CssValue exposing (..)

import Grafika.Units exposing (..)
import Round
import Color exposing (Color)


intPx4d : Int -> Int -> Int -> Int -> String
intPx4d top right bottom left = 
  intPx top ++ " " ++
  intPx right ++ " " ++
  intPx bottom ++ " " ++
  intPx left

intPx : Int -> String
intPx x = String.fromInt x ++ "px"

floatPx : Float -> String
floatPx x = float x ++ "px"

floatPct : Float -> String
floatPct x = float x ++ "%"

floatFrac : Float -> String
floatFrac x = float (x * 100) ++ "%"

float : Float -> String
float = Round.round 3

length : Length -> String
length unit = case unit of
  PxLength x -> intPx x
  PctLength x -> floatFrac x

fourDim : FourDim -> String
fourDim = Debug.todo ""

color : Color -> String
color = Color.toCssString

display : Display -> String
display x = case x of
  FlexDisplay -> "flex"
  InlineBlockDisplay -> "inline-block"
  BlockDisplay -> "block"
