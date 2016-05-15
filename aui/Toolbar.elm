module Aui.Toolbar exposing (toolbar, toolbarPrimary, toolbarSecondary, toolbarGroup)

import Html exposing (Html, div)
import Html.Attributes exposing (class, attribute)


toolbar : List (Html a) -> Html a
toolbar inner =
    div [ class "aui-toolbar2", attribute "role" "toolbar" ]
        [ div [ class "aui-toolbar2-inner" ]
            inner
        ]


toolbarPrimary : List (Html a) -> Html a
toolbarPrimary =
    div [ class "aui-toolbar2-primary" ]


toolbarSecondary : List (Html a) -> Html a
toolbarSecondary =
    div [ class "aui-toolbar2-secondary" ]


toolbarGroup : List (Html a) -> Html a
toolbarGroup =
    div [ class "aui-toolbar2-group" ]
