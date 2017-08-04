module Errno = struct
  type t = [
    | `ENOENT
    | `ECANCELED
    | `ENOENT
    | `UNKNOWN
    | `OK
    | `EOF
    | `EADDRINFO
    | `EACCES
    | `EAGAIN
    | `EADDRINUSE
    | `EADDRNOTAVAIL
    | `EAFNOSUPPORT
    | `EALREADY
    | `EBADF
    | `EBUSY
    | `ECONNABORTED
    | `ECONNREFUSED
    | `ECONNRESET
    | `EDESTADDRREQ
    | `EFAULT
    | `EHOSTUNREACH
    | `EINTR
    | `EINVAL
    | `EISCONN
    | `EMFILE
    | `EMSGSIZE
    | `ENETDOWN
    | `ENETUNREACH
    | `ENFILE
    | `ENOBUFS
    | `ENOMEM
    | `ENOTDIR
    | `EISDIR
    | `ENONET
    | `ENOTCONN
    | `ENOTSOCK
    | `ENOTSUP
    | `ENOENT
    | `ENOSYS
    | `EPIPE
    | `EPROTO
    | `EPROTONOSUPPORT
    | `EPROTOTYPE
    | `ETIMEDOUT
    | `ECHARSET
    | `EAIFAMNOSUPPORT
    | `EAISERVICE
    | `EAISOCKTYPE
    | `ESHUTDOWN
    | `EEXIST
    | `ESRCH
    | `ENAMETOOLONG
    | `EPERM
    | `ELOOP
    | `EXDEV
    | `ENOTEMPTY
    | `ENOSPC
    | `EIO
    | `EROFS
    | `ENODEV
    | `ESPIPE
    | `ECANCELED
  ]

  let to_int (errno : t) = match errno with
    | `UNKNOWN -> -1
    | `OK -> 0
    | `EOF -> 1
    | `EADDRINFO -> 2
    | `EACCES -> 3
    | `EAGAIN -> 4
    | `EADDRINUSE -> 5
    | `EADDRNOTAVAIL -> 6
    | `EAFNOSUPPORT -> 7
    | `EALREADY -> 8
    | `EBADF -> 9
    | `EBUSY -> 10
    | `ECONNABORTED -> 11
    | `ECONNREFUSED -> 12
    | `ECONNRESET -> 13
    | `EDESTADDRREQ -> 14
    | `EFAULT -> 15
    | `EHOSTUNREACH -> 16
    | `EINTR -> 17
    | `EINVAL -> 18
    | `EISCONN -> 19
    | `EMFILE -> 20
    | `EMSGSIZE -> 21
    | `ENETDOWN -> 22
    | `ENETUNREACH -> 23
    | `ENFILE -> 24
    | `ENOBUFS -> 25
    | `ENOMEM -> 26
    | `ENOTDIR -> 27
    | `EISDIR -> 28
    | `ENONET -> 29
    | `ENOTCONN -> 31
    | `ENOTSOCK -> 32
    | `ENOTSUP -> 33
    | `ENOENT -> 34
    | `ENOSYS -> 35
    | `EPIPE -> 36
    | `EPROTO -> 37
    | `EPROTONOSUPPORT -> 38
    | `EPROTOTYPE -> 39
    | `ETIMEDOUT -> 40
    | `ECHARSET -> 41
    | `EAIFAMNOSUPPORT -> 42
    | `EAISERVICE -> 44
    | `EAISOCKTYPE -> 45
    | `ESHUTDOWN -> 46
    | `EEXIST -> 47
    | `ESRCH -> 48
    | `ENAMETOOLONG -> 49
    | `EPERM -> 50
    | `ELOOP -> 51
    | `EXDEV -> 52
    | `ENOTEMPTY -> 53
    | `ENOSPC -> 54
    | `EIO -> 55
    | `EROFS -> 56
    | `ENODEV -> 57
    | `ESPIPE -> 58
    | `ECANCELED -> 59

  let of_int errno =
    let (errno : t) = match errno with
      | -2 -> `ENOENT
      | -1 -> `UNKNOWN
      | 0 -> `OK
      | 1 -> `EOF
      | 2 -> `EADDRINFO
      | 3 -> `EACCES
      | 4 -> `EAGAIN
      | 5 -> `EADDRINUSE
      | 6 -> `EADDRNOTAVAIL
      | 7 -> `EAFNOSUPPORT
      | 8 -> `EALREADY
      | 9 -> `EBADF
      | 10 -> `EBUSY
      | 11 -> `ECONNABORTED
      | 12 -> `ECONNREFUSED
      | 13 -> `ECONNRESET
      | 14 -> `EDESTADDRREQ
      | 15 -> `EFAULT
      | 16 -> `EHOSTUNREACH
      | 17 -> `EINTR
      | 18 -> `EINVAL
      | 19 -> `EISCONN
      | 20 -> `EMFILE
      | 21 -> `EMSGSIZE
      | 22 -> `ENETDOWN
      | 23 -> `ENETUNREACH
      | 24 -> `ENFILE
      | 25 -> `ENOBUFS
      | 26 -> `ENOMEM
      | 27 -> `ENOTDIR
      | 28 -> `EISDIR
      | 29 -> `ENONET
      | 31 -> `ENOTCONN
      | 32 -> `ENOTSOCK
      | 33 -> `ENOTSUP
      | 34 -> `ENOENT
      | 35 -> `ENOSYS
      | 36 -> `EPIPE
      | 37 -> `EPROTO
      | 38 -> `EPROTONOSUPPORT
      | 39 -> `EPROTOTYPE
      | 40 -> `ETIMEDOUT
      | 41 -> `ECHARSET
      | 42 -> `EAIFAMNOSUPPORT
      | 44 -> `EAISERVICE
      | 45 -> `EAISOCKTYPE
      | 46 -> `ESHUTDOWN
      | 47 -> `EEXIST
      | 48 -> `ESRCH
      | 49 -> `ENAMETOOLONG
      | 50 -> `EPERM
      | 51 -> `ELOOP
      | 52 -> `EXDEV
      | 53 -> `ENOTEMPTY
      | 54 -> `ENOSPC
      | 55 -> `EIO
      | 56 -> `EROFS
      | 57 -> `ENODEV
      | 58 -> `ESPIPE
      | 59 -> `ECANCELED
      | _ -> `UNKNOWN
    in errno

end

type io_error = {errno: Errno.t}

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
    | Some errno ->
      Js.Promise.resolve (Js.Result.Error {errno = Errno.of_int errno})
    | None ->
      throw_error error;
      assert false
  in
  promise
  |> Js.Promise.then_ handle_result
  |> Js.Promise.catch handle_error
