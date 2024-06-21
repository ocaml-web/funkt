module StringCompare = struct
  type t = string
  let compare = String.compare
end

module StringSet = Set.Make(StringCompare)
