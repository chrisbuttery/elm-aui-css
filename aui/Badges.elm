module Aui.Badges exposing (badge)

import Html exposing (node, Html, text)


badge : String -> Html msg
badge inner =
    node "aui-badge" [] [ text inner ]
