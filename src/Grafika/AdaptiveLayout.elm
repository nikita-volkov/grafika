module Grafika.AdaptiveLayout exposing (..)

import Grafika.Layout as Layout exposing (Layout)

{-|
Composable adaptive layout.

Function producing layout based on the margins available for it.
-}
type alias AdaptiveLayout msg = Int -> Int -> Layout msg

map : (a -> b) -> AdaptiveLayout a -> AdaptiveLayout b
map aToB aAdaptiveLayout = \ availableWidth availableHeight ->
  Layout.map aToB (aAdaptiveLayout availableWidth availableHeight)

string : String -> AdaptiveLayout msg
string x = \ availableWidth availableHeight ->
  Layout.string availableWidth availableHeight x

{-| Sequence two components horizontally padding to the **left**.
The right component may become completely cropped out, 
if the rendering square is too low.
-}
hSeqL : AdaptiveLayout msg -> AdaptiveLayout msg -> AdaptiveLayout msg
hSeqL leftAdaptiveLayout rightAdaptiveLayout = \ availableWidth availableHeight ->
  let
    leftLayout = leftAdaptiveLayout availableWidth availableHeight
    rightLayout = rightAdaptiveLayout (availableWidth - leftLayout.width) availableHeight
    in Layout.hSeq leftLayout rightLayout

{-| Sequence two components horizontally padding to the **right**.
The right component may become completely cropped out, 
if the rendering square is too low.
-}
hSeqR : AdaptiveLayout msg -> AdaptiveLayout msg -> AdaptiveLayout msg
hSeqR leftAdaptiveLayout rightAdaptiveLayout = \ availableWidth availableHeight ->
  let
    leftLayout = leftAdaptiveLayout (availableWidth - rightLayout.width) availableHeight
    rightLayout = rightAdaptiveLayout availableWidth availableHeight
    in Layout.hSeq leftLayout rightLayout
