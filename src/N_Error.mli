type io_error = {errno: int}
val handle_error : 'a Js.Promise.t -> ('a, Js.Exn.t) Js.Result.t Js.Promise.t
val handle_io_error : 'a Js.Promise.t -> ('a, io_error) Js.Result.t Js.Promise.t
