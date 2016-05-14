module Aui.Expander exposing (expander, Config, baseConfig)

import Html exposing (Html, div, text, a)
import Html.Attributes exposing (class, attribute, style)
import Html.Events exposing (onClick)
import String exposing (toLower)


type alias Config a =
    { moreText : String
    , lessText : String
    , toggle : a
    , minHeight : Maybe String
    }


baseConfig : a -> Config a
baseConfig x =
    { moreText = "Show more"
    , lessText = "Show less"
    , toggle = x
    , minHeight = Just "1.5em"
    }


expander : Config a -> String -> Bool -> Html a
expander config body expanded =
    div
        [ class "aui-expander-content"
        , attribute "aria-expanded" (toLower <| toString expanded)
        , style [ ( "min-height", Maybe.withDefault "" config.minHeight ) ]
        ]
        [ text body
        , a
            [ class "aui-expander-trigger aui-expander-reveal-text"
            , onClick config.toggle
            ]
            [ text
                <| if expanded then
                    config.lessText
                   else
                    config.moreText
            ]
        ]
