module Array = struct
  include Stdlib.Array
  include ScanLeft.Make(Stdlib.Array)
end

module List = struct
  include List
  include ScanLeft.Make(struct
    include List
    let of_list = Fun.id
  end)
end

let pp_sep ppf () = Format.fprintf ppf "; "

let _ =
  let a = Array.(init 10 Fun.id |> scan_left ( + ) 0) in
  Format.(printf "[| %a |]\n" (pp_print_array ~pp_sep pp_print_int) a)

let _ =
  let u = List.(init 10 Fun.id |> scan_left ( + ) 0) in
  Format.(printf "[ %a ]\n" (pp_print_list ~pp_sep pp_print_int) u)
