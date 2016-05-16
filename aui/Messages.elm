module Aui.Messages exposing (Type(..), message, closableMessage)

{-| Functions to present AUI messages.


# Types

@docs Type

# Presentation

@docs message, closableMessage

-}

import Html exposing (Html, div, p, span)
import Html.Attributes exposing (class, tabindex, attribute)
import Html.Events exposing (onClick)
import String


{-| Different message types
-}
type Type
    = Generic
    | Error
    | Warning
    | Success
    | Info
    | Hint


{-| Create a message.

    message Warning
        [ text "Title" ]
        [ text "There is a warning" ]
-}
message : Type -> List (Html a) -> List (Html a) -> Html a
message t =
    baseMessage t Nothing


{-| Create a message dialog that has a close button and triggers a message.

    closableMessage Warning
        Closed
        [ text "Title" ]
        [ text "There is a warning" ]
-}
closableMessage : Type -> a -> List (Html a) -> List (Html a) -> Html a
closableMessage t action =
    baseMessage t (Just action)


baseMessage : Type -> Maybe a -> List (Html a) -> List (Html a) -> Html a
baseMessage t action title body =
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


typeToString : Type -> String
typeToString =
    (toString >> String.toLower >> ((++) "aui-message-"))
