module type Iterable = sig
  type 'a t
  val iter : ('a -> unit) -> 'a t -> unit
end

module type S = sig
  type 'a t
  val f : string t -> unit
end

module Make(Dep: Iterable) : S with type 'a t := 'a Dep.t = struct
  let f = Dep.iter (fun s -> Out_channel.output_string stdout (s ^ "\n"))
end
