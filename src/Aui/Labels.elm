module Aui.Labels exposing (label, baseConfig, withNavigate, onClick, onRemove)

{-| Functions to present AUI labels.


# Types

@docs Action, Config

# Presentation

@docs label

# Utility

@docs baseConfig, withNavigate, onClick, onRemove
-}

import Html exposing (Html, span, a, text)
import Html.Attributes exposing (class, href)
import Html.Events


{-| Actions that can be bound to a label
-}
type Action a
    = Navigate String
    | Trigger a


{-| Configuration to present a label.
-}
type alias Config a =
    { onRemove : Maybe a
    , onClick : Maybe (Action a)
    }


{-| Show a label with a given configuration and content .

    label (baseConfig
            |> withNavigate "http://elm-lang.org/"
            |> withRemove RemovedLabel)
        [ text "Please remove or click me!" ]
-}
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


{-| Base configuration to show a label. No actions are bound by default.
-}
baseConfig : Config a
baseConfig =
    { onRemove = Nothing
    , onClick = Nothing
    }


{-| Allow navigation to a given link by clicking the label text.
-}
withNavigate : String -> Config a -> Config a
withNavigate x config =
    { config | onClick = Just (Navigate x) }


{-| Allow navigation to a given link by clicking the label text.
-}
onClick : a -> Config a -> Config a
onClick x config =
    { config | onClick = Just (Trigger x) }


{-| Allow the label to be removed triggering the given message.
-}
onRemove : a -> Config a -> Config a
onRemove x config =
    { config | onRemove = Just x }


labelRemoveSpan : a -> Html a
labelRemoveSpan x =
    span [ class "aui-label-split-close", Html.Events.onClick x ]
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
