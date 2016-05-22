module Aui.Lozenge exposing (lozenge, Type, generic, success, error, current, complete, moved, Presense, normal, subtle)

{-| Functions to present AUI lozenges.

# Presentation

@docs lozenge

# Types

@docs Type, generic, success, error, current, complete, moved

# Presense

@docs Presense, normal,subtle

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


{-| Generic type for lozenge
-}
generic : Type
generic =
    Generic


{-| Success type for lozenge
-}
success : Type
success =
    Success


{-| Error type for lozenge
-}
error : Type
error =
    Error


{-| Current type for lozenge
-}
current : Type
current =
    Current


{-| Comlete type for lozenge
-}
complete : Type
complete =
    Complete


{-| Moved type for lozenge
-}
moved : Type
moved =
    Moved


{-| Presense style for a lozenge
-}
type Presense
    = Normal
    | Subtle


{-| Normal presence
-}
normal : Presense
normal =
    Normal


{-| Subtle presence
-}
subtle : Presense
subtle =
    Subtle


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
