module Aui.Avatars exposing (Size(XSmall, Small, Medium, Large, XLarge, XXLarge, XXXLarge), Config, avatar)

{-| Functions to present AUI avatars.


# Types

@docs Size, Config

# Presentation

@docs avatar
-}

import Html exposing (Html, span, img)
import Html.Attributes exposing (class, src)


{-| Representation of the size of an avatar.
-}
type Size
    = XSmall
    | Small
    | Medium
    | Large
    | XLarge
    | XXLarge
    | XXXLarge


{-| Configuration record to present avatar
-}
type alias Config =
    { size : Size
    , project : Bool
    }


{-| Function to convert a configuration record and an source url to an HTML element

    avatar {size = Large, project = False}
        "http://myimage.net"
-}
avatar : Config -> String -> Html msg
avatar { size, project } source =
    let
        projectClass =
            if project then
                "aui-avatar-project "
            else
                ""

        sizeClass =
            size2class size
    in
        span [ class <| "aui-avatar " ++ projectClass ++ sizeClass ]
            [ span [ class "aui-avatar-inner" ]
                [ img [ src source ]
                    []
                ]
            ]


size2class : Size -> String
size2class s =
    case s of
        XSmall ->
            "aui-avatar-xsmall"

        Small ->
            "aui-avatar-small"

        Medium ->
            "aui-avatar-medium"

        Large ->
            "aui-avatar-large"

        XLarge ->
            "aui-avatar-xlarge"

        XXLarge ->
            "aui-avatar-xxlarge"

        XXXLarge ->
            "aui-avatar-xxxlarge"
