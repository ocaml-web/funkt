module type LeftFoldable = sig
  type 'a t
  val fold_left : ('b -> 'a -> 'b) -> 'b -> 'a t -> 'b
  val of_list : 'a list -> 'a t
end

module type S = sig
  type 'a t
  val scan_left : ('b -> 'a -> 'b) -> 'b -> 'a t -> 'b t
end

module Make(F: LeftFoldable) : S with type 'a t := 'a F.t = struct
  let scan_left f b u =
    let f (b, u) a = let b' = f b a in (b', b' :: u) in
    u |> F.fold_left f (b, []) |> snd |> List.rev |> F.of_list
end
