module Demo.Base exposing (demoSection)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (style)


demoSection : String -> List (Html a) -> Html a
demoSection title content =
    div []
        [ h1 [ style [ ( "margin-top", "30px" ) ] ] [ text title ]
        , div [] content
        ]
