module Aui.Tabs exposing (tabs, Config, Item, Msg, Model, modelWithActive, update)

import Html exposing (Html, div, ul, li, a, text)
import Html.Attributes exposing (class, attribute, href)
import Html.Events exposing (onClick)
import Html.App as HA


type alias Config a itemId =
    { horizontal : Bool
    , items : List (Item itemId)
    , msgMap : Msg itemId -> a
    }


type alias Model itemId =
    Maybe itemId


type alias Item itemId =
    { id : itemId, name : String }


type Msg itemId
    = Select (Item itemId)


modelWithActive : itemId -> Model itemId
modelWithActive =
    Just


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
