module Aui.Expander exposing (expander, Model, initialModel, Msg, update, Config, baseConfig, withMoreText, withLessText, withMinHeight)

{-| Functions to present AUI expander.


# Config

@docs Config, withMinHeight, withMoreText, withLessText`

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
import Html.Events exposing (onClick)
import String exposing (toLower)


{-| Configuration record for presenting an expander.
-}
type Config a
    = Config (InnerConfig a)


type alias InnerConfig a =
    { moreText : String
    , lessText : String
    , msgMap : Msg -> a
    , minHeight : String
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
expander (Config config) body model =
    div
        [ class "aui-expander-content"
        , attribute "aria-expanded" (toLower <| toString model)
        , style [ ( "min-height", config.minHeight ) ]
        ]
        [ text body
        , Html.map config.msgMap
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
    Config
        { moreText = "Show more"
        , lessText = "Show less"
        , msgMap = x
        , minHeight = "1.5em"
        }


{-| Set more text for configuration
-}
withMoreText : String -> Config a -> Config a
withMoreText x (Config config) =
    Config { config | moreText = x }


{-| Set less text for configuration
-}
withLessText : String -> Config a -> Config a
withLessText x (Config config) =
    Config { config | lessText = x }


{-| Set less text for configuration
-}
withMinHeight : String -> Config a -> Config a
withMinHeight x (Config config) =
    Config { config | minHeight = x }
