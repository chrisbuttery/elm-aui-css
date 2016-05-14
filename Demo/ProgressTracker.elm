module Demo.ProgressTracker exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (style)
import Demo.Base exposing (demoSection)
import Aui.ProgressTracker exposing (..)


view : Html a
view =
    demoSection "Progress Trackers"
        [ div [ style [ ( "padding", "20px" ) ] ]
            [ tracker [ "Step 1", "Step 2", "Step 3" ] 0
            , tracker [ "Step 1", "Step 2", "Step 3" ] 1
            , tracker [ "Step 1", "Step 2", "Step 3" ] 2
            ]
        , div [ style [ ( "padding", "20px" ), ( "background", "#f5f5f5" ) ] ]
            [ invertedTracker [ "Step 1", "Step 2", "Step 3" ] 0
            , invertedTracker [ "Step 1", "Step 2", "Step 3" ] 1
            , invertedTracker [ "Step 1", "Step 2", "Step 3" ] 2
            ]
        ]
