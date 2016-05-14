module Demo.Lozenge exposing (view)

import Demo.Base exposing (demoSection)
import Html exposing (Html, div, h3, text)
import Aui.Lozenge exposing (..)


view : Html a
view =
    demoSection "Lozenge"
        [ div []
            (h3 [] [ text "Normal Lozenges" ]
                :: (List.map (\t -> lozenge Normal t [ text <| toString t ]) types)
            )
        , div []
            (h3 [] [ text "Subtle Lozenges" ]
                :: (List.map (\t -> lozenge Normal t [ text <| toString t ]) types)
            )
        ]


types : List Type
types =
    [ Generic, Success, Error, Current, Complete, Moved ]