module Demo.Toolbar exposing (view)

import Demo.Base exposing (demoSection)
import Aui.Toolbar exposing (..)
import Aui.Buttons exposing (buttonGroup, button, baseConfig)
import Html exposing (Html, text, div)
import Html.Attributes exposing (style)
import Aui.Icons exposing (icon, Icon(Configure), Size, small)


type Msg
    = NoOp


view : Html Msg
view =
    demoSection "Toolbar"
        [ div [ style [ ( "border", "1px solid #ddd" ), ( "padding", "10px" ) ] ]
            [ toolbar
                [ toolbarPrimary
                    [ buttonGroup [ button baseConfig NoOp [ text "Edit" ] ]
                    , buttonGroup
                        [ button baseConfig NoOp [ text "Assign" ]
                        , button baseConfig NoOp [ text "Assign to me" ]
                        , button baseConfig NoOp [ text "Assign to me" ]
                        , button baseConfig NoOp [ text "Comment" ]
                        , button baseConfig NoOp [ text "More" ]
                        ]
                    ]
                , toolbarSecondary [ button baseConfig NoOp [ icon small Configure ] ]
                ]
            ]
        ]
