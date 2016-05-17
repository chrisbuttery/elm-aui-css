module Demo.Base exposing (demoSection)

import Html exposing (Html, div, h1, text,section)
import Html.Attributes exposing (style,class)

demoSection : String -> List (Html a) -> Html a
demoSection title content =
    div [ class "aui-page-panel" ]
        [ div [ class "aui-page-panel-inner" ]
            [ section [ class "aui-page-panel-content"]
                [ h1 [ style [ ( "margin", "0 0 15px 0"), ("text-align","center") ] ] [ text title ]
                , div [] content
                ]
            ]
        ]
