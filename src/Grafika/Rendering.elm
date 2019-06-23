module Grafika.Rendering exposing (..)

import Grafika.Contents as Contents exposing (Contents)


type alias Rendering msg =
  {
    width : Int,
    height : Int,
    contents : Contents msg
  }

map : (a -> b) -> Rendering a -> Rendering b
map aToB rendering =
  {
    width = rendering.width,
    height = rendering.height,
    contents = Contents.map aToB rendering.contents
  }

hSeq : Rendering msg -> Rendering msg -> Rendering msg
hSeq l r =
  {
    width = l.width + r.width,
    height = max l.height r.height,
    contents = Contents.hSeq l.width l.height r.width r.height l.contents r.contents
  }

string : Int -> Int -> String -> Rendering msg
string width height x =
  {
    width = width,
    height = height,
    contents = Contents.string x
  }

