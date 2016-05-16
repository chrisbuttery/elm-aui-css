module Aui.ProgressIndicator exposing (progressIndicator)

{-| Functions to present AUI progress indicator.


# Presentation

@docs progressIndicator

-}

import Html exposing (Html, span, div)
import Html.Attributes exposing (class, style, attribute)


{-| Create a progress indicator with a value between 0.0 and 1.0.
-}
progressIndicator : Float -> Html a
progressIndicator value =
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
