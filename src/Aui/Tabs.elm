module Aui.Tabs exposing (tabs, Config, Item, Msg, Model, modelWithActive, update)

{-| Functions to present AUI tabs.

# Types

@docs Msg, Config, Item

# Model

@docs Model, modelWithActive

# Update

@docs update

# Presentation

@docs tabs

# Utility

@docs baseConfig

-}

import Html exposing (Html, div, ul, li, a, text)
import Html.Attributes exposing (class, attribute, href)
import Html.Events exposing (onClick)
import Html.App as HA


{-| Configuration record to show a tabs component.
-}
type alias Config a itemId =
    { horizontal : Bool
    , items : List (Item itemId)
    , msgMap : Msg itemId -> a
    }


{-| Model for the tabs component.
-}
type alias Model itemId =
    Maybe itemId


{-| Representation of a single tab.
-}
type alias Item itemId =
    { id : itemId, name : String }


{-| Messages being sent by the tabs component
-}
type Msg itemId
    = Select (Item itemId)


{-| Create a model with a active item
-}
modelWithActive : itemId -> Model itemId
modelWithActive =
    Just


{-| Create a tabs component with a given configuration, a mapper from itemId to tab content and a model
-}
tabs : Config a itemId -> (itemId -> Html a) -> Model itemId -> Html a
tabs config cb model =
    let
        tabClass =
            if config.horizontal then
                "aui-tabs horizontal-tabs"
            else
                "aui-tabs vertical-tabs"
    in
        div [ class tabClass ]
            [ HA.map config.msgMap (menu config.items model)
            , tabContent cb model
            ]


{-| Update function for the tabs component. This should be called from within your update function when handling `Msg`.
-}
update : Msg itemId -> Model itemId -> Model itemId
update msg model =
    case msg of
        Select x ->
            Just x.id


tabContent : (itemId -> Html a) -> Model itemId -> Html a
tabContent cb model =
    case model of
        Nothing ->
            div [ class "tabs-pane" ] []

        Just identifier ->
            div [ class "tabs-pane active-pane" ]
                [ cb identifier ]


menu : List (Item itemId) -> Model itemId -> Html (Msg itemId)
menu items model =
    ul [ class "tabs-menu", attribute "role" "tablist" ]
        (List.map (asItem model) items)


asItem : Model itemId -> Item itemId -> Html (Msg itemId)
asItem model opt =
    let
        active =
            case model of
                Nothing ->
                    False

                Just x ->
                    x == opt.id

        activeClass =
            if active then
                "menu-item active-tab"
            else
                "menu-item"
    in
        li [ class activeClass ]
            [ a [ attribute "role" "tab", onClick (Select opt) ]
                [ text opt.name ]
            ]
