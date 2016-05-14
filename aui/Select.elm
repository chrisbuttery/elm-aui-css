port module Aui.Select exposing (singleSelect, Config, Model, initialModel, update, Msg)

import Html exposing (Html, ul, li, div, button, node, input, select, text)
import Html.Attributes exposing (value, type', class, name, placeholder, tabindex, autocomplete, attribute, style)
import Html.Events exposing (onClick, onFocus, onBlur, onInput, keyCode, on, onWithOptions, defaultOptions)
import String exposing (contains, toLower)
import Json.Decode as Json
import Char
import Platform.Cmd

type Msg
    = Toggle
    | Select String
    | Open
    | Close
    |NoOp
    | KeyPress Int


type alias Config =
    { name : Maybe String
    , placeholder : String
    }


type alias Model =
    { open : Bool
    , query : Maybe String
    , items : List String
    , value : Maybe String
    }


initialModel : List String -> (Model,Cmd Msg)
initialModel  items =
    ({ open = False, items = items, query = Just "abc", value = Nothing }, Cmd.none)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Toggle ->
            ({ model | open = not model.open }, Cmd.none)

        NoOp ->
            ( model , Cmd.none)

        Select x ->
            ({ model
                | value = Just x
                , open = False
                , query = Nothing
            }, Cmd.none)

        Open ->
            ({ model | open = True }, Cmd.none)

        Close ->
            ({ model | open = False }, Cmd.none)

        KeyPress k ->
            let
                term =
                    (Maybe.withDefault "" model.query) ++ (String.cons (Char.fromCode k) "")
            in
                case k of
                    13 ->
                        handleSubmit model
                    _ ->
                        ({ model | query = Just term }, Cmd.none)

port auiBlur : String -> Cmd msg

handleSubmit : Model -> (Model, Cmd Msg)
handleSubmit model =
    let
        activeOptions' =
            activeOptions model
    in
        ({ model | open = False, query = Nothing, value = List.head activeOptions'}, auiBlur "some")

activeOptions : Model -> List String
activeOptions model =
    case model.query of
        Nothing ->
            model.items

        Just query ->
            List.filter (\x -> contains (toLower query) (toLower x)) model.items


singleSelect : Config -> Model -> Html Msg
singleSelect config model =
    let
        popoverDisplay =
            if model.open then
                "block"
            else
                "none"

        activeOptions' =
            activeOptions model

    in
        div []
            [ div [] [ text <| toString model ]
            , node "aui-select"
                [ placeholder "Select a product"
                , tabindex -1
                , style [ ( "position", "relative" ) ]
                ]
                [ queryInput model
                , dropDownButton
                , div
                    [ class "aui-popover"
                    , style
                        [ ( "position", "absolute" )
                        , ( "top", "30px" )
                        , ( "width", "100%" )
                        , ( "display", popoverDisplay )
                        ]
                    ]
                    [ ul [ class "aui-optionlist" ]
                        (List.map asOption activeOptions')
                    ]
                ]
            ]


dropDownButton : Html Msg
dropDownButton =
    button
        [ class "aui-button"
        , attribute "role" "button"
        , tabindex -1
        , type' "button"
        , onClick Toggle
        ]
        []


queryInput : Model -> Html Msg
queryInput model =
    let
        inputValue =
            if model.open then
                Maybe.withDefault "" model.query
            else
                Maybe.withDefault "" model.value
    in
        input
            [ value (Maybe.withDefault "" model.query)
            , type' "undefined"
            , class "text"
            , onFocus Open
            , onBlur Close
            , autocomplete False
            , onWithOptions "keypress"
                { defaultOptions | preventDefault = False}
                (Json.map KeyPress keyCode)
            , onWithOptions "submit"
                { defaultOptions | preventDefault = True}
                (Json.succeed NoOp)
            ]
            []


asOption : String -> Html Msg
asOption opt =
    li
        [ attribute "role" "option"
        , class "aui-select-suggestion"
        , onClick (Select opt)
        ]
        [ text opt ]
