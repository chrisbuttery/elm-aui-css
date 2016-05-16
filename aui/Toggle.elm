module Aui.Toggle exposing (toggle, Config)

import Html exposing (Html, node, input, span)
import Html.Attributes exposing (class, type', checked, disabled, attribute)
import Html.Events exposing (onClick)


type alias Config =
    { onTooltip : Maybe String
    , offTooltip : Maybe String
    }


toggle : Config -> Bool -> (Bool -> a) -> Bool -> Html a
toggle config enabled toMsg state =
    let
        attrs =
            []

        attrs' =
            if enabled then
                (onClick (not state |> toMsg)) :: attrs
            else
                (attribute "disabled" "") :: attrs
    in
        node "aui-toggle"
            attrs'
            [ input [ type' "checkbox", class "aui-toggle-input", checked state, disabled (not enabled) ] []
            , span [ class "aui-toggle-view" ]
                [ span [ class "aui-toggle-tick aui-icon aui-icon-small aui-iconfont-success" ] []
                , span [ class "aui-toggle-cross aui-icon aui-icon-small aui-iconfont-close-dialog" ] []
                ]
            ]
