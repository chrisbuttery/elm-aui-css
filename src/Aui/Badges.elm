module Aui.Badges exposing (badge)

{-| Functions to present AUI badges.


# Presentation

@docs badge
-}

import Html exposing (node, Html, text)


{-| Present a badge with a given content

    badge "Hello world!"
-}
badge : String -> Html msg
badge inner =
    node "aui-badge" [] [ text inner ]
