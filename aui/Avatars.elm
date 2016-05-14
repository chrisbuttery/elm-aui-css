module Aui.Avatars exposing (Size(..), avatar, withSize, asProject)

import Html exposing (Html, span, img)
import Html.Attributes exposing (class, src)


type Size
    = XSmall
    | Small
    | Medium
    | Large
    | XLarge
    | XXLarge
    | XXXLarge


type alias AvatarConfig =
    { size : Size
    , project : Bool
    }


withSize : Size -> AvatarConfig
withSize size =
    { size = size
    , project = False
    }


asProject : AvatarConfig -> AvatarConfig
asProject config =
    { config | project = True }


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


avatar : AvatarConfig -> String -> Html msg
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
