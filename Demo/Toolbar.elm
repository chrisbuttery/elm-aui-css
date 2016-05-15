module Demo.Toolbar exposing (view)

import Demo.Base exposing (demoSection)
import Aui.Toolbar exposing (..)
import Aui.Buttons exposing (buttonGroup, button, baseConfig)
import Html exposing (Html, text)
import Aui.Icons exposing (icon, Icon(Configure), Size(Small))


type Msg
    = NoOp


view : Html Msg
view =
    demoSection "Toolbar"
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
            , toolbarSecondary [ button baseConfig NoOp [ icon Small Configure ] ]
            ]
        ]
