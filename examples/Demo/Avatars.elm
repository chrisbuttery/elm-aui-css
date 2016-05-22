module Demo.Avatars exposing (view)

import Demo.Base exposing (demoSection)
import Html exposing (Html)
import Aui.Avatars exposing (..)


view : Html a
view =
    demoSection "Avatars"
        [ avatar (config |> xsmall) personAvatar
        , avatar (config |> small) personAvatar
        , avatar (config |> medium) personAvatar
        , avatar (config |> large) personAvatar
        , avatar (config |> xlarge) personAvatar
        , avatar (config |> xxlarge) personAvatar
        , avatar (config |> xxxlarge) personAvatar
        , avatar (config |> xsmall |> project) projectAvatar
        , avatar (config |> small |> project) projectAvatar
        , avatar (config |> medium |> project) projectAvatar
        , avatar (config |> large |> project) projectAvatar
        , avatar (config |> xlarge |> project) projectAvatar
        , avatar (config |> xxlarge |> project) projectAvatar
        , avatar (config |> xxxlarge |> project) projectAvatar
        ]


personAvatar : String
personAvatar =
    "//docs.atlassian.com/aui/latest/docs/images/avatar-96.png"


projectAvatar : String
projectAvatar =
    "//docs.atlassian.com/aui/latest/docs/images/project-128.png"
