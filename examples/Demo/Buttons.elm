module Demo.Buttons exposing (view, model, update, Model, Msg)

import Demo.Base exposing (demoSection)
import Html exposing (Html, div, text, h3, i)
import Html.Attributes exposing (style)
import Aui.Buttons exposing (..)


type Msg
    = Clicked String
    | NoOp


type alias Model =
    Maybe String


model : Model
model =
    Nothing


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        Clicked s ->
            Just s


view : Model -> Html Msg
view model =
    demoSection "Buttons"
        [ div []
            [ case model of
                Just s ->
                    text ("Last clicked: " ++ s ++ "!")

                Nothing ->
                    i [] [ text "Nothing clicked..." ]
            ]
        , div [ style [ ( "padding", "20px" ) ] ]
            [ h3 [] [ text "Default" ]
            , button (baseConfig |> withAction (Clicked "Default")) [ text "Default" ]
            , button (baseConfig |> disable) [ text "Default Disabled" ]
            ]
        , div [ style [ ( "padding", "20px" ) ] ]
            [ h3 [] [ text "Primary" ]
            , button (baseConfig |> withStyle primaryStyle) (Clicked "Primary") [ text "Primary" ]
            , button (baseConfig |> withStyle primaryStyle |> disable) (Clicked "Primary Disabled") [ text "Primary Disabled" ]
            ]
        , div [ style [ ( "padding", "20px" ) ] ]
            [ h3 [] [ text "Light" ]
            , button (baseConfig |> withStyle lightStyle) (Clicked "Light") [ text "Light" ]
            , button (baseConfig |> withStyle lightStyle |> disable) (Clicked "Light Disabled") [ text "Light Disabled" ]
            ]
        , div [ style [ ( "padding", "20px" ) ] ]
            [ h3 [] [ text "Subtle" ]
            , button (baseConfig |> withStyle subtleStyle) (Clicked "Subtle") [ text "Subtle" ]
            , button (baseConfig |> withStyle subtleStyle |> disable) (Clicked "Subtle Disabled") [ text "Subtle Disabled" ]
            ]
        , div [ style [ ( "padding", "20px" ) ] ]
            [ h3 [] [ text "Link" ]
            , button (baseConfig |> withStyle linkStyle) (Clicked "Link") [ text "Link" ]
            , button (baseConfig |> withStyle linkStyle |> disable) (Clicked "Link Disabled") [ text "Link Disabled" ]
            ]
        , div [ style [ ( "padding", "20px" ) ] ]
            [ h3 [] [ text "With href" ]
            , button (baseConfig |> withStyle linkStyle |> withHref "http://elm-lang.org/") NoOp [ text "Go to elm" ]
            , button (baseConfig |> withStyle linkStyle |> disable |> withHref "http://elm-lang.org/") NoOp [ text "Go to elm (disabled)" ]
            ]
        , div [ style [ ( "padding", "20px" ) ] ]
            [ h3 [] [ text "Groups" ]
            , buttonGroup
                [ button baseConfig (Clicked "Button 1") [ text "Button 1" ]
                , button baseConfig (Clicked "Button 2") [ text "Button 2" ]
                , button baseConfig (Clicked "Button 3") [ text "Button 3" ]
                ]
            ]
        ]
