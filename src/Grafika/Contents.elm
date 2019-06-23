module Grafika.Contents exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Grafika.Container as Container exposing (Container)


type alias Contents msg = List (Html msg)

map : (a -> b) -> Contents a -> Contents b
map = Html.map >> List.map

hSeq : Int -> Int -> Int -> Int -> Contents msg -> Contents msg -> Contents msg
hSeq lWidth lHeight rWidth rHeight lContents rContents =
  [
    Container.horizontal lWidth lHeight lContents,
    Container.horizontal rWidth rHeight rContents
  ]

vSeq : Int -> Int -> Int -> Int -> Contents msg -> Contents msg -> Contents msg
vSeq lWidth lHeight rWidth rHeight lContents rContents =
  [
    Container.vertical lWidth lHeight lContents,
    Container.vertical rWidth rHeight rContents
  ]

string : String -> Contents msg
string x = [text x]
