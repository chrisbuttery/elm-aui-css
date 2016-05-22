module Aui.Labels exposing (label, Action, navigate, trigger, Config, baseConfig, onClick, onRemove)

{-| Functions to present AUI labels.


# Presentation

@docs label

# Actions

@docs Action, navigate, trigger
# Types

@docs Config

# Utility

@docs baseConfig, onClick, onRemove
-}

import Html exposing (Html, span, a, text)
import Html.Attributes exposing (class, href)
import Html.Events


{-| Actions that can be bound to a label
-}
type Action a
    = Navigate String
    | Trigger a


{-| Action to navigate to an url
-}
navigate : String -> Action a
navigate url =
    Navigate url


{-| Action to trigger an action on click
-}
trigger : a -> Action a
trigger x =
    Trigger x


{-| Configuration to present a label.
-}
type Config a
    = Config (Maybe a) (Maybe (Action a))


{-| Base configuration to show a label. No actions are bound by default.
-}
baseConfig : Config a
baseConfig =
    Config Nothing Nothing


{-| Bind action to click on label
-}
onClick : Action a -> Config a -> Config a
onClick x (Config onRemove _) =
    Config onRemove (Just x)


{-| Allow the label to be removed triggering the given message.
-}
onRemove : a -> Config a -> Config a
onRemove x (Config _ onClick) =
    Config (Just x) onClick


{-| Show a label with a given configuration and content .

    label (baseConfig
            |> withNavigate "http://elm-lang.org/"
            |> withRemove RemovedLabel)
        [ text "Please remove or click me!" ]
-}
label : Config a -> List (Html a) -> Html a
label (Config onRemove onClick) inner =
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
