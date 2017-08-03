type path = string

external join_impl : path list -> path = "" [@@bs.module "../../../js/N_Path_impl"]
let join = join_impl

external dirname_impl : path -> path = "" [@@bs.module "../../../js/N_Path_impl"]
let dirname = dirname_impl

external basename_impl : path -> path = "" [@@bs.module "../../../js/N_Path_impl"]
let basename = basename_impl

module Infix : sig
  val (//) : path -> path -> path
end = struct
  external join : path -> path -> path = "" [@@bs.module "../../../js/N_Path_impl"]
  let (//) a b = join a b
end
