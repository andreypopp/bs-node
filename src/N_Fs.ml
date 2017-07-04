type stat_impl = <
  dev : int;
  ino : int;
  mode : int;
  nlink : int;
  uid : int;
  gid : int;
  rdev : int;
  size : int;
  blksize : int;
  blocks : int;
  atimeMs : int;
  mtimeMs : int;
  ctimeMs : int;
  birthtimeMs : int;
  isFile : unit -> bool [@bs.meth];
  isDirectory : unit -> bool [@bs.meth];
  isBlockDevice : unit -> bool [@bs.meth];
  isCharacterDevice : unit -> bool [@bs.meth];
  isSymbolicLink : unit -> bool [@bs.meth];
  isFIFO : unit -> bool [@bs.meth];
  isSocket : unit -> bool [@bs.meth];
> Js.t

type stat = {
  dev : int;
  ino : int;
  mode : int;
  nlink : int;
  uid : int;
  gid : int;
  rdev : int;
  size : int;
  blksize : int;
  blocks : int;
  atimeMs : int;
  mtimeMs : int;
  ctimeMs : int;
  birthtimeMs : int;
  of_type : [ `File | `Directory | `BlockDevice | `CharacterDevice | `SymbolicLink | `FIFO | `Socket ];
}

type fd = int
type path = string

let convert_stat stat_impl =
  Js.Promise.resolve {
    dev = stat_impl##dev;
    ino = stat_impl##ino;
    mode = stat_impl##mode;
    nlink = stat_impl##nlink;
    uid = stat_impl##uid;
    gid = stat_impl##gid;
    rdev = stat_impl##rdev;
    size = stat_impl##size;
    blksize = stat_impl##blksize;
    blocks = stat_impl##blocks;
    atimeMs = stat_impl##atimeMs;
    mtimeMs = stat_impl##mtimeMs;
    ctimeMs = stat_impl##ctimeMs;
    birthtimeMs = stat_impl##birthtimeMs;
    of_type =
      if stat_impl##isFile () then `File
      else if stat_impl##isDirectory () then `Directory
      else if stat_impl##isSymbolicLink () then `SymbolicLink
      else if stat_impl##isBlockDevice () then `BlockDevice
      else if stat_impl##isCharacterDevice () then `CharacterDevice
      else if stat_impl##isSocket () then `Socket
      else `FIFO
  }


external stat_impl : path -> stat_impl Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let stat filename = Js.Promise.then_ convert_stat (stat_impl filename)

external fstat_impl : path -> stat_impl Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let fstat filename = Js.Promise.then_ convert_stat (fstat_impl filename)

external lstat_impl : path -> stat_impl Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let lstat filename = Js.Promise.then_ convert_stat (lstat_impl filename)

external chmod_impl : path -> int -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let chmod = chmod_impl

external chown_impl : path -> int -> int -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let chown = chown_impl

external fopen_impl :
  path ->
  ([ `Read [@bs.as "r"]
   | `ReadWrite [@bs.as "r+"]
   | `ReadWriteSync [@bs.as "rs+"]
   | `Write [@bs.as "w"]
   | `WriteFailIfExists [@bs.as "wx"]
   | `WriteRead [@bs.as "w+"]
   | `WriteReadFailIfExists [@bs.as "wx+"]
   | `Append [@bs.as "a"]
   | `AppendFailIfExists [@bs.as "ax"]
   | `AppendRead [@bs.as "a+"]
   | `AppendReadFailIfExists [@bs.as "ax+"]
   ] [@bs.string]) ->
  fd Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let fopen = fopen_impl

external fchmod_impl : fd -> int -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let fchmod = fchmod_impl

external fchown_impl : fd -> int -> int -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let fchown = fchown_impl

external fclose_impl : fd -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let fclose = fclose_impl

external link_impl : path -> path -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let link = link_impl

external mkdir_impl : path -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let mkdir = mkdir_impl

external readdir_impl : path -> path array Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]

let readdir path =
  Js.Promise.then_
    (fun items -> Js.Promise.resolve (Array.to_list items))
    (readdir_impl path)

external readlink_impl : path -> path Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let readlink = readlink_impl

external realpath_impl : path -> path Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let realpath = realpath_impl

external rename_impl : path -> path -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let rename = rename_impl

external rmdir_impl : path -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let rmdir = rmdir_impl

external read_file_string_impl : path -> string Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let read_file_string = read_file_string_impl

external read_file_impl : path -> Node_buffer.t Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let read_file = read_file_impl

external fread_file_string_impl : fd -> string Js.Promise.t = "read_file_string" [@@bs.module "../../../js/N_Fs_impl"]
let fread_file_string = fread_file_string_impl

external fread_file_impl : fd -> Node_buffer.t Js.Promise.t = "read_file" [@@bs.module "../../../js/N_Fs_impl"]
let fread_file = fread_file_impl

external write_file_string_impl : path -> string -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let write_file_string = write_file_string_impl

external write_file_impl : path -> Node_buffer.t -> unit Js.Promise.t = "" [@@bs.module "../../../js/N_Fs_impl"]
let write_file = write_file_impl

external fwrite_file_string_impl : fd -> string -> unit Js.Promise.t = "write_file_string" [@@bs.module "../../../js/N_Fs_impl"]
let fwrite_file_string = fwrite_file_string_impl

external fwrite_file_impl : fd -> Node_buffer.t -> unit Js.Promise.t = "write_file" [@@bs.module "../../../js/N_Fs_impl"]
let fwrite_file = fwrite_file_impl
