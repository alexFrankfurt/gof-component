gulp   = require "gulp"

coffeescript = require "gulp-coffeescript"

concat = require "gulp-concat"
gutil  = require "gulp-util"

paths =
  coffee: "./src/scripts/*.coffee"

distFolder = "."

gulp.task "watch", ->
  gulp.watch paths.coffee, ["coffee"]

gulp.task "coffee", ->
  gulp.src paths.coffee
    .pipe coffeescript bare: true
      .on "error", ->
        gutil.log
        this.end()
    .pipe gulp.dest distFolder
