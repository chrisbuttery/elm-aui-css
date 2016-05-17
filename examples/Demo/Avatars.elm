module Demo.Avatars exposing (view)

import Demo.Base exposing (demoSection)
import Html exposing (Html)
import Aui.Avatars exposing (..)


view : Html a
view =
    demoSection "Avatars"
        [ avatar { size = XSmall, project = False } personAvatar
        , avatar { size = Small, project = False } personAvatar
        , avatar { size = Medium, project = False } personAvatar
        , avatar { size = Large, project = False } personAvatar
        , avatar { size = XLarge, project = False } personAvatar
        , avatar { size = XXLarge, project = False } personAvatar
        , avatar { size = XSmall, project = True } projectAvatar
        , avatar { size = Small, project = True } projectAvatar
        , avatar { size = Medium, project = True } projectAvatar
        , avatar { size = Large, project = True } projectAvatar
        , avatar { size = XLarge, project = True } projectAvatar
        , avatar { size = XXLarge, project = True } projectAvatar
        ]


personAvatar : String
personAvatar =
    "//docs.atlassian.com/aui/latest/docs/images/avatar-96.png"


projectAvatar : String
projectAvatar =
    "//docs.atlassian.com/aui/latest/docs/images/project-128.png"
