module Aui.Lozenge exposing (lozenge, Type(..), Presense(..))

import Html exposing (Html, span)
import Html.Attributes exposing (class)


type Type
    = Generic
    | Success
    | Error
    | Current
    | Complete
    | Moved


type Presense
    = Normal
    | Subtle


lozenge : Presense -> Type -> List (Html a) -> Html a
lozenge presense t inner =
    span [ class <| "aui-lozenge " ++ presense2class presense ++ " " ++ (type2class t) ]
        inner


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
