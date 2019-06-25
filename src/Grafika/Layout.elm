module Grafika.Layout exposing (..)

import Grafika.Contents as Contents exposing (Contents)
import Grafika.Container as Container exposing (Container)


type alias Layout msg =
  {
    width : Int,
    height : Int,
    contents : Contents msg
  }

map : (a -> b) -> Layout a -> Layout b
map aToB rendering =
  {
    width = rendering.width,
    height = rendering.height,
    contents = Contents.map aToB rendering.contents
  }

hSeq : Layout msg -> Layout msg -> Layout msg
hSeq l r =
  {
    width = l.width + r.width,
    height = max l.height r.height,
    contents = 
      [
        Container.horizontal l.width l.height l.contents,
        Container.horizontal r.width r.height r.contents
      ]
  }

vSeq : Layout msg -> Layout msg -> Layout msg
vSeq l r =
  {
    width = max l.width r.width,
    height = l.height + r.height,
    contents = 
      [
        Container.vertical l.width l.height l.contents,
        Container.vertical r.width r.height r.contents
      ]
  }

string : Int -> Int -> String -> Layout msg
string width height x =
  {
    width = width,
    height = height,
    contents = Contents.string x
  }

