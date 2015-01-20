gulp         = require 'gulp'
handleErrors = require '../../util/handleErrors'
config       = require('../../config').production.images

gulp.task 'productionImages', ->
  gulp.src config.src
    .on 'error', handleErrors
    .pipe gulp.dest config.dest