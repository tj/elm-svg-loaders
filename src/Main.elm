module Main exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Svg.Loaders exposing (..)


main =
    div
        [ style "padding" "50px"
        , style "display" "grid"
        , style "gap" "32px"
        ]
        [ viewLoader "puff"
            [ puff [ color "#000", size 32 ]
            , puff [ color "#000", size 24 ]
            , puff [ color "#000", size 16 ]
            ]
        , viewLoader "audio"
            [ audio [ color "#000", size 32 ]
            , audio [ color "#000", size 24 ]
            , audio [ color "#000", size 16 ]
            ]
        , viewLoader "bars"
            [ bars [ color "#000", size 32 ]
            , bars [ color "#000", size 24 ]
            , bars [ color "#000", size 16 ]
            ]
        , viewLoader "grid"
            [ grid [ color "#000", size 32 ]
            , grid [ color "#000", size 24 ]
            , grid [ color "#000", size 16 ]
            ]
        , viewLoader "rings"
            [ rings [ color "#000", size 32 ]
            , rings [ color "#000", size 24 ]
            , rings [ color "#000", size 16 ]
            ]
        ]


viewLoader : String -> List (Html msg) -> Html msg
viewLoader name examples =
    div
        [ style "display" "grid"
        , style "gap" "40px"
        , style "grid-auto-flow" "column"
        , style "justify-content" "start"
        ]
        (text name :: examples)
