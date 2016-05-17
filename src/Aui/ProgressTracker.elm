module Aui.ProgressTracker exposing (progressTracker, invertedProgressTracker)

{-| Functions to present AUI progress tracker.


# Presentation

@docs progressTracker, invertedProgressTracker

-}

import Html exposing (ol, li, span, text, Html)
import Html.Attributes exposing (class, style)


{-| Create a progress tracker with items and a given active index (zero based).

    progressTracker ["Step 1", "Step 2", "Step 3"] 1
-}
progressTracker : List String -> Int -> Html a
progressTracker =
    baseTracker "aui-progress-tracker"


{-| Create an inverted progress tracker with items and a given active index.
-}
invertedProgressTracker : List String -> Int -> Html a
invertedProgressTracker =
    baseTracker "aui-progress-tracker aui-progress-tracker-inverted"


baseTracker : String -> List String -> Int -> Html a
baseTracker trackerClass items current =
    let
        itemWidth =
            toString (100.0 / (toFloat <| List.length items)) ++ "%"
    in
        ol [ class trackerClass ]
            (List.indexedMap (itemToLi itemWidth current) items)


itemToLi : String -> Int -> Int -> String -> Html a
itemToLi itemWidth current index item =
    let
        classString =
            if current == index then
                "aui-progress-tracker-step aui-progress-tracker-step-current"
            else
                "aui-progress-tracker-step"
    in
        li [ class classString, style [ ( "width", itemWidth ) ] ]
            [ span []
                [ text item ]
            ]
