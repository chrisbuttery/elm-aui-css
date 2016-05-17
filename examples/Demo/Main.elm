module Demo.Main exposing (..)

import Svg exposing (svg, path)
import Svg.Attributes exposing (width, height, d, fill)
import Html exposing (text, Html, div, p, h1, section, img, input, a)
import Html.Attributes exposing (class, style, href, attribute, src, alt)
import Html.App exposing (beginnerProgram, program)
import Demo.Base exposing (demoSection)
import Demo.Avatars
import Demo.Buttons
import Demo.Labels
import Demo.Expander
import Demo.Badges
import Demo.Icons
import Demo.Lozenge
import Demo.Messages
import Demo.ProgressIndicator
import Demo.ProgressTracker
import Demo.Select
import Demo.Tabs
import Demo.Toolbar
import Demo.Toggle
import Demo.Dropdown


type alias Model =
    { buttons : Demo.Buttons.Model
    , labels : Demo.Labels.Model
    , expander : Demo.Expander.Model
    , messages : Demo.Messages.Model
    , selects : Demo.Select.Model
    , tabs : Demo.Tabs.Model
    , toggles : Demo.Toggle.Model
    , dropdowns : Demo.Dropdown.Model
    }


type Msg
    = NoOp
    | ButtonMsg Demo.Buttons.Msg
    | LabelsMsg Demo.Labels.Msg
    | ExpanderMsg Demo.Expander.Msg
    | MessagesMsg Demo.Messages.Msg
    | SelectMsg Demo.Select.Msg
    | TabsMsg Demo.Tabs.Msg
    | ToggleMsg Demo.Toggle.Msg
    | DropdownMsg Demo.Dropdown.Msg


main : Program Never
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\x -> Sub.none)
        }


init : ( Model, Cmd Msg )
init =
    let
        ( selects, selectsCmds ) =
            Demo.Select.model
    in
        ( { buttons = Demo.Buttons.model
          , labels = Demo.Labels.model
          , expander = Demo.Expander.initialModel
          , messages = Demo.Messages.model
          , selects = selects
          , tabs = Demo.Tabs.initialModel
          , toggles = Demo.Toggle.initialModel
          , dropdowns = Demo.Dropdown.initialModel
          }
        , Cmd.map SelectMsg selectsCmds
        )


view : Model -> Html Msg
view model =
    div [ class "aui-page-focused aui-page-focused-large" ]
        [ section []
            [ intro
            , Html.App.map (\x -> NoOp) Demo.Avatars.view
            , Html.App.map (\x -> NoOp) Demo.Toolbar.view
            , Html.App.map DropdownMsg (Demo.Dropdown.view model.dropdowns)
            , Html.App.map ToggleMsg (Demo.Toggle.view model.toggles)
            , Html.App.map TabsMsg (Demo.Tabs.view model.tabs)
            , Html.App.map SelectMsg (Demo.Select.view model.selects)
            , Html.App.map (\x -> NoOp) Demo.Badges.view
            , Html.App.map ButtonMsg (Demo.Buttons.view model.buttons)
            , Html.App.map LabelsMsg (Demo.Labels.view model.labels)
            , Html.App.map ExpanderMsg (Demo.Expander.view model.expander)
            , Html.App.map (\x -> NoOp) Demo.Icons.view
            , Html.App.map (\x -> NoOp) Demo.Lozenge.view
            , Html.App.map MessagesMsg (Demo.Messages.view model.messages)
            , Html.App.map (\x -> NoOp) Demo.ProgressIndicator.view
            , Html.App.map (\x -> NoOp) Demo.ProgressTracker.view
            ]
        ]


ribbon : Html a
ribbon =
    a [ href "https://your-url", class "github-corner" ]
        [ svg
            [ width "80"
            , height "80"
            , attribute "viewbox" "0 0 250 250"
            , style [ ( "fill", "#151513" ), ( "color", "#fff" ), ( "position", "absolute" ), ( "top", "0" ), ( "right", "0" ), ( "border", "0" ) ]
            ]
            [ path [ d "M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z" ]
                []
            , path
                [ d "M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2"
                , fill "currentColor"
                , style [ ( "transform-origin", "130px 106px;" ) ]
                , Svg.Attributes.class "octo-arm"
                ]
                []
            , path
                [ d "M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z"
                , fill "currentColor"
                , Svg.Attributes.class "octo-body"
                ]
                []
            ]
        ]


intro : Html a
intro =
    demoSection "elm-aui-css"
        [ p [] [ text "AUI components ported to Elm." ]
        , p [] [ text "If you find any bugs or request other components please file an issue in the repo."]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ButtonMsg x ->
            ( { model | buttons = Demo.Buttons.update x model.buttons }, Cmd.none )

        LabelsMsg x ->
            ( { model | labels = Demo.Labels.update x model.labels }, Cmd.none )

        ExpanderMsg x ->
            ( { model | expander = Demo.Expander.update x model.expander }, Cmd.none )

        MessagesMsg x ->
            ( { model | messages = Demo.Messages.update x model.messages }, Cmd.none )

        TabsMsg x ->
            ( { model | tabs = Demo.Tabs.update x model.tabs }, Cmd.none )

        ToggleMsg x ->
            ( { model | toggles = Demo.Toggle.update x model.toggles }, Cmd.none )

        DropdownMsg x ->
            ( { model | dropdowns = Demo.Dropdown.update x model.dropdowns }, Cmd.none )

        SelectMsg x ->
            let
                ( newSelects, selectsCmds ) =
                    Demo.Select.update x model.selects
            in
                ( { model | selects = newSelects }, Cmd.map SelectMsg selectsCmds )
