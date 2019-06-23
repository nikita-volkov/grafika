module Grafika.Ui exposing (..)

import Grafika.Rendering as Rendering exposing (Rendering)

{-|
Composable adaptive UI component.

Function producing HTML elements based on the margins available for them.
-}
type alias Ui msg = Int -> Int -> Rendering msg

map : (a -> b) -> Ui a -> Ui b
map aToB aUi = \ availableWidth availableHeight ->
  Rendering.map aToB (aUi availableWidth availableHeight)

string : String -> Ui msg
string x = \ availableWidth availableHeight ->
  Rendering.string availableWidth availableHeight x

{-| Sequence two components horizontally padding to the **left**.
The right component may become completely cropped out, 
if the rendering square is too low.
-}
hSeqL : Ui msg -> Ui msg -> Ui msg
hSeqL leftUi rightUi = \ availableWidth availableHeight ->
  let
    leftRendering = leftUi availableWidth availableHeight
    rightRendering = rightUi (availableWidth - leftRendering.width) availableHeight
    in Rendering.hSeq leftRendering rightRendering

{-| Sequence two components horizontally padding to the **right**.
The right component may become completely cropped out, 
if the rendering square is too low.
-}
hSeqR : Ui msg -> Ui msg -> Ui msg
hSeqR leftUi rightUi = \ availableWidth availableHeight ->
  let
    leftRendering = leftUi (availableWidth - rightRendering.width) availableHeight
    rightRendering = rightUi availableWidth availableHeight
    in Rendering.hSeq leftRendering rightRendering
