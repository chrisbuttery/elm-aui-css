module Aui.Labels exposing (label, baseConfig, withNavigate, withClick, withRemove)

import Html exposing (Html, span, a, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)


type Action a
    = Navigate String
    | Trigger a


type alias Config a =
    { onRemove : Maybe a
    , onClick : Maybe (Action a)
    }


baseConfig : Config a
baseConfig =
    { onRemove = Nothing
    , onClick = Nothing
    }


withNavigate : String -> Config a -> Config a
withNavigate x config =
    { config | onClick = Just (Navigate x) }


withClick : a -> Config a -> Config a
withClick x config =
    { config | onClick = Just (Trigger x) }


withRemove : a -> Config a -> Config a
withRemove x config =
    { config | onRemove = Just x }


label : Config a -> List (Html a) -> Html a
label { onClick, onRemove } inner =
    let
        classString =
            if onRemove == Nothing then
                "aui-label"
            else
                "aui-label aui-label-closeable aui-label-split"

        inner' =
            case onRemove of
                Nothing ->
                    inner

                Just action ->
                    [ span [ class "aui-label-split-main" ] inner
                    , labelRemoveSpan action
                    ]

        actionAttrs' =
            actionAttrs onClick

        elem =
            if onClick == Nothing then
                span
            else
                a
    in
        elem (class classString :: actionAttrs')
            inner'


labelRemoveSpan : a -> Html a
labelRemoveSpan x =
    span [ class "aui-label-split-close", onClick x ]
        [ span [ class "aui-icon aui-icon-close" ] []
        ]


actionAttrs : Maybe (Action a) -> List (Html.Attribute a)
actionAttrs onClick =
    case onClick of
        Just action ->
            case action of
                Navigate x ->
                    [ href x ]

                Trigger a ->
                    [ Html.Events.onClick a ]

        Nothing ->
            []
