module Demo.Toggle exposing (view, update, initialModel, Model, Msg)

import Aui.Toggle exposing (..)
import Demo.Base exposing (demoSection)
import Html exposing (Html, text, div)
import Html.Attributes exposing (style)


type Msg
    = Switch1 Bool
    | Switch2 Bool


type alias Model =
    { toggle1 : Bool, toggle2 : Bool }


initialModel : Model
initialModel =
    { toggle1 = False, toggle2 = True }


view : Model -> Html Msg
view model =
    demoSection "Toggles"
        [ div [ style [ ( "padding", "5px" ) ] ] [ toggle True Switch1 model.toggle1 ]
        , div [ style [ ( "padding", "5px" ) ] ] [ toggle True Switch2 model.toggle2 ]
        , div [ style [ ( "padding", "5px" ) ] ] [ toggle False Switch1 model.toggle1 ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Switch1 x ->
            { model | toggle1 = x }

        Switch2 x ->
            { model | toggle2 = x }
