module Demo.Icons exposing (view)

import Html exposing (Html, h3, i, text, div, p)
import Demo.Base exposing (demoSection)
import Aui.Icons exposing (..)


view : Html a
view =
    demoSection "Icons"
        [ div []
            (h3 [] [ text "Small Icons" ]
            :: (List.map iconSmall samples))

        , div []
            (h3 [] [ text "Large Icons" ]
            :: (List.map iconLarge samples))
        , p [] [ i [] [ text "See the source for more icons" ] ]
        ]

samples : List Icon
samples = [Add ,CustomBullet,ArrowsDown, ArrowsLeft, ArrowsRight, ArrowsUp, Layout3colLarge]
