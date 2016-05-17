module Aui.Toolbar exposing (toolbar, toolbarPrimary, toolbarSecondary, toolbarGroup)

{-| Functions to present AUI toolbars.

# Presentation

@docs toolbar, toolbarPrimary, toolbarSecondary, toolbarGroup

-}

import Html exposing (Html, div)
import Html.Attributes exposing (class, attribute)


{-| Create a toolbar:

    toolbar
        [ toolbarPrimary
            [ buttonGroup [ button baseConfig Edit [ text "Edit" ] ]
            , buttonGroup
                [ button baseConfig Assign [ text "Assign" ]
                , button baseConfig AssignMe [ text "Assign to me" ]
                ]
            ]
        , toolbarSecondary [ button baseConfig Configure [ icon Small Configure ] ]
        ]
-}
toolbar : List (Html a) -> Html a
toolbar inner =
    div [ class "aui-toolbar2", attribute "role" "toolbar" ]
        [ div [ class "aui-toolbar2-inner" ]
            inner
        ]


{-| Create primary part of toolbar.
-}
toolbarPrimary : List (Html a) -> Html a
toolbarPrimary =
    div [ class "aui-toolbar2-primary" ]


{-| Create secondary part of toolbar.
-}
toolbarSecondary : List (Html a) -> Html a
toolbarSecondary =
    div [ class "aui-toolbar2-secondary" ]


{-| Create toolbar button group
-}
toolbarGroup : List (Html a) -> Html a
toolbarGroup =
    div [ class "aui-toolbar2-group" ]
