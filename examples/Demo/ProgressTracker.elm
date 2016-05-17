module Demo.ProgressTracker exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (style)
import Demo.Base exposing (demoSection)
import Aui.ProgressTracker exposing (..)


view : Html a
view =
    demoSection "Progress Trackers"
        [ div [ style [ ( "padding", "20px" ) ] ]
            [ progressTracker [ "Step 1", "Step 2", "Step 3" ] 0
            , progressTracker [ "Step 1", "Step 2", "Step 3" ] 1
            , progressTracker [ "Step 1", "Step 2", "Step 3" ] 2
            ]
        , div [ style [ ( "padding", "20px" ), ( "background", "#f5f5f5" ) ] ]
            [ invertedProgressTracker [ "Step 1", "Step 2", "Step 3" ] 0
            , invertedProgressTracker [ "Step 1", "Step 2", "Step 3" ] 1
            , invertedProgressTracker [ "Step 1", "Step 2", "Step 3" ] 2
            ]
        ]
