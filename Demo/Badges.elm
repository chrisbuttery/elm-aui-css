module Demo.Badges exposing (view)

import Demo.Base exposing (demoSection)
import Aui.Badges exposing (..)
import Html exposing (..)


view : Html a
view =
    demoSection "Badges"
        (List.map (toString >> badge) [1..10])
