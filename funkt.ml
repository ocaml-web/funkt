module StringSet = Set.Make(String)
module IterPrint = IterPrint.Make(List)

let _ =
  stdin
  |> In_channel.input_lines
  |> List.concat_map Str.(split (regexp "[ \t.,;:()]+"))
  |> StringSet.of_list
  |> StringSet.elements
  |> IterPrint.f
