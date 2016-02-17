/* this gulpfile is based on http://sixrevisions.com/web-performance/improve-website-speed/ */

var gulp = require('gulp'),
	gutil = require('gulp-util'),
	cache = require('gulp-cache'),
	debug = require('gulp-debug'),
	less = require('gulp-less')
	concatcss = require('gulp-concat-css'),
	minifycss = require('gulp-minify-css'),
	concat = require('gulp-concat'),
	jshint = require('gulp-jshint'),
	uglify = require('gulp-uglify'),
	imagemin = require('gulp-imagemin');

//gulp.task('default', ['less', 'css-jquery-ui', 'apply_datepicker', 'apply_placeholder', 'form_enhanced', 'placeholder', 'img'], function () {});
gulp.task('default', ['js-aggregate-Workstream'], function () {
	return gutil.log('Common gulp ran');
});

gulp.task('less', function() {
	gulp.src('css/less/ccd_production.less')
		.pipe(debug({title: 'LESS:'}))
		.pipe(less())
		.pipe(concat('bootstrap-combined.css'))
		.pipe(gulp.dest('css'))
		.pipe(gulp.dest('../../dist/css'))
		.pipe(concat('bootstrap-combined.min.css'))
		.pipe(minifycss())
		.pipe(gulp.dest('../../dist/css'));
});

// CSS concatenation + minification tasks
gulp.task('css-bootstrap', function() {
	gutil.log('CSS:');
	return gulp.src(['css/bootstrap-combined.css'])
		.pipe(debug({title: '...bootstrap-combined.css task is running'}))
		.pipe(concatcss('bootstrap-combined.min.css'))
		.pipe(minifycss())
		.pipe(gulp.dest('../../dist/css'));
});
gulp.task('css-jquery-ui', function() {
	gutil.log('CSS:');
	return gulp.src(['css/jquery-ui.css'])
		.pipe(debug({title: '...jquery-ui.min.css task is running'}))
		.pipe(concatcss('jquery-ui.min.css'))
		.pipe(minifycss())
		.pipe(gulp.dest('../../dist/css'));
});

// JS linting + minification + concatenation tasks
gulp.task('js-aggregate-Workstream', function() {
	gutil.log('...js task is running');
	return gulp.src([
		'../external-projects/modernizr.custom.40623.js',
		'../external-projects/jquery.js',
		'../external-projects/jquery-ui.js',
		'../external-projects/bootstrap.js',
		'common_files/js/script.js',
		'../external-projects/DataTables/jquery.dataTables.js',
		'../external-projects/DataTables/dataTables.tableTools.js',
		'../external-projects/DataTables/dataTables.bootstrap.js',
		'../external-projects/highcharts.com/js/highcharts.src.js'
	])
	.pipe(debug({title: 'js-aggregate-Workstream:'}))
	.pipe(concat('Workstream.js'))
	.pipe(gulp.dest('common_files/js'))
	.pipe(concat('Workstream.min.js'))
	.pipe(uglify({ preserveComments:'some' }))
	.pipe(gulp.dest('common_files/js'));
});
gulp.task('apply_datepicker', function() {
	gutil.log('...apply_datepicker task is running');
	
	return gulp.src([
		'js/apply_datepicker.js'
	])
		.pipe(concat('apply_datepicker.min.js'))
		.pipe(uglify({ preserveComments:'some' }))
		.pipe(gulp.dest('common_files/js'));
});

gulp.task('apply_placeholder', function() {
	gutil.log('...apply_placeholder task is running');
	
	return gulp.src([
		'js/apply_placeholder.js'
	])
		.pipe(concat('apply_placeholder.min.js'))
		.pipe(uglify({ preserveComments:'some' }))
		.pipe(gulp.dest('common_files/js'));
});

gulp.task('form_enhanced', function() {
	gutil.log('...form_enhanced task is running');
	
	return gulp.src([
		'js/form_enhanced.js'
	])
		.pipe(gulp.dest('../../dist/js'))
		.pipe(concat('form_enhanced.min.js'))
		.pipe(uglify({ preserveComments:'some' }))
		.pipe(gulp.dest('../../dist/js'));
});

gulp.task('placeholder', function() {
	gutil.log('...placeholder task is running');
	
	return gulp.src([
		'js/jquery.placeholder.js'
	])
		.pipe(concat('jquery.placeholder.min.js'))
		.pipe(uglify({ preserveComments:'some' }))
		.pipe(gulp.dest('../../dist/js'));
});

// Image optimization task
gulp.task('img', function () {
	gutil.log('...img task is running for CCD/sourcecode/common_files/img/**/*');
	
	return gulp.src(['img/**/*', '!img/**/*barcode*', '!img/**/g-*.png', '!img/**/i-*.png', '!img/**/m-*.png', '!img/**/pivot-*.png']) //don't want to optimize barcode images	
//		.pipe(debug({title: 'IMAGES:'}))
		.pipe(cache(imagemin({ optimizationLevel: 5, progressive: true, interlaced: true })))
		.pipe(gulp.dest('../../dist/img'));
});