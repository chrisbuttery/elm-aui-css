module Aui.Messages exposing (message, Type(..), closableMessage)

import Html exposing (Html, div, p, span)
import Html.Attributes exposing (class, tabindex, attribute)
import Html.Events exposing (onClick)
import String


type Type
    = Generic
    | Error
    | Warning
    | Success
    | Info
    | Hint


typeToString : Type -> String
typeToString =
    (toString >> String.toLower >> ((++) "aui-message-"))


baseMessage : Type -> Maybe a -> ( List (Html a), List (Html a) ) -> Html a
baseMessage t action ( title, body ) =
    let
        closeNodes =
            case action of
                Nothing ->
                    []

                Just a ->
                    [ span [ class "aui-icon icon-close", attribute "role" "button", tabindex 0, onClick a ]
                        []
                    ]
    in
        div [ class <| "aui-message closeable " ++ typeToString t ]
            (p [ class "title" ] title :: body ++ closeNodes)


message : Type -> ( List (Html a), List (Html a) ) -> Html a
message t =
    baseMessage t Nothing


closableMessage : Type -> a -> ( List (Html a), List (Html a) ) -> Html a
closableMessage t action =
    baseMessage t (Just action)
