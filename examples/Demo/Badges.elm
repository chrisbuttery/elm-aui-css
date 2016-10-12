module Demo.Badges exposing (view)

import Demo.Base exposing (demoSection)
import Aui.Badges exposing (..)
import Html exposing (..)


view : Html a
view =
    demoSection "Badges"
        (List.map presentBadge <| List.range 1 10)


presentBadge : Int -> Html a
presentBadge n =
    span [] [ badge (toString n), text " " ]
