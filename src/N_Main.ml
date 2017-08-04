let run ?(code=1) main =
  let handle_error err =
    Js.log err;
    N_Process.exit code;
    Js.Promise.resolve ()
  in
  Js.Promise.catch handle_error main
