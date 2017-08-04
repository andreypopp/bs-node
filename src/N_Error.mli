module Errno : sig
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

  val to_int : t -> int
  val of_int : int -> t
end

type io_error = {errno: int}

val handle_error : 'a Js.Promise.t -> ('a, Js.Exn.t) Js.Result.t Js.Promise.t

val handle_io_error : 'a Js.Promise.t -> ('a, io_error) Js.Result.t Js.Promise.t
