module Svg.Loaders exposing
    ( audio, bars, grid, puff, rings
    , size, color
    )

{-| SVG loading indicators.


# Loaders

@docs audio, bars, grid, puff, rings


# Options

@docs size, color

-}

import Html exposing (Html, div)
import Svg exposing (..)
import Svg.Attributes exposing (..)



-- Model


type alias Option =
    Model -> Model


type alias Model =
    { size : Int
    , color : String
    }


init : List Option -> Model
init options =
    List.foldl (\f -> f)
        { size = 32
        , color = "black"
        }
        options



-- View


{-| Puff loading indicator.
-}
puff : List Option -> Html msg
puff options =
    let
        model =
            init options
    in
    svg
        [ width (String.fromInt model.size)
        , height (String.fromInt model.size)
        , stroke model.color
        , viewBox "0 0 44 44"
        ]
        [ g
            [ fill "none"
            , fillRule "evenodd"
            , strokeWidth "2"
            ]
            [ circle
                [ cx "22"
                , cy "22"
                , r "1"
                ]
                [ animate
                    [ attributeName "r"
                    , begin "0s"
                    , dur "1.8s"
                    , values "1; 20"
                    , calcMode "spline"
                    , keyTimes "0; 1"
                    , keySplines "0.165, 0.84, 0.44, 1"
                    , repeatCount "indefinite"
                    ]
                    []
                , animate
                    [ attributeName "stroke-opacity"
                    , begin "0s"
                    , dur "1.8s"
                    , values "1; 0"
                    , calcMode "spline"
                    , keyTimes "0; 1"
                    , keySplines "0.3, 0.61, 0.355, 1"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            , circle [ cx "22", cy "22", r "1" ]
                [ animate
                    [ attributeName "r"
                    , begin "-0.9s"
                    , dur "1.8s"
                    , values "1; 20"
                    , calcMode "spline"
                    , keyTimes "0; 1"
                    , keySplines "0.165, 0.84, 0.44, 1"
                    , repeatCount "indefinite"
                    ]
                    []
                , animate
                    [ attributeName "stroke-opacity"
                    , begin "-0.9s"
                    , dur "1.8s"
                    , values "1; 0"
                    , calcMode "spline"
                    , keyTimes "0; 1"
                    , keySplines "0.3, 0.61, 0.355, 1"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            ]
        ]


{-| Audio loading indicator.
-}
audio : List Option -> Html msg
audio options =
    let
        model =
            init options

        h =
            model.size |> toFloat |> (*) 1.45 |> round
    in
    svg
        [ width (String.fromInt model.size)
        , height (String.fromInt h)
        , fill model.color
        , viewBox "0 0 55 80"
        ]
        [ g
            [ transform "matrix(1 0 0 -1 0 80)"
            ]
            [ rect [ width "10", height "20", rx "3" ]
                [ animate
                    [ attributeName "height"
                    , begin "0s"
                    , dur "4.3s"
                    , values "20;45;57;80;64;32;66;45;64;23;66;13;64;56;34;34;2;23;76;79;20"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            , rect [ x "15", width "10", height "80", rx "3" ]
                [ animate
                    [ attributeName "height"
                    , begin "0s"
                    , dur "2s"
                    , values "80;55;33;5;75;23;73;33;12;14;60;80"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            , rect [ x "30", width "10", height "50", rx "3" ]
                [ animate
                    [ attributeName "height"
                    , begin "0s"
                    , dur "1.4s"
                    , values "50;34;78;23;56;23;34;76;80;54;21;50"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            , rect [ x "45", width "10", height "30", rx "3" ]
                [ animate
                    [ attributeName "height"
                    , begin "0s"
                    , dur "2s"
                    , values "30;45;13;80;56;72;45;76;34;23;67;30"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            ]
        ]


{-| Bars loading indicator.
-}
bars : List Option -> Html msg
bars options =
    let
        model =
            init options

        h =
            model.size |> toFloat |> (*) 1.03 |> round
    in
    svg
        [ width (String.fromInt model.size)
        , height (String.fromInt h)
        , fill model.color
        , viewBox "0 0 135 140"
        ]
        [ rect
            [ y "10"
            , width "15"
            , height "120"
            , rx "6"
            ]
            [ animate
                [ attributeName "height"
                , begin "0.5s"
                , dur "1s"
                , values "120;110;100;90;80;70;60;50;40;140;120"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            , animate
                [ attributeName "y"
                , begin "0.5s"
                , dur "1s"
                , values "10;15;20;25;30;35;40;45;50;0;10"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , rect [ x "30", y "10", width "15", height "120", rx "6" ]
            [ animate
                [ attributeName "height"
                , begin "0.25s"
                , dur "1s"
                , values "120;110;100;90;80;70;60;50;40;140;120"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            , animate
                [ attributeName "y"
                , begin "0.25s"
                , dur "1s"
                , values "10;15;20;25;30;35;40;45;50;0;10"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , rect [ x "60", width "15", height "140", rx "6" ]
            [ animate
                [ attributeName "height"
                , begin "0s"
                , dur "1s"
                , values "120;110;100;90;80;70;60;50;40;140;120"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            , animate
                [ attributeName "y"
                , begin "0s"
                , dur "1s"
                , values "10;15;20;25;30;35;40;45;50;0;10"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , rect [ x "90", y "10", width "15", height "120", rx "6" ]
            [ animate
                [ attributeName "height"
                , begin "0.25s"
                , dur "1s"
                , values "120;110;100;90;80;70;60;50;40;140;120"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            , animate
                [ attributeName "y"
                , begin "0.25s"
                , dur "1s"
                , values "10;15;20;25;30;35;40;45;50;0;10"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , rect [ x "120", y "10", width "15", height "120", rx "6" ]
            [ animate
                [ attributeName "height"
                , begin "0.5s"
                , dur "1s"
                , values "120;110;100;90;80;70;60;50;40;140;120"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            , animate
                [ attributeName "y"
                , begin "0.5s"
                , dur "1s"
                , values "10;15;20;25;30;35;40;45;50;0;10"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        ]


{-| Grid loading indicator.
-}
grid : List Option -> Html msg
grid options =
    let
        model =
            init options
    in
    svg
        [ width (String.fromInt model.size)
        , height (String.fromInt model.size)
        , fill model.color
        , viewBox "0 0 105 105"
        ]
        [ circle [ cx "12.5", cy "12.5", r "12.5" ]
            [ animate [ attributeName "fill-opacity", begin "0s", dur "1s", values "1;.2;1", calcMode "linear", repeatCount "indefinite" ] []
            ]
        , circle [ cx "12.5", cy "52.5", r "12.5", fillOpacity ".5" ] [ animate [ attributeName "fill-opacity", begin "100ms", dur "1s", values "1;.2;1", calcMode "linear", repeatCount "indefinite" ] [] ]
        , circle [ cx "52.5", cy "12.5", r "12.5" ]
            [ animate
                [ attributeName "fill-opacity"
                , begin "300ms"
                , dur "1s"
                , values "1;.2;1"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , circle [ cx "52.5", cy "52.5", r "12.5" ]
            [ animate
                [ attributeName "fill-opacity"
                , begin "600ms"
                , dur "1s"
                , values "1;.2;1"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , circle [ cx "92.5", cy "12.5", r "12.5" ]
            [ animate
                [ attributeName "fill-opacity"
                , begin "800ms"
                , dur "1s"
                , values "1;.2;1"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , circle [ cx "92.5", cy "52.5", r "12.5" ]
            [ animate
                [ attributeName "fill-opacity"
                , begin "400ms"
                , dur "1s"
                , values "1;.2;1"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , circle [ cx "12.5", cy "92.5", r "12.5" ]
            [ animate
                [ attributeName "fill-opacity"
                , begin "700ms"
                , dur "1s"
                , values "1;.2;1"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , circle [ cx "52.5", cy "92.5", r "12.5" ]
            [ animate
                [ attributeName "fill-opacity"
                , begin "500ms"
                , dur "1s"
                , values "1;.2;1"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        , circle [ cx "92.5", cy "92.5", r "12.5" ]
            [ animate
                [ attributeName "fill-opacity"
                , begin "200ms"
                , dur "1s"
                , values "1;.2;1"
                , calcMode "linear"
                , repeatCount "indefinite"
                ]
                []
            ]
        ]


{-| Rings loading indicator.
-}
rings : List Option -> Html msg
rings options =
    let
        model =
            init options
    in
    svg
        [ width (String.fromInt model.size)
        , height (String.fromInt model.size)
        , stroke model.color
        , viewBox "0 0 45 45"
        ]
        [ g [ fill "none", fillRule "evenodd", transform "translate(1 1)", strokeWidth "2" ]
            [ circle [ cx "22", cy "22", r "6", strokeOpacity "0" ]
                [ animate
                    [ attributeName "r"
                    , begin "1.5s"
                    , dur "3s"
                    , values "6;22"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                , animate
                    [ attributeName "stroke-opacity"
                    , begin "1.5s"
                    , dur "3s"
                    , values "1;0"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                , animate
                    [ attributeName "stroke-width"
                    , begin "1.5s"
                    , dur "3s"
                    , values "2;0"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            , circle [ cx "22", cy "22", r "6", strokeOpacity "0" ]
                [ animate
                    [ attributeName "r"
                    , begin "3s"
                    , dur "3s"
                    , values "6;22"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                , animate
                    [ attributeName "stroke-opacity"
                    , begin "3s"
                    , dur "3s"
                    , values "1;0"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                , animate
                    [ attributeName "stroke-width"
                    , begin "3s"
                    , dur "3s"
                    , values "2;0"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            , circle [ cx "22", cy "22", r "8" ]
                [ animate
                    [ attributeName "r"
                    , begin "0s"
                    , dur "1.5s"
                    , values "6;1;2;3;4;5;6"
                    , calcMode "linear"
                    , repeatCount "indefinite"
                    ]
                    []
                ]
            ]
        ]



-- Options


{-| Size defines the width of the loading indicator,
the height is adjusted accordingly if necessary to
retain the correct aspect ratio.
-}
size : Int -> Option
size v model =
    { model | size = v }


{-| Color defines the primary color of the indicator.
-}
color : String -> Option
color v model =
    { model | color = v }
