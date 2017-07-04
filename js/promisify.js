function promisify(f, options) {
  options = options || {};
  return function() {
    var args = arguments;
    return new Promise(function(resolve, reject) {
      function toPromise(err, result) {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      }
      if (options.appendArgs) {
        Array.prototype.push.apply(args, options.appendArgs);
      }
      Array.prototype.push.call(args, toPromise);
      f.apply(null, args);
    });
  }
}

module.exports = promisify;
