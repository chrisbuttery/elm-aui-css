module Demo.Messages exposing (view, update, model, Msg, Model)

import Demo.Base exposing (demoSection)
import Aui.Messages exposing (..)
import Html exposing (Html, div, text, h3)


type alias Model =
    List Type


type Msg
    = Close Type


model : Model
model =
    allTypes


view : Model -> Html Msg
view model =
    demoSection "Messages"
        [ div []
            (h3 [] [ text "Stale messages" ] :: (List.map asMessage allTypes))
        , div []
            (h3 [] [ text "Closable messages" ] :: (List.map asClosableMessage model))
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Close t ->
            List.filter ((/=) t) model


asClosableMessage : Type -> Html Msg
asClosableMessage t =
    closableMessage t
        (Close t)
        [ text "Title" ]
        [ text "Something important" ]


asMessage : Type -> Html Msg
asMessage t =
    message t
        [ text "Title" ]
        [ text "Something important" ]


allTypes : List Type
allTypes =
    [ Generic, Error, Warning, Success, Info, Hint ]
