port module Aui.Select exposing (singleSelect, Config, Model, initialModel, update, Msg)

import Html exposing (Html, ul, li, div, button, node, input, select, text, form, span)
import Html.Attributes exposing (value, type', class, name, placeholder, tabindex, autocomplete, attribute, style, id)
import Html.Events exposing (onClick, onFocus, onBlur, onInput, keyCode, on, onWithOptions, defaultOptions, onSubmit, onMouseEnter)
import String exposing (contains, toLower)
import Json.Decode as Json
import Platform.Cmd
import List.Extra exposing (elemIndex, getAt)


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



-- | KeyPress Int


type alias Config =
    { name : Maybe String
    , placeholder : String
    }


type alias Model =
    { open : Bool
    , query : Maybe String
    , items : List String
    , value : Maybe String
    , highlighted : Maybe String
    }


initialModel : List String -> ( Model, Cmd Msg )
initialModel items =
    ( { open = False, items = items, query = Nothing, value = Nothing, highlighted = Nothing }, Cmd.none )


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


port auiBlur : String -> Cmd msg


port auiFocus : String -> Cmd msg


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
        ( { model | open = True, query = newQuery, highlighted = newHighlighted }, auiFocus "select" )


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
        ( { model | open = False, query = Nothing, highlighted = Nothing, value = model.highlighted }, auiBlur "some" )


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
    in
        div []
            [ div [] [ text <| toString model ]
            , node "aui-select"
                [ placeholder "Select a product"
                , tabindex -1
                , style [ ( "position", "relative" ) ]
                ]
                [ form [ onSubmit NoOp ]
                    [ backdrop model
                    , queryInput model
                    , dropDownButton model
                    , div
                        [ class "aui-popover"
                        , style
                            [ ( "position", "absolute" )
                            , ( "top", "30px" )
                            , ( "width", "100%" )
                            , ( "z-index", "101" )
                            , ( "display", popoverDisplay )
                            ]
                        ]
                        [ ul [ class "aui-optionlist" ]
                            (List.map (asOption model) activeOptions')
                        ]
                    ]
                ]
            ]


backdrop : Model -> Html Msg
backdrop m =
    div
        [ style
            [ ( "background", "#000" )
            , ( "position", "fixed" )
            , ( "top", "0" )
            , ( "left", "0" )
            , ( "width", "100%" )
            , ( "height", "100%" )
            , ( "z-index", "99" )
            , ( "opacity", "0.5" )
            , ( "display"
              , if m.open then
                    "block"
                else
                    "none"
              )
            ]
        , onClick Close
        ]
        []


dropDownButton : Model -> Html Msg
dropDownButton model =
    button
        [ class "aui-button"
        , attribute "role" "button"
        , tabindex -1
        , style [ ( "z-index", "100" ) ]
        , type' "button"
        , onClick
            (if model.open then
                Close
             else
                Open
            )
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
            [ value inputValue
            , type' "undefined"
            , class "text"
            , id "mySelect"
            , autocomplete False
            , style [ ( "position", "relative" ), ( "z-index", "100" ) ]
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
