var fs = require('fs');
var promisify = require('./promisify');

module.exports = {
  read_file_string_impl: promisify(fs.readFile, {appendArgs: ['utf8']}),
  read_file_impl: promisify(fs.readFile),
  write_file_string_impl: promisify(fs.writeFile, {appendArgs: ['utf8']}),
  write_file_impl: promisify(fs.writeFile),
  stat_impl: promisify(fs.stat),
  fstat_impl: promisify(fs.fstat),
  lstat_impl: promisify(fs.lstat),
  chmod_impl: promisify(fs.chmod),
  fchmod_impl: promisify(fs.fchmod),
  chown_impl: promisify(fs.chown),
  fchown_impl: promisify(fs.fchown),
  fopen_impl: promisify(fs.open),
  fclose_impl: promisify(fs.close),
  link_impl: promisify(fs.link),
  mkdir_impl: promisify(fs.mkdir),
  readdir_impl: promisify(fs.readdir),
  readlink_impl: promisify(fs.readlink),
  realpath_impl: promisify(fs.realpath),
  rename_impl: promisify(fs.rename),
  rmdir_impl: promisify(fs.rmdir),
};
