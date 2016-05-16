module Aui.Dropdown exposing (dropdown, dropdownSection, Style, Model, initialModel, Msg, Alignment(..), baseConfig, withAlignment, withStyle, update, close)

import Aui.Buttons exposing (..)
import Aui.Backdrop exposing (backdrop)
import Html exposing (Html, div, strong, text, ul, li, a)
import Html.Attributes exposing (style, class, tabindex)
import Html.App as HA


type alias Style =
    Aui.Buttons.Style


type Msg
    = Toggle
    | Open
    | Close


type Alignment
    = Left
    | Right


type alias Config a =
    { zIndexBackdrop : Int
    , style : Style
    , disabled : Bool
    , msgMap : Msg -> a
    , alignment : Alignment
    }


type alias Model =
    { open : Bool }


baseConfig : (Msg -> a) -> Config a
baseConfig msgMap =
    { zIndexBackdrop = 99
    , style = Normal
    , disabled = False
    , msgMap = msgMap
    , alignment = Left
    }


withAlignment : Alignment -> Config a -> Config a
withAlignment x config =
    { config | alignment = x }


withStyle : Style -> Config a -> Config a
withStyle x config =
    { config | style = x }


initialModel : Model
initialModel =
    { open = False }


close : Model -> Model
close model =
    { model | open = False }


open : Model -> Model
open model =
    { model | open = True }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle ->
            { model | open = not model.open }

        Open ->
            open model

        Close ->
            close model


dropdown : Config a -> List (Html Msg) -> List (Html a) -> Model -> Html a
dropdown config buttonInner dropdownInner model =
    let
        contentDisplay =
            if model.open then
                "inline-block"
            else
                "none"

        itemsZIndex =
            config.zIndexBackdrop + 1 |> toString
    in
        div [ style [ ( "position", "relative" ), ( "display", "inline-block" ) ] ]
            [ HA.map config.msgMap (backdrop config.zIndexBackdrop Close model.open)
            , div [ style [ ( "z-index", itemsZIndex ), ( "position", "relative" ) ] ]
                [ HA.map config.msgMap
                    (Aui.Buttons.button (Aui.Buttons.baseConfig |> forceAnchor |> withAdditionClass "aui-dropdown2-trigger" |> Aui.Buttons.withStyle config.style |> withActive model.open)
                        Toggle
                        buttonInner
                    )
                ]
            , div
                [ style
                    [ ( "display", contentDisplay )
                    , ( "z-index", itemsZIndex )
                    , ( "position", "absolute" )
                    , ( "top", "30px" )
                    , ( if config.alignment == Left then
                            "left"
                        else
                            "right"
                      , "0"
                      )
                    ]
                , class "aui-dropdown2 aui-style-default"
                ]
                dropdownInner
            ]


dropdownSection : Maybe String -> List (Html a) -> Html a
dropdownSection title inner =
    case title of
        Just x ->
            let
                header =
                    div [ class "aui-dropdown2-heading" ]
                        [ strong [] [ text x ] ]
            in
                div [ class "aui-dropdown2-section" ] (header :: inner)

        Nothing ->
            div [ class "aui-dropdown2-section" ] inner
