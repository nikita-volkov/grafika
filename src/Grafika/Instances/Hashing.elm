module Grafika.Instances.Hashing exposing (..)

import Grafika.Types exposing (..)
import Typeclasses.Classes.Hashing exposing (..)
import Color exposing (Color)
import Either exposing (Either)


color : Hashing Color
color =
  concat
    [
      map .red float,
      map .green float,
      map .blue float,
      map .alpha float
    ] |>
  map Color.toRgba

font : Hashing Font
font =
  concat
    [
      map .face fontFace,
      map .size length
    ]

fontFace : Hashing FontFace
fontFace =
  concat
    [
      map .name fontName,
      map .family fontFamily,
      map .weight fontWeight,
      map .italic bool,
      map .location fontLocation
    ]

length : Hashing Length
length =
  either int float |>
  map (\ a -> case a of
    PxLength b -> Either.Left b
    PctLength b -> Either.Right b)

fontName : Hashing String
fontName = string 2

fontFamily : Hashing FontFamily
fontFamily =
  int |>
  map (\ a -> case a of
    SansSerifFontFamily -> 0
    SerifFontFamily -> 1
    MonospaceFontFamily -> 2)

fontLocation : Hashing FontLocation
fontLocation =
  either int (string 3) |>
  map (\ a -> case a of
    GoogleFontLocation -> Either.Left 0
    UriFontLocation b -> Either.Right b
    LocalFontLocation -> Either.Left 1)

fontWeight : Hashing FontWeight
fontWeight =
  int |>
  map (\ a -> case a of
    ThinFontWeight -> 0
    UltraLightFontWeight -> 1
    LightFontWeight -> 2
    NormalFontWeight -> 3
    MediumFontWeight -> 4
    SemiBoldFontWeight -> 5
    BoldFontWeight -> 6
    UltraBoldFontWeight -> 7
    BlackFontWeight -> 8
    UltraBlackFontWeight -> 9)
