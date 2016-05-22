module Aui.Avatars exposing (Config, avatar, config, xsmall, small, medium, large, xlarge, xxlarge, xxxlarge, project)

{-| Functions to present AUI avatars.


# Types

@docs Config

# Presentation

@docs avatar

# Utiltity

@docs config, xsmall, small, medium, large, xlarge, xxlarge, xxxlarge, project
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


{-| A type for rendering an avatar
-}
type Config
    = Config Size Bool


{-| Default configuration for an avatar
-}
config : Config
config =
    Config Medium False


{-| Set the configuration to render an extra small avatar
-}
xsmall : Config -> Config
xsmall (Config _ project) =
    Config XSmall project


{-| Set the configuration to render a small avatar
-}
small : Config -> Config
small (Config _ project) =
    Config Small project


{-| Set the configuration to render a medium avatar
-}
medium : Config -> Config
medium (Config _ project) =
    Config Medium project


{-| Set the configuration to render a large avatar
-}
large : Config -> Config
large (Config _ project) =
    Config Large project


{-| Set the configuration to render a extra large avatar
-}
xlarge : Config -> Config
xlarge (Config _ project) =
    Config XLarge project


{-| Set the configuration to render a extra-extra large avatar
-}
xxlarge : Config -> Config
xxlarge (Config _ project) =
    Config XXLarge project


{-| Set the configuration to render a extra-extra-extra large avatar
-}
xxxlarge : Config -> Config
xxxlarge (Config _ project) =
    Config XXXLarge project


{-| Set the configuration to render as a project avatar
-}
project : Config -> Config
project (Config size _) =
    Config size True


{-| Function to convert a configuration record and an source url to an HTML element

    avatar {size = Large, project = False}
        "http://myimage.net"
-}
avatar : Config -> String -> Html msg
avatar (Config size project) source =
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
