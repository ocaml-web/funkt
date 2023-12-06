module String = struct
  include String
  module Set = Set.Make(String)
end

let _ =
  stdin
  |> In_channel.input_lines
  |> List.concat_map Str.(split (regexp "[ \t.,;:()]+"))
  |> String.Set.of_list
  |> String.Set.iter print_endline
