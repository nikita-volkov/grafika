module Grafika.String exposing (..)

import Round


intPx : Int -> String
intPx x = String.fromInt x ++ "px"

intPx4d : Int -> Int -> Int -> Int -> String
intPx4d top right bottom left = 
  intPx top ++ " " ++
  intPx right ++ " " ++
  intPx bottom ++ " " ++
  intPx left

floatPx : Float -> String
floatPx x = float x ++ "px"

floatPct : Float -> String
floatPct x = float x ++ "%"

floatFrac : Float -> String
floatFrac x = float (x * 100) ++ "%"

float : Float -> String
float = Round.round 3
