module Grafika.String exposing (..)

import Round


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
