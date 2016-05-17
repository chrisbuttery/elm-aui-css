module Aui.Buttons exposing (baseConfig, buttonGroup, disable, button, withStyle, withHref, withActive, withAdditionalClass, forceAnchor, Style(..))

{-| Functions to present AUI buttons and groups.


# Types

@docs Style, Config

# Presentation

@docs button, buttonGroup

# Utility

@docs baseConfig, disable, withStyle, withHref, withActive, withAdditionalClass, forceAnchor
-}

import Html exposing (Html, p)
import Html.Attributes exposing (class, attribute, href)
import Html.Events exposing (onClick)


{-| Different styles available for a button.
-}
type Style
    = Normal
    | Primary
    | Subtle
    | Light
    | Link


{-| Configuration record for presenting a button.
-}
type alias Config =
    { style : Style
    , forceAnchor : Bool
    , disabled : Bool
    , href : Maybe String
    , active : Bool
    , additionalClass : Maybe String
    }


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
button : Config -> a -> List (Html a) -> Html a
button config click inner =
    let
        classAttr =
            class <| config2buttonClass config

        clickOrDisabled =
            if config.disabled then
                attribute "aria-disabled" "true"
            else
                case config.href of
                    Just h ->
                        href h

                    Nothing ->
                        onClick click

        elem =
            if config.forceAnchor then
                Html.a
            else
                case config.href of
                    Just _ ->
                        Html.a

                    Nothing ->
                        Html.button

        attrs =
            [ clickOrDisabled, classAttr ]
    in
        elem attrs inner


config2buttonClass : Config -> String
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

        styleClass' =
            if active then
                styleClass ++ " active"
            else
                styleClass
    in
        case additionalClass of
            Nothing ->
                styleClass'

            Just x ->
                styleClass' ++ " " ++ x


{-| A configuration with sane defaults (no style, no anchor, enable, ect.).
-}
baseConfig : Config
baseConfig =
    { style = Normal
    , forceAnchor = False
    , disabled = False
    , href = Nothing
    , active = False
    , additionalClass = Nothing
    }


{-| Add the disabled state to a button.

    baseConfig |> disable
-}
disable : Config -> Config
disable c =
    { c | disabled = True }


{-| Add a button style to the configuration.

    baseConfig |> withStyle Subtle
-}
withStyle : Style -> Config -> Config
withStyle s config =
    { config | style = s }


{-| Add a href to the buttons configuration.

    baseConfig |> withHref "http://elm-lang.org/"
-}
withHref : String -> Config -> Config
withHref href config =
    { config | href = Just href }


{-| Make a button active or not active.

    baseConfig |> withActive True
-}
withActive : Bool -> Config -> Config
withActive active config =
    { config | active = active }


{-| Add additional classes to the button

    baseConfig |> additionalClass "my-button"
-}
withAdditionalClass : String -> Config -> Config
withAdditionalClass cl config =
    { config | additionalClass = Just cl }


{-| Forces the anchor tag to be used instead of the default button tag (only if no href is specified).

    baseConfig |> forceAnchor
-}
forceAnchor : Config -> Config
forceAnchor config =
    { config | forceAnchor = True }
