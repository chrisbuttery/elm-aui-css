module Aui.Dropdown exposing (dropdown, dropdownSection, Model, initialModel, Msg, Alignment, leftAlignment, rightAlignment, baseConfig, withAlignment, withStyle, update, Config, open, close)

{-| Functions to present AUI buttons and groups.


# Alignment

@docs Alignment, leftAlignment, rightAlignment

# Types

@docs Config

# Model

@docs Model, Msg, initialModel, open, close

# Update

@docs update

# Presentation

@docs dropdown, dropdownSection

# Utility

@docs baseConfig, withAlignment, withStyle
-}

import Aui.Buttons exposing (normalStyle, baseConfig, forceAnchor, withAdditionalClass, withActive, withAction)
import Aui.Backdrop exposing (backdrop)
import Html exposing (Html, div, strong, text, ul, li, a)
import Html.Attributes exposing (style, class, tabindex)
import Html.App as HA


-- {-| Style for the dropdown.
-- -}
-- type alias Style =
-- Aui.Buttons.Style


{-| Alignment relative to the button for the dropdown container.
-}
type Alignment
    = Left
    | Right


{-| Left alignment of the dropdown respectively to the button
-}
leftAlignment : Alignment
leftAlignment =
    Left


{-| Right alignment of the dropdown respectively to the button
-}
rightAlignment : Alignment
rightAlignment =
    Right


type alias InnerConfig a =
    { zIndexBackdrop : Int
    , style : Aui.Buttons.Style
    , disabled : Bool
    , msgMap : Msg -> a
    , alignment : Alignment
    }


{-| Configuration type to show a dropdown component.
-}
type Config a
    = Config (InnerConfig a)


{-| Messages being sent by the dropdown component
-}
type Msg
    = Toggle


{-| Model for the dropdown component.
-}
type alias Model =
    { open : Bool }


{-| Default model for a dropdown component
-}
initialModel : Model
initialModel =
    { open = False }


{-| Change a dropdown to a closed state. Convenient when you handle an action from an item in the dropdown in your own update function.
-}
close : Model -> Model
close model =
    { model | open = False }


{-| Change a dropdown to an opened state.
-}
open : Model -> Model
open model =
    { model | open = True }


{-| Update function for the dropdown component. This should be called from within your update function when handling `Msg`
-}
update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle ->
            { model | open = not model.open }


{-| Present a dropdown given a configuration, button content, dropdown content and a model.

    dropdown (baseConfig DropdownMsg |> withStyle Primary |> withAlignment Right)
        [ text "Open me"]
        [ dropdownSection (Just "Section Title")
            [ ul []
                [ li [] a [] [text "Item 1"]
                , li [] a [] [text "Item 2"]
                ]
            ]
        ]
        dropdownModel
-}
dropdown : Config a -> List (Html Msg) -> List (Html a) -> Model -> Html a
dropdown (Config config) buttonInner dropdownInner model =
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
            [ HA.map config.msgMap (backdrop config.zIndexBackdrop Toggle model.open)
            , div [ style [ ( "z-index", itemsZIndex ), ( "position", "relative" ) ] ]
                [ HA.map config.msgMap
                    (Aui.Buttons.button
                        (Aui.Buttons.baseConfig
                            |> forceAnchor
                            |> withAdditionalClass "aui-dropdown2-trigger"
                            |> Aui.Buttons.withStyle config.style
                            |> withActive model.open
                            |> withAction Toggle
                        )
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


{-| Creates a section for within a dropdown container.
-}
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


{-| Create a base configuration with a Msg mapping function.

    type Msg = DropdownMsg Aui.Dropdown.Msg

    dropdown (baseConfig DropdownMsg) ...
-}
baseConfig : (Msg -> a) -> Config a
baseConfig msgMap =
    Config
        { zIndexBackdrop = 99
        , style = normalStyle
        , disabled = False
        , msgMap = msgMap
        , alignment = Left
        }


{-| Align the container for the dropdown to the side of the dropdown button.
-}
withAlignment : Alignment -> Config a -> Config a
withAlignment x (Config config) =
    Config { config | alignment = x }


{-| Set the style of the dropdown button.
-}
withStyle : Aui.Buttons.Style -> Config a -> Config a
withStyle x (Config config) =
    Config { config | style = x }
