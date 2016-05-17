module Aui.Select exposing (singleSelect, Config, Model, initialModel, update, Ports, Msg, baseConfig)

{-| Functions to present AUI select.

# Types

@docs Msg, Config, Ports

# Model

@docs Model, initialModel

# Update

@docs update

# Presentation

@docs singleSelect

# Utility

@docs baseConfig

-}

import Html exposing (Html, ul, li, div, button, node, input, select, text, form, span)
import Html.Attributes exposing (value, type', class, name, placeholder, tabindex, autocomplete, attribute, style, id)
import Html.Events exposing (onClick, onFocus, onBlur, onInput, keyCode, on, onWithOptions, defaultOptions, onSubmit, onMouseEnter)
import String exposing (contains, toLower)
import Json.Decode as Json
import List.Extra exposing (elemIndex, getAt)
import Aui.Backdrop exposing (backdrop)


{-| Messages being sent by the select component
-}
type Msg
    = Toggle
    | Select String
    | Open
    | Close
    | NoOp
    | ChangeQuery String
    | Submit
    | Down
    | Up
    | Hover String


{-| Configuration record to show a dropdown component.
-}
type alias Config =
    { zIndexBackdrop : Int
    , placeholder : Maybe String
    }


{-| Required ports for this module. These should be injected in the module because ports cannot be published in a package. :/
-}
type alias Ports =
    { blur : String -> Cmd Msg, focus : String -> Cmd Msg }


{-| Model for the select component.
-}
type alias Model =
    { ports : Ports
    , open : Bool
    , query : Maybe String
    , items : List String
    , value : Maybe String
    , identifier : String
    , highlighted : Maybe String
    }


{-| Create a base configuration for presenting a select.
-}
baseConfig : Config
baseConfig =
    { zIndexBackdrop = 99
    , placeholder = Nothing
    }


{-| Initial model for a select.
-}
initialModel : Ports -> String -> List String -> ( Model, Cmd Msg )
initialModel ports identifier items =
    ( { ports = ports
      , identifier = identifier
      , open = False
      , items = items
      , query = Nothing
      , value = Nothing
      , highlighted = Nothing
      }
    , Cmd.none
    )


{-| Create a single select with a configuration and a model.
-}
singleSelect : Config -> Model -> Html Msg
singleSelect config model =
    let
        popoverDisplay =
            if model.open then
                "block"
            else
                "none"

        activeOptions' =
            activeOptionsForModel model

        zIndexItems =
            config.zIndexBackdrop + 1 |> toString
    in
        div [ id model.identifier ]
            [ node "aui-select"
                [ placeholder <| Maybe.withDefault "" config.placeholder
                , tabindex -1
                , style [ ( "position", "relative" ) ]
                ]
                [ form [ onSubmit NoOp ]
                    [ backdrop config.zIndexBackdrop Close model.open
                    , queryInput zIndexItems model
                    , dropDownButton zIndexItems model
                    , div
                        [ class "aui-popover"
                        , style
                            [ ( "position", "absolute" )
                            , ( "top", "30px" )
                            , ( "width", "100%" )
                            , ( "z-index", zIndexItems )
                            , ( "display", popoverDisplay )
                            ]
                        ]
                        [ ul [ class "aui-optionlist" ]
                            (List.map (asOption model) activeOptions')
                        ]
                    ]
                ]
            ]


{-| Update function for the select component. This should be called from within your update function when handling `Msg`
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle ->
            ( { model | open = not model.open }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        Select x ->
            ( { model
                | value = Just x
                , open = False
                , query = Nothing
              }
            , Cmd.none
            )

        Open ->
            handleOpen model

        Close ->
            let
                newValue =
                    if model.value == model.query then
                        model.value
                    else
                        Nothing
            in
                ( { model | value = newValue, open = False }, Cmd.none )

        ChangeQuery x ->
            handleQueryChange x model

        Submit ->
            handleSubmit model

        Hover item ->
            ( { model | highlighted = Just item }, Cmd.none )

        Up ->
            changeHighlighted -1 model

        Down ->
            changeHighlighted 1 model


changeHighlighted : Int -> Model -> ( Model, Cmd Msg )
changeHighlighted patch oldModel =
    let
        activeOptionsForModel' =
            activeOptionsForModel oldModel

        newHighlighted =
            case oldModel.highlighted of
                Nothing ->
                    List.head activeOptionsForModel'

                Just oldHighlighted ->
                    let
                        newByIndex =
                            elemIndex oldHighlighted activeOptionsForModel'
                                `Maybe.andThen` (\index -> getAt (index + patch) activeOptionsForModel')
                    in
                        case newByIndex of
                            Nothing ->
                                oldModel.highlighted

                            Just x ->
                                newByIndex
    in
        ( { oldModel | highlighted = newHighlighted }, Cmd.none )


handleOpen : Model -> ( Model, Cmd Msg )
handleOpen model =
    let
        newQuery =
            model.value

        newHighlighted =
            activeOptionForQuery newQuery model
    in
        ( { model | open = True, query = newQuery, highlighted = newHighlighted }, model.ports.focus ("#" ++ model.identifier ++ " input") )


handleQueryChange : String -> Model -> ( Model, Cmd Msg )
handleQueryChange newQuery oldModel =
    let
        highlighted =
            activeOptionsForQuery (Just newQuery) oldModel |> List.head
    in
        ( { oldModel | highlighted = highlighted, query = Just newQuery }, Cmd.none )


handleSubmit : Model -> ( Model, Cmd Msg )
handleSubmit model =
    let
        activeOptions' =
            activeOptionsForModel model
    in
        ( { model | open = False, query = Nothing, highlighted = Nothing, value = model.highlighted }, model.ports.blur ("#" ++ model.identifier ++ " input") )


activeOptionForQuery : Maybe String -> Model -> Maybe String
activeOptionForQuery queryOpt model =
    activeOptionsForQuery queryOpt model |> List.head


activeOptionsForQuery : Maybe String -> Model -> List String
activeOptionsForQuery queryOpt model =
    case queryOpt of
        Nothing ->
            model.items

        Just query ->
            List.filter (\x -> contains (toLower query) (toLower x)) model.items


activeOptionsForModel : Model -> List String
activeOptionsForModel model =
    activeOptionsForQuery model.query model


dropDownButton : String -> Model -> Html Msg
dropDownButton zIndex model =
    button
        [ class "aui-button"
        , attribute "role" "button"
        , tabindex -1
        , style [ ( "z-index", zIndex ) ]
        , type' "button"
        , onClick
            (if model.open then
                Close
             else
                Open
            )
        ]
        []


queryInput : String -> Model -> Html Msg
queryInput zIndex model =
    let
        inputValue =
            if model.open then
                Maybe.withDefault "" model.query
            else
                Maybe.withDefault "" model.value
    in
        input
            [ value inputValue
            , type' "undefined"
            , class "text"
            , id "mySelect"
            , autocomplete False
            , style [ ( "position", "relative" ), ( "z-index", zIndex ) ]
            , on "input" (Json.map ChangeQuery Html.Events.targetValue)
            , onSpecialKeys
            , onFocus Open
            ]
            []


onSpecialKeys : Html.Attribute Msg
onSpecialKeys =
    let
        tagger code =
            if code == 13 then
                Submit
            else if code == 40 then
                Down
            else if code == 38 then
                Up
            else
                NoOp
    in
        on "keydown"
            (Json.map tagger keyCode)


asOption : Model -> String -> Html Msg
asOption model opt =
    let
        active =
            model.highlighted
                |> Maybe.map ((==) opt)
                |> Maybe.withDefault False
    in
        li
            [ attribute "role" "option"
            , class
                (if active then
                    "aui-select-active"
                 else
                    "aui-select-suggestion"
                )
            , onClick (Select opt)
            , onMouseEnter (Hover opt)
            ]
            [ text opt ]
