type io_error = {errno: int}

external to_io_error : Js.Promise.error -> < errno : int Js.Undefined.t  > Js.t = "%identity"
external to_error : Js.Promise.error -> Js.Exn.t = "%identity"

let throw_error : Js.Promise.error -> unit = [%bs.raw{|
  function throw_error(err) {
    throw err;
  }
|}]

let isinstance_Error : 'a -> bool = [%bs.raw{|
  function isinstance_Error(err) {
    return (err instanceof Error);
  }
|}]

let handle_error promise =
  let handle_result result =
    Js.Promise.resolve (Js.Result.Ok result)
  in
  let handle_error error =
    let err = to_error error in
    if isinstance_Error err then
      Js.Promise.resolve (Js.Result.Error err)
    else (
      throw_error error;
      assert false
    )
  in
  promise
  |> Js.Promise.then_ handle_result
  |> Js.Promise.catch handle_error

let handle_io_error promise =
  let handle_result result =
    Js.Promise.resolve (Js.Result.Ok result)
  in
  let handle_error error =
    match Js.Undefined.to_opt (to_io_error error)##errno with
    | Some errno -> Js.Promise.resolve (Js.Result.Error {errno})
    | None ->
      throw_error error;
      assert false
  in
  promise
  |> Js.Promise.then_ handle_result
  |> Js.Promise.catch handle_error
