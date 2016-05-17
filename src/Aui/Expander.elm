module Aui.Expander exposing (expander, Config, baseConfig, Model, initialModel, Msg, update)

{-| Functions to present AUI expander.


# Types

@docs Config

# Model

@docs Model, Msg, initialModel

# Update

@docs update

# Presentation

@docs expander

# Utility

@docs baseConfig
-}

import Html exposing (Html, div, text, a)
import Html.Attributes exposing (class, attribute, style)
import Html.App as HA
import Html.Events exposing (onClick)
import String exposing (toLower)


{-| Configuration record for presenting an expander.
-}
type alias Config a =
    { moreText : String
    , lessText : String
    , msgMap : Msg -> a
    , minHeight : Maybe String
    }


{-| Model for the expander comonent.
-}
type alias Model =
    Bool


{-| Messages being sent by the expander component.
-}
type Msg
    = Toggle


{-| Default model for a expander component
-}
initialModel : Model
initialModel =
    False


{-| Update function for the expander component. This should be called from within your update function when handling `Msg`
-}
update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle ->
            not model


{-| Present a expander given a configuration, content and model.

    view model =
        expander (baseConfig ExpanderMsg)
            "Lorem ipsum..."
            model.expander
-}
expander : Config a -> String -> Model -> Html a
expander config body model =
    div
        [ class "aui-expander-content"
        , attribute "aria-expanded" (toLower <| toString model)
        , style [ ( "min-height", Maybe.withDefault "" config.minHeight ) ]
        ]
        [ text body
        , HA.map config.msgMap
            (a
                [ class "aui-expander-trigger aui-expander-reveal-text"
                , onClick Toggle
                ]
                [ text
                    <| if model then
                        config.lessText
                       else
                        config.moreText
                ]
            )
        ]


{-| Create a default configuration with sane defaults to present an expander.
-}
baseConfig : (Msg -> a) -> Config a
baseConfig x =
    { moreText = "Show more"
    , lessText = "Show less"
    , msgMap = x
    , minHeight = Just "1.5em"
    }
