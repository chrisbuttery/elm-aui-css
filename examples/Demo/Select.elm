module Demo.Select exposing (view, model, Model, Msg, update)

import Demo.Base exposing (demoSection)
import Demo.Ports
import Aui.Select exposing (..)
import Html exposing (Html, form)
import Html.Attributes exposing (class)
import Html.App


type Msg
    = SelectMsg Aui.Select.Msg


type alias Model =
    { selectModel : Aui.Select.Model
    }


ports : Ports
ports =
    { blur = Demo.Ports.blur, focus = Demo.Ports.focus }


model : ( Model, Cmd Msg )
model =
    let
        ( selectModel, selectCmds ) =
            Aui.Select.initialModel ports "product-select" [ "JIRA", "Confluence", "Bamboo" ]
    in
        ( { selectModel = selectModel }, Cmd.map SelectMsg selectCmds )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectMsg x ->
            let
                ( newSelectModel, selectCmds ) =
                    Aui.Select.update x model.selectModel
            in
                ( { model | selectModel = newSelectModel }
                , Cmd.map SelectMsg selectCmds
                )


view : Model -> Html Msg
view model =
    demoSection "Selects"
        [ form [ class "aui" ]
            [ Html.App.map SelectMsg
                <| singleSelect { baseConfig | placeholder = Just "Select placeholder" }
                    model.selectModel
            ]
        ]
