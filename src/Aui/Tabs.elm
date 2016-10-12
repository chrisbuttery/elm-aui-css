module Aui.Tabs exposing (tabs, Msg, Model, modelWithActive, update, Item, item, Config, baseConfig, horizontal, vertical, withItems)

{-| Functions to present AUI tabs.

# Types

@docs Msg, Config

# Model

@docs Model, modelWithActive

# Update

@docs update

# Presentation

@docs tabs

# ITems

@docs Item, item


# Config

@docs Config, baseConfig, horizontal, vertical, withItems

-}

import Html exposing (Html, div, ul, li, a, text)
import Html.Attributes exposing (class, attribute, href)
import Html.Events exposing (onClick)


{-| Configuration record to show a tabs component.
-}
type Config a itemId
    = Config (InnerConfig a itemId)


type alias InnerConfig a itemId =
    { horizontal : Bool
    , items : List (Item itemId)
    , msgMap : Msg itemId -> a
    }


{-| Basic configuration for the tabs
-}
baseConfig : (Msg itemId -> a) -> Config a itemId
baseConfig msgMap =
    Config
        { horizontal = True
        , items = []
        , msgMap = msgMap
        }


{-| Make configuration have horizontal tabs
-}
horizontal : Config a itemId -> Config a itemId
horizontal (Config config) =
    Config { config | horizontal = True }


{-| Make configuration have vertical tabs
-}
vertical : Config a itemId -> Config a itemId
vertical (Config config) =
    Config { config | horizontal = False }


{-| Set items for tab
-}
withItems : List (Item itemId) -> Config a itemId -> Config a itemId
withItems items (Config config) =
    Config { config | items = items }


{-| Model for the tabs component.
-}
type alias Model itemId =
    Maybe itemId


{-| Representation of a single tab.
-}
type Item itemId
    = Item { id : itemId, name : String }


{-| Creates an item
-}
item : itemId -> String -> Item itemId
item id name =
    Item { id = id, name = name }


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
tabs (Config config) cb model =
    let
        tabClass =
            if config.horizontal then
                "aui-tabs horizontal-tabs"
            else
                "aui-tabs vertical-tabs"
    in
        div [ class tabClass ]
            [ Html.map config.msgMap (menu config.items model)
            , tabContent cb model
            ]


{-| Update function for the tabs component. This should be called from within your update function when handling `Msg`.
-}
update : Msg itemId -> Model itemId -> Model itemId
update msg model =
    case msg of
        Select (Item x) ->
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
asItem model (Item opt) =
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
            [ a [ attribute "role" "tab", onClick (Select (Item opt)) ]
                [ text opt.name ]
            ]
