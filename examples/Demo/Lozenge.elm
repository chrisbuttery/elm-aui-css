module Demo.Lozenge exposing (view)

import Demo.Base exposing (demoSection)
import Html exposing (Html, div, h3, text, span)
import Aui.Lozenge exposing (..)


view : Html a
view =
    demoSection "Lozenge"
        [ div []
            (h3 [] [ text "Normal Lozenges" ]
                :: (List.map (presentLozenge Normal) types)
            )
        , div []
            (h3 [] [ text "Subtle Lozenges" ]
                :: (List.map (presentLozenge Subtle) types)
            )
        ]


presentLozenge : Presense -> Type -> Html a
presentLozenge p t =
    span []
        [ lozenge p t [ text <| toString t ]
        , text " "
        ]


types : List Type
types =
    [ Generic, Success, Error, Current, Complete, Moved ]
