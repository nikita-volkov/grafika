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

{-|
For reference see:
https://www.w3schools.com/cssref/pr_font_font.asp

TODO: Add line-height, font-variant.
- https://www.w3schools.com/cssref/pr_dim_line-height.asp
- https://www.w3schools.com/cssref/pr_font_font-variant.asp
-}
type alias Font =
  {
    face : FontFace,
    size : Length
  }

type alias FontFace =
  {
    name : String,
    family : FontFamily,
    weight : Int,
    italic : Bool,
    location : FontLocation
  }

type FontLocation =
  GoogleFontLocation | UriFontLocation String

type FontFamily =
  SansSerifFontFamily |
  SerifFontFamily |
  MonospaceFontFamily
