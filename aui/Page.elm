module Aui.Page exposing (page, PageSize(..), PageType(..))

import Html exposing (Html, div)
import Html.Attributes exposing (class)


type PageSize
    = XLarge
    | Large
    | Medium
    | Small


type PageType
    = Default
    | Fixed
    | Hybrid
    | Focussed PageSize
    | Notification PageSize


page : PageType -> List (Html a) -> Html a
page pageType =
    div [ class <| pageType2Class pageType ]


pageType2Class : PageType -> String
pageType2Class pageType =
    case pageType of
        Default ->
            ""

        Fixed ->
            "aui-page-focused"

        Hybrid ->
            "aui-page-hybrid"

        Focussed pageSize ->
            "aui-page-focused " ++ pageSize2Class pageSize

        Notification pageSize ->
            "aui-page-notification " ++ pageSize2Class pageSize


pageSize2Class : PageSize -> String
pageSize2Class pageSize =
    case pageSize of
        Small ->
            "aui-page-focused-small"

        Medium ->
            "aui-page-focused-medium"

        Large ->
            "aui-page-focused-large"

        XLarge ->
            "aui-page-focused-xlarge"
