module Grafika.AdaptiveRendering exposing (..)

import Grafika.Rendering as Rendering exposing (Rendering)

{-|
Composable adaptive layout.

Function producing layout based on the margins available for it.
-}
type alias AdaptiveRendering msg = Int -> Int -> Rendering msg

map : (a -> b) -> AdaptiveRendering a -> AdaptiveRendering b
map aToB aAdaptiveRendering = \ availableWidth availableHeight ->
  Rendering.map aToB (aAdaptiveRendering availableWidth availableHeight)

string : String -> AdaptiveRendering msg
string x = \ availableWidth availableHeight ->
  Rendering.string availableWidth availableHeight x

{-| Sequence two components horizontally padding to the **left**.
The right component may become completely cropped out, 
if the rendering square is too low.
-}
hSeqL : AdaptiveRendering msg -> AdaptiveRendering msg -> AdaptiveRendering msg
hSeqL leftAdaptiveRendering rightAdaptiveRendering = \ availableWidth availableHeight ->
  let
    leftRendering = leftAdaptiveRendering availableWidth availableHeight
    rightRendering = rightAdaptiveRendering (availableWidth - leftRendering.width) availableHeight
    in Rendering.hSeq leftRendering rightRendering

{-| Sequence two components horizontally padding to the **right**.
The right component may become completely cropped out, 
if the rendering square is too low.
-}
hSeqR : AdaptiveRendering msg -> AdaptiveRendering msg -> AdaptiveRendering msg
hSeqR leftAdaptiveRendering rightAdaptiveRendering = \ availableWidth availableHeight ->
  let
    leftRendering = leftAdaptiveRendering (availableWidth - rightRendering.width) availableHeight
    rightRendering = rightAdaptiveRendering availableWidth availableHeight
    in Rendering.hSeq leftRendering rightRendering
