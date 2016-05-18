module Aui.ProgressIndicator exposing (progressIndicator,activeProgressIndicator)

{-| Functions to present AUI progress indicator.


# Presentation

@docs progressIndicator, activeProgressIndicator

-}

import Html exposing (Html, span, div)
import Html.Attributes exposing (class, style, attribute)


{-| Create a progress indicator with a value between 0.0 and 1.0.
-}
progressIndicator : Float -> Html a
progressIndicator value =
    let
        ( w, attrs ) =
                ( value * 100.0, [ class "aui-progress-indicator", attribute "data-value" "" ] )
    in
        div attrs
            [ span [ class "aui-progress-indicator-value", style [ ( "width", toString w ++ "%" ) ] ]
                []
            ]

{-| Create a progress indicator that represents an active loading state.
-}
activeProgressIndicator : Html a
activeProgressIndicator =
    div [ class "aui-progress-indicator" ]
        [ span [ class "aui-progress-indicator-value", style [ ( "width", "100%" ) ] ]
            []
        ]
