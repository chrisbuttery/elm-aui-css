module Demo.Expander exposing (view, model, update, Model, Msg)

import Demo.Base exposing (demoSection)
import Html exposing (Html)
import Aui.Expander exposing (..)


type alias Model =
    Bool


type Msg
    = Toggle


model : Model
model =
    False


update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle ->
            not model


view : Model -> Html Msg
view model =
    demoSection "Expander"
        [ expander (baseConfig Toggle) longText model
        ]


longText : String
longText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
