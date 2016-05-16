module Aui.Backdrop exposing (backdrop)

{-| Functions to create a backdrop that is needed for several AUI Components.

# Presentation

@docs backdrop
-}

import Html exposing (Html, div)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


{-| Present a backdrop with a click handler.

    backdrop 1000 ClickedBackdrop True
-}
backdrop : Int -> a -> Bool -> Html a
backdrop zIndex msg visible =
    div
        [ style
            [ ( "background", "#000" )
            , ( "position", "fixed" )
            , ( "top", "0" )
            , ( "left", "0" )
            , ( "width", "100%" )
            , ( "height", "100%" )
            , ( "z-index", toString zIndex )
            , ( "opacity", "0.0" )
            , ( "display"
              , if visible then
                    "block"
                else
                    "none"
              )
            ]
        , onClick msg
        ]
        []
