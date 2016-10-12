module Aui.Buttons exposing (baseConfig, buttonGroup, disable, button, withStyle, withHref, withAction, withActive, withAdditionalClass, forceAnchor, Config, Style, primaryStyle, normalStyle, subtleStyle, lightStyle, linkStyle)

{-| Functions to present AUI buttons and groups.


# Style

@docs Style, primaryStyle, normalStyle, subtleStyle, lightStyle, linkStyle

# Config

@docs Config, baseConfig, disable, withStyle, withHref, withAction, withActive, withAdditionalClass, forceAnchor

# Config

# Presentation

@docs button, buttonGroup

-}

import Html exposing (Html, p)
import Html.Attributes exposing (class, attribute, href, disabled)
import Html.Events exposing (onClick)


{-| Different styles available for a button.
-}
type Style
    = Normal
    | Primary
    | Subtle
    | Light
    | Link


{-| -}
primaryStyle : Style
primaryStyle =
    Primary


{-| -}
normalStyle : Style
normalStyle =
    Normal


{-| -}
subtleStyle : Style
subtleStyle =
    Subtle


{-| -}
lightStyle : Style
lightStyle =
    Light


{-| -}
linkStyle : Style
linkStyle =
    Link


type alias InnerConfig a =
    { style : Style
    , forceAnchor : Bool
    , disabled : Bool
    , href : Maybe String
    , action : Maybe a
    , active : Bool
    , additionalClass : Maybe String
    }


{-| Configuration type for presenting a button.
-}
type Config a
    = Config (InnerConfig a)


{-| Button container that will add the correct classes to make a button group.

    buttonGroup
        [ button config Clicked1 [text "First"]
        , button config Clicked2 [text "Second"]
        , button config Clicked3 [text "Third"]
        ]
-}
buttonGroup : List (Html a) -> Html a
buttonGroup buttons =
    p [ class "aui-buttons" ]
        buttons


{-| Render an AUI button.

    button (baseConfig |> withStyle Primary |> withHref "http://elm-lang.org/")
        ButtonClicked
        [ text "Click me!"]
-}
button : Config a -> List (Html a) -> Html a
button (Config config) inner =
    let
        classAttr =
            class <| config2buttonClass config

        clickOrDisabledAttrs =
            if config.disabled then
                [ Just (attribute "aria-disabled" "true"), Just (disabled True) ]
            else
                [ Maybe.map href config.href
                , Maybe.map onClick config.action
                ]

        elem =
            if config.forceAnchor then
                Html.a
            else
                config.href
                    |> Maybe.map (\_ -> Html.a)
                    |> Maybe.withDefault Html.button

        attrs =
            classAttr :: (List.filterMap identity clickOrDisabledAttrs)
    in
        elem attrs inner


config2buttonClass : InnerConfig a -> String
config2buttonClass { style, active, additionalClass } =
    let
        styleClass =
            case style of
                Normal ->
                    "aui-button"

                Primary ->
                    "aui-button aui-button-primary"

                Subtle ->
                    "aui-button aui-button-subtle"

                Link ->
                    "aui-button aui-button-link"

                Light ->
                    "aui-button aui-button-light"

        styleClass_ =
            if active then
                styleClass ++ " active"
            else
                styleClass
    in
        case additionalClass of
            Nothing ->
                styleClass_

            Just x ->
                styleClass_ ++ " " ++ x


{-| A configuration with sane defaults (no style, no anchor, enable, ect.).
-}
baseConfig : Config a
baseConfig =
    Config
        { style = Normal
        , forceAnchor = False
        , disabled = False
        , href = Nothing
        , action = Nothing
        , active = False
        , additionalClass = Nothing
        }


{-| Add the disabled state to a button.

    baseConfig |> disable
-}
disable : Config a -> Config a
disable (Config c) =
    Config { c | disabled = True }


{-| Add a button style to the configuration.

    baseConfig |> withStyle Subtle
-}
withStyle : Style -> Config a -> Config a
withStyle s (Config config) =
    Config { config | style = s }


{-| Add a href to the buttons configuration.

    baseConfig |> withHref "http://elm-lang.org/"
-}
withHref : String -> Config a -> Config a
withHref href (Config config) =
    Config { config | href = Just href }


{-| Add an action to the buttons configuration.

    baseConfig |> withAction MyAction
-}
withAction : a -> Config a -> Config a
withAction action (Config config) =
    Config { config | action = Just action }


{-| Make a button active or not active.

    baseConfig |> withActive True
-}
withActive : Bool -> Config a -> Config a
withActive active (Config config) =
    Config { config | active = active }


{-| Add additional classes to the button

    baseConfig |> additionalClass "my-button"
-}
withAdditionalClass : String -> Config a -> Config a
withAdditionalClass cl (Config config) =
    Config { config | additionalClass = Just cl }


{-| Forces the anchor tag to be used instead of the default button tag (only if no href is specified).

    baseConfig |> forceAnchor
-}
forceAnchor : Config a -> Config a
forceAnchor (Config config) =
    Config { config | forceAnchor = True }
