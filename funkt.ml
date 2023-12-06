module StringSet = Set.Make(String)

let _ =
  In_channel.input_lines stdin
  |> List.concat_map Str.(split (regexp "[ \t.,;:()]+"))
  |> StringSet.of_list
  |> StringSet.iter print_endline
