module Demo.Expander exposing (view, initialModel, update, Model, Msg)

import Demo.Base exposing (demoSection)
import Html exposing (Html)
import Aui.Expander exposing (..)


type alias Model =
    Aui.Expander.Model


type Msg
    = ExpanderMsg Aui.Expander.Msg


initialModel : Model
initialModel =
    Aui.Expander.initialModel


update : Msg -> Model -> Model
update msg model =
    case msg of
        ExpanderMsg x ->
            Aui.Expander.update x model


view : Model -> Html Msg
view model =
    demoSection "Expander"
        [ expander (baseConfig ExpanderMsg) longText model
        ]


longText : String
longText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
