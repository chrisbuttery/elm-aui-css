module Aui.Toggle exposing (toggle)

{-| Functions to present AUI toggle.

# Presentation

@docs toggle

-}

import Html exposing (Html, node, input, span)
import Html.Attributes exposing (class, type_, checked, disabled, attribute)
import Html.Events exposing (onClick)


{-| Create a toggle with if it is enabled, a message and its state.

    toggle isEnabled
        ToggleClicked
        isOn
-}
toggle : Bool -> (Bool -> a) -> Bool -> Html a
toggle enabled toMsg state =
    let
        attrs =
            []

        attrs_ =
            if enabled then
                (onClick (not state |> toMsg)) :: attrs
            else
                (attribute "disabled" "") :: attrs
    in
        node "aui-toggle"
            attrs_
            [ input [ type_ "checkbox", class "aui-toggle-input", checked state, disabled (not enabled) ] []
            , span [ class "aui-toggle-view" ]
                [ span [ class "aui-toggle-tick aui-icon aui-icon-small aui-iconfont-success" ] []
                , span [ class "aui-toggle-cross aui-icon aui-icon-small aui-iconfont-close-dialog" ] []
                ]
            ]
