module Demo.Toolbar exposing (view)

import Demo.Base exposing (demoSection)
import Aui.Toolbar exposing (..)
import Aui.Buttons exposing (buttonGroup, button, baseConfig)
import Html exposing (Html, text, div)
import Html.Attributes exposing (style)
import Aui.Icons exposing (icon, Icon(Configure), Size, small)


view : Html a
view =
    demoSection "Toolbar"
        [ div [ style [ ( "border", "1px solid #ddd" ), ( "padding", "10px" ) ] ]
            [ toolbar
                [ toolbarPrimary
                    [ buttonGroup [ button baseConfig [ text "Edit" ] ]
                    , buttonGroup
                        [ button baseConfig [ text "Assign" ]
                        , button baseConfig [ text "Assign to me" ]
                        , button baseConfig [ text "Assign to me" ]
                        , button baseConfig [ text "Comment" ]
                        , button baseConfig [ text "More" ]
                        ]
                    ]
                , toolbarSecondary [ button baseConfig [ icon small Configure ] ]
                ]
            ]
        ]
