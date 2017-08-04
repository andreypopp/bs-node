# BuckleScript bindings for Node API

This is a set of bindings for [BuckleScript][] to [NodeJS][] API.

Every async function is made to return `a Js.Promise.t`.

API:

- [x] `N.Fs`
- [x] `N.Path`
- [x] `N.Error`
- [ ] `N.ChildProcess`
- [ ] `N.Http`

## Using with ppx_let (async/await like syntax)

TODO

## Error handling

### Handling I/O errors

TODO

### Handling other errors

TODO

[BuckleScript]: https://github.com/bucklescript/bucklescript
[NodeJS]: https://nodejs.org/
