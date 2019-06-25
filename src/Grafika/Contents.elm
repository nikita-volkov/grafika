module Grafika.Contents exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Contents msg = List (Html msg)

map : (a -> b) -> Contents a -> Contents b
map = Html.map >> List.map

string : String -> Contents msg
string x = [text x]
