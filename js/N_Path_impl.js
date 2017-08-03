var path = require('path');

module.exports = {
  join: path.join,
  join_impl: function(paths) {
    return path.join(...paths);
  },
  dirname_impl: path.dirname,
  basename_impl: path.basename,
};
