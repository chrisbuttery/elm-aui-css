module Demo.Dropdown exposing (view, initialModel, update, Model, Msg)

import Aui.Dropdown exposing (..)
import Aui.Buttons exposing (Style(Primary))
import Demo.Base exposing (demoSection)
import Html exposing (Html, text, ul, li, a, div, span)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


type alias Model =
    { dropdown1 : Aui.Dropdown.Model
    , dropdown2 : Aui.Dropdown.Model
    }


type Msg
    = DropdownMsg1 Aui.Dropdown.Msg
    | DropdownMsg2 Aui.Dropdown.Msg
    | SelectedItem1
    | SelectedItem2


initialModel : Model
initialModel =
    { dropdown1 = Aui.Dropdown.initialModel
    , dropdown2 = Aui.Dropdown.initialModel
    }


view : Model -> Html Msg
view model =
    demoSection "Dropdowns"
        [ span [ style [ ( "padding", "5px" ) ] ]
            [ dropdown (baseConfig DropdownMsg1 |> withAlignment Left |> withStyle Primary)
                [ text "The Crimson Short One" ]
                [ dropdownSection Nothing
                    [ ul []
                        [ li [] [ a [ onClick SelectedItem1 ] [ text "Red Dwarf" ] ]
                        , li [] [ a [ onClick SelectedItem1 ] [ text "Long Red Dwarf" ] ]
                        , li [] [ a [ onClick SelectedItem1 ] [ text "High Red Dwarf" ] ]
                        , li [] [ a [ onClick SelectedItem1 ] [ text "Nanobot Red Dwarf" ] ]
                        ]
                    ]
                , dropdownSection (Just "Support Ships")
                    [ ul []
                        [ li [] [ a [ onClick SelectedItem1 ] [ text "Starbug" ] ]
                        , li [] [ a [ onClick SelectedItem1 ] [ text "Blue Midget" ] ]
                        , li [] [ a [ onClick SelectedItem1 ] [ text "White Giant" ] ]
                        ]
                    ]
                , dropdownSection (Just "Other Ships")
                    [ ul []
                        [ li [] [ a [ onClick SelectedItem1 ] [ text "Wildfire" ] ]
                        , li [] [ a [ onClick SelectedItem1 ] [ text "SSS Esperanto" ] ]
                        , li [] [ a [ onClick SelectedItem1 ] [ text "Nova 5" ] ]
                        ]
                    ]
                ]
                model.dropdown1
            ]
        , span [ style [ ( "padding", "5px" ) ] ]
            [ dropdown (baseConfig DropdownMsg2 |> withAlignment Right)
                [ text "Button" ]
                [ dropdownSection (Just "Support ")
                    [ ul []
                        [ li [] [ a [ onClick SelectedItem2 ] [ text "Content for right aligned" ] ]
                        ]
                    ]
                ]
                model.dropdown2
            ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        DropdownMsg1 x ->
            let
                newDropdown =
                    Aui.Dropdown.update x model.dropdown1
            in
                { model | dropdown1 = newDropdown }

        SelectedItem1 ->
            { model | dropdown1 = close model.dropdown1 }

        DropdownMsg2 x ->
            let
                newDropdown =
                    Aui.Dropdown.update x model.dropdown2
            in
                { model | dropdown2 = newDropdown }

        SelectedItem2 ->
            { model | dropdown2 = close model.dropdown2 }
