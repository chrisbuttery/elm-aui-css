port module Demo.Ports exposing (blur, focus)


port blur : String -> Cmd msg


port focus : String -> Cmd msg
