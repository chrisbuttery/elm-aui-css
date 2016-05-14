module Demo.Avatars exposing (view)

import Demo.Base exposing (demoSection)
import Html exposing (Html)
import Aui.Avatars exposing (..)


view : Html a
view =
    demoSection "Avatars"
        [ avatar (withSize XSmall) personAvatar
        , avatar (withSize Small) personAvatar
        , avatar (withSize Medium) personAvatar
        , avatar (withSize Large) personAvatar
        , avatar (withSize XLarge) personAvatar
        , avatar (withSize XXLarge) personAvatar
        , avatar (withSize XSmall |> asProject) projectAvatar
        , avatar (withSize Small |> asProject) projectAvatar
        , avatar (withSize Medium |> asProject) projectAvatar
        , avatar (withSize Large |> asProject) projectAvatar
        , avatar (withSize XLarge |> asProject) projectAvatar
        , avatar (withSize XXLarge |> asProject) projectAvatar
        ]


personAvatar : String
personAvatar =
    "//docs.atlassian.com/aui/latest/docs/images/avatar-96.png"


projectAvatar : String
projectAvatar =
    "//docs.atlassian.com/aui/latest/docs/images/project-128.png"
