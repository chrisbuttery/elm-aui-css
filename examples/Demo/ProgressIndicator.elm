module Demo.ProgressIndicator exposing (view)

import Demo.Base exposing (demoSection)
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Aui.ProgressIndicator exposing (..)


view : Html a
view =
    demoSection "Progress Indicators"
        (active :: (List.map (toFloat >> (flip (/) 10) >> asIndicator) [0..10]))

active : Html a
active =
    div [ style [ ( "padding", "10px" ) ] ]
        [ activeProgressIndicator ]
asIndicator : Float -> Html a
asIndicator f =
    div [ style [ ( "padding", "10px" ) ] ]
        [ progressIndicator f ]
