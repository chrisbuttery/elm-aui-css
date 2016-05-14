module Aui.ProgressIndicator exposing (..)

import Html exposing (Html, span, div)
import Html.Attributes exposing (class, style, attribute)


indicator : Float -> Html a
indicator value =
    let
        ( w, attrs ) =
            if value == 0.0 then
                ( 100, [ class "aui-progress-indicator" ] )
            else
                ( value * 100.0, [ class "aui-progress-indicator", attribute "data-value" "" ] )
    in
        div attrs
            [ span [ class "aui-progress-indicator-value", style [ ( "width", toString w ++ "%" ) ] ]
                []
            ]
