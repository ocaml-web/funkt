module StringSet = Set.Make(String)

module IterPrint : sig
  val f : string list -> unit
end = struct
  let f = List.iter (fun s -> Out_channel.output_string stdout (s ^ "\n"))
end

let _ =
  stdin
  |> In_channel.input_lines
  |> List.concat_map Str.(split (regexp "[ \t.,;:()]+"))
  |> StringSet.of_list
  |> StringSet.elements
  |> IterPrint.f
