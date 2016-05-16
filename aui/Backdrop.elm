module Aui.Backdrop exposing (backdrop)

import Html exposing (Html, div)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


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
