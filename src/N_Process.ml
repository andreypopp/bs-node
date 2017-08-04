external exit : int -> unit = "" [@@bs.module "process"]
external argv_impl : string array = "argv" [@@bs.module "process"]

let argv =
  Array.to_list argv_impl
