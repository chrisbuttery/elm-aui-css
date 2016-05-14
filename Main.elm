module Main exposing (..)

import Html exposing (text, Html, div, h1, section)
import Html.Attributes exposing (class, style)
import Html.App exposing (beginnerProgram, program)
import Demo.Avatars

import Demo.Buttons
import Demo.Labels
import Demo.Expander
-- import Demo.Badges
-- import Demo.Icons
-- import Demo.Lozenge
import Demo.Messages
-- import Demo.ProgressIndicator
-- import Demo.ProgressTracker
import Demo.Select


type alias Model =
    { buttons : Demo.Buttons.Model
    , labels : Demo.Labels.Model
    , expander : Demo.Expander.Model
    , messages : Demo.Messages.Model
    , selects : Demo.Select.Model
    }


type Msg
    = NoOp
    | ButtonMsg Demo.Buttons.Msg
    | LabelsMsg Demo.Labels.Msg
    | ExpanderMsg Demo.Expander.Msg
    | MessagesMsg Demo.Messages.Msg
    | SelectMsg Demo.Select.Msg


main : Program Never
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\x -> Sub.none)
        }


init : (Model, Cmd Msg)
init =
    let
        (selects, selectsCmds) = Demo.Select.model
    in
        ({ buttons = Demo.Buttons.model
        , labels = Demo.Labels.model
        , expander = Demo.Expander.model
        , messages = Demo.Messages.model
        , selects = selects
        }
        , Cmd.map SelectMsg selectsCmds)


view : Model -> Html Msg
view model =
    div [ class "aui-page-panel" ]
        [ div [ class "aui-page-panel-inner" ]
            [ section [ class "aui-page-panel-content" ]
                [ Html.App.map (\x -> NoOp) Demo.Avatars.view
                -- , Html.App.map (\x -> NoOp) Demo.Badges.view
                -- , Html.App.map ButtonMsg (Demo.Buttons.view model.buttons)
                -- , Html.App.map LabelsMsg (Demo.Labels.view model.labels)
                -- , Html.App.map ExpanderMsg (Demo.Expander.view model.expander)
                -- , Html.App.map (\x -> NoOp) Demo.Icons.view
                -- , Html.App.map (\x -> NoOp) Demo.Lozenge.view
                -- , Html.App.map MessagesMsg (Demo.Messages.view model.messages)
                -- , Html.App.map (\x -> NoOp) Demo.ProgressIndicator.view
                -- , Html.App.map (\x -> NoOp) Demo.ProgressTracker.view
                , Html.App.map SelectMsg (Demo.Select.view model.selects)
                ]
            ]
        ]


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)

        ButtonMsg x ->
            ({ model | buttons = Demo.Buttons.update x model.buttons }, Cmd.none)

        LabelsMsg x ->
            ({ model | labels = Demo.Labels.update x model.labels }, Cmd.none)

        ExpanderMsg x ->
            ({ model | expander = Demo.Expander.update x model.expander }, Cmd.none)

        MessagesMsg x ->
            ({ model | messages = Demo.Messages.update x model.messages }, Cmd.none)

        SelectMsg x ->
            let
                (newSelects, selectsCmds) =
                    Demo.Select.update x model.selects
            in
              ({model | selects = newSelects}, Cmd.map SelectMsg selectsCmds)
