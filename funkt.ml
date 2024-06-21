module StringSet = Set.Make(struct
  type t = string
  let compare = String.compare
end)
