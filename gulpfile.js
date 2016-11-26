var gulp = require('gulp');
var browserify = require('browserify');
var babelify = require('babelify');
var source = require('vinyl-source-stream');

gulp.task('build', function () {
    return browserify({
			entries: './source/js/main.js',
			extensions: ['.js', ''],
			debug: true
		})
    .transform(babelify.configure({
			presets: ['es2015']
		}))
		.bundle()
		.pipe(source('main.min.js'))
		.pipe(gulp.dest('dist/js'));
});

gulp.task('watch', function () {
  gulp.watch('source/js/**/*.js', ['build']);
  gulp.watch('source/js/**/*.es6', ['build']);
});

gulp.task('default', ['build', 'watch']);
