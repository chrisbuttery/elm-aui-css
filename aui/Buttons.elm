module Aui.Buttons exposing (baseConfig, buttonGroup, enable, disable, button, withStyle, withHref, Style(..))

import Html exposing (Html, p)
import Html.Attributes exposing (class, attribute, href)
import Html.Events exposing (onClick)


type Style
    = Primary
    | Subtle
    | Light
    | Link


type alias Config =
    { style : Maybe Style
    , disabled : Bool
    , href : Maybe String
    }


config2buttonClass : Config -> String
config2buttonClass { style } =
    case style of
        Nothing ->
            "aui-button"

        Just s ->
            case s of
                Primary ->
                    "aui-button aui-button-primary"

                Subtle ->
                    "aui-button aui-button-subtle"

                Link ->
                    "aui-button aui-button-link"

                Light ->
                    "aui-button aui-button-light"


baseConfig : Config
baseConfig =
    { style = Nothing
    , disabled = False
    , href = Nothing
    }


enable : Config -> Config
enable c =
    { c | disabled = False }


disable : Config -> Config
disable c =
    { c | disabled = True }


withStyle : Style -> Config -> Config
withStyle s config =
    { config | style = Just s }


withHref : String -> Config -> Config
withHref href config =
    { config | href = Just href }


buttonGroup : List (Html a) -> Html a
buttonGroup buttons =
    p [ class "aui-buttons" ]
        buttons


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
            case config.href of
                Just _ ->
                    Html.a

                Nothing ->
                    Html.button

        attrs =
            [ clickOrDisabled, classAttr ]
    in
        elem attrs inner
