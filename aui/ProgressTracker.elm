module Aui.ProgressTracker exposing (tracker, invertedTracker)

import Html exposing (ol, li, span, text, Html)
import Html.Attributes exposing (class, style)


baseTracker : String -> List String -> Int -> Html a
baseTracker trackerClass items current =
    let
        itemWidth =
            toString (100.0 / (toFloat <| List.length items)) ++ "%"
    in
        ol [ class trackerClass ]
            (List.indexedMap (itemToLi itemWidth current) items)


tracker : List String -> Int -> Html a
tracker =
    baseTracker "aui-progress-tracker"


invertedTracker : List String -> Int -> Html a
invertedTracker =
    baseTracker "aui-progress-tracker aui-progress-tracker-inverted"


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
