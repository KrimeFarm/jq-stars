module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON("package.json")

    # Compile CoffeeScript + Plugins
    coffee:
      compile:
        files:
          "js/h-slider.js": ["coffeescript/jq-stars.coffee"]
          "js/main.js": ["coffeescript/main.coffee"]

    # Compile Less
    less:
      development:
        options:
          paths: ["less"]
        files:
          "css/style.css": "less/style.less"

    # Uglify javascript files
    uglify:
      options:
        mangle: false
      my_target:
        files:
          "js/jq-stars.min.js": ["js/jq-stars.js"]

    # Watch files changes and compile what it needs to be
    # compiled.
    watch:
      less:
        files: "less/*.less"
        tasks: ["newer:less"]
      coffee:
        options:
          livereload: true
        files: ["coffeescript/*.*"]
        tasks: ["newer:coffee"]
      html:
        options:
          livereload: true
        files: ["*.html"]

  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-newer"

  # The main build task
  grunt.registerTask "build", [
    "less"
    "newer:coffee"
    "newer:uglify"
  ]

  # Build and watch for changes
  grunt.registerTask "default", [
    "build"
    "watch"
  ]

  return
