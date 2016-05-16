module Aui.Buttons exposing (baseConfig, buttonGroup, enable, disable, button, withStyle, withHref, withActive, withAdditionClass, forceAnchor, Style(..))

import Html exposing (Html, p)
import Html.Attributes exposing (class, attribute, href)
import Html.Events exposing (onClick)


type Style
    = Normal
    | Primary
    | Subtle
    | Light
    | Link


type alias Config =
    { style : Style
    , forceAnchor : Bool
    , disabled : Bool
    , href : Maybe String
    , active : Bool
    , additionalClass : Maybe String
    }


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


baseConfig : Config
baseConfig =
    { style = Normal
    , forceAnchor = False
    , disabled = False
    , href = Nothing
    , active = False
    , additionalClass = Nothing
    }


enable : Config -> Config
enable c =
    { c | disabled = False }


disable : Config -> Config
disable c =
    { c | disabled = True }


withStyle : Style -> Config -> Config
withStyle s config =
    { config | style = s }


withHref : String -> Config -> Config
withHref href config =
    { config | href = Just href }


withActive : Bool -> Config -> Config
withActive active config =
    { config | active = active }


withAdditionClass : String -> Config -> Config
withAdditionClass cl config =
    { config | additionalClass = Just cl }


forceAnchor : Config -> Config
forceAnchor config =
    { config | forceAnchor = True }


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
