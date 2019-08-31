module Grafika.Units exposing (..)


{-|
For reference see
https://www.w3schools.com/cssref/css_units.asp
-}
type Length =
  PxLength Int |
  PctLength Float

{-|
Value for four-dimensional attributes, such as "padding" and "margin".
-}
type FourDim =
  FourDim1 Length |
  FourDim2 Length Length |
  FourDim3 Length Length Length |
  FourDim4 Length Length Length Length

type Display =
  FlexDisplay |
  InlineBlockDisplay |
  BlockDisplay

type alias Font =
  {
    family : String,
    size : Length,
    weight : FontWeight,
    italic : Bool
  }

type FontWeight =
  NormalFontWeight
