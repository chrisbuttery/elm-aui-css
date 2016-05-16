module Aui.Lozenge exposing (lozenge, Type(..), Presense(..))

{-| Functions to present AUI lozenges.


# Types

@docs Type, Presense

# Presentation

@docs lozenge

-}

import Html exposing (Html, span)
import Html.Attributes exposing (class)


{-| Types for a lozenge
-}
type Type
    = Generic
    | Success
    | Error
    | Current
    | Complete
    | Moved


{-| Presense style for a lozenge
-}
type Presense
    = Normal
    | Subtle


{-| Create a lozenge with presense and type
-}
lozenge : Presense -> Type -> List (Html a) -> Html a
lozenge presense t =
    span [ class <| "aui-lozenge " ++ presense2class presense ++ " " ++ (type2class t) ]


presense2class : Presense -> String
presense2class presense =
    case presense of
        Normal ->
            ""

        Subtle ->
            "aui-lozenge-subtle"


type2class : Type -> String
type2class t =
    case t of
        Generic ->
            ""

        Success ->
            "aui-lozenge-success"

        Error ->
            "aui-lozenge-error"

        Current ->
            "aui-lozenge-current"

        Complete ->
            "aui-lozenge-complete"

        Moved ->
            "aui-lozenge-moved"
