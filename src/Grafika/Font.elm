module Grafika.Font exposing (..)

import Fonts.Font as Font
import Grafika.Types exposing (..)


fontFace : FontFace -> Maybe Font.Font
fontFace a =
  let
    fontWeight = case a.weight of
      ThinFontWeight -> 100
      UltraLightFontWeight -> 200
      LightFontWeight -> 300
      NormalFontWeight -> 400
      MediumFontWeight -> 500
      SemiBoldFontWeight -> 600
      BoldFontWeight -> 700
      UltraBoldFontWeight -> 800
      BlackFontWeight -> 900
      UltraBlackFontWeight -> 950
    in case a.location of
      GoogleFontLocation -> Just <| Font.googleFont a.name fontWeight a.italic
      UriFontLocation uri -> Just <| Font.fontFace a.name fontWeight a.italic uri
      _ -> Nothing
