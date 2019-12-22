module Grafika.CssValue exposing (..)

import Grafika.Types exposing (..)
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
fourDim a = case a of
  FourDim1 b -> length b
  FourDim2 b c -> length b ++ " " ++ length c ++ " "
  FourDim3 b c d -> length b ++ " " ++ length c ++ " " ++ length d
  FourDim4 b c d e -> length b ++ " " ++ length c ++ " " ++ length d ++ " " ++ length e

color : Color -> String
color = Color.toCssString

display : Display -> String
display x = case x of
  FlexDisplay -> "flex"
  InlineBlockDisplay -> "inline-block"
  BlockDisplay -> "block"

fontStyle : Bool -> String
fontStyle x = case x of
  False -> "normal"
  True -> "italic"

fontFamily : FontFamily -> String
fontFamily x = case x of
  SansSerifFontFamily -> "sans-serif"
  SerifFontFamily -> "serif"
  MonospaceFontFamily -> "monospace"

fontWeight : FontWeight -> String
fontWeight x = case x of
  ThinFontWeight -> "100"
  UltraLightFontWeight -> "200"
  LightFontWeight -> "300"
  NormalFontWeight -> "400"
  MediumFontWeight -> "500"
  SemiBoldFontWeight -> "600"
  BoldFontWeight -> "700"
  UltraBoldFontWeight -> "800"
  BlackFontWeight -> "900"
  UltraBlackFontWeight -> "950"

{-|
Combined font property.

Syntax:
```
font: font-style font-variant font-weight font-size/line-height font-family|caption|icon|menu|message-box|small-caption|status-bar|initial|inherit;
```

https://www.w3schools.com/cssref/pr_font_font.asp
-}
font : Font -> String
font x =
  String.join " "
    [
      fontStyle x.face.italic,
      "normal",
      fontWeight x.face.weight,
      length x.size ++ "/normal",
      x.face.name ++ ", " ++ fontFamily x.face.family
    ]

singleShadow : Shadow -> String
singleShadow a = String.join " " [
    floatPx a.x,
    floatPx a.y,
    floatPx a.blur,
    color a.color
  ]

multiShadow : List Shadow -> String
multiShadow = String.join ", " << List.map singleShadow
