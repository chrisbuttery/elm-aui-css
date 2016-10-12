module Demo.Labels exposing (view, update, model, Msg, Model)

import Html exposing (Html, div, text, p)
import Aui.Labels exposing (..)
import Demo.Base exposing (demoSection)
import String


type alias Model =
    { removedItems : List String
    , items : List String
    , counter : Int
    }


type Msg
    = Remove String
    | Clicked


model : Model
model =
    { removedItems = []
    , items = List.map (\x -> "Item " ++ (toString x)) <| List.range 1 5
    , counter = 0
    }


view : Model -> Html Msg
view model =
    demoSection "Labels"
        [ p [] [ text ("Clickable label click counter: " ++ toString model.counter) ]
        , div []
            [ label baseConfig [ text "Label text" ]
            , label (baseConfig |> onClick (navigate "http://elm-lang.org/")) [ text "To elm lang" ]
            , label (baseConfig |> onClick (trigger Clicked)) [ text "Clickable label" ]
            ]
        , div []
            [ p []
                [ text "Removed: "
                , text <| String.join ", " model.removedItems
                ]
            , p []
                (List.map (\x -> label (baseConfig |> onRemove (Remove x)) [ text x ]) model.items)
            ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Remove s ->
            { model
                | removedItems = model.removedItems ++ (List.filter ((==) s)) model.items
                , items = (List.filter ((/=) s)) model.items
            }

        Clicked ->
            { model | counter = model.counter + 1 }
